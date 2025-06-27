const barChartData = {
    labels: [
        "Kota Banda Aceh", "Kota Lhokseumawe", "Bireuen", "Pidie", "Aceh Barat",
        "Kota Langsa", "Aceh Tengah", "Aceh Selatan", "Aceh Timur", "Aceh Tenggara",
        "Aceh Utara", "Aceh Besar", "Gayo Lues", "Bener Meriah", "Kota Sabang",
        "Aceh Tamiang", "Aceh Singkil", "Aceh Barat Daya", "Simeulue", "Aceh Jaya",
        "Kota Subulussalam", "Pidie Jaya"
    ],
    datasets: [{
        label: "Jumlah Rumah Sakit",
        data: [15, 11, 6, 6, 4, 3, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1],
        backgroundColor: "rgba(75, 192, 192, 0.6)",
        borderColor: "rgba(75, 192, 192, 1)",
        borderWidth: 1
    }]
};

const pieChartData = {
    labels: [
        "Pemkab", "SWASTA/LAINNYA", "Organisasi Sosial", "Perusahaan",
        "Pemkot", "Kementerian Lain", "TNI AD", "Pemprop",
        "BUMN", "Perorangan", "POLRI", "TNI AL"
    ],
    datasets: [{
        data: [21, 18, 10, 7, 4, 4, 3, 3, 2, 2, 1, 1],
        backgroundColor: [
            "#FF6384", "#36A2EB", "#FFCE56", "#4BC0C0",
            "#9966FF", "#FF9F40", "#66CDAA", "#DC143C",
            "#6495ED", "#FFD700", "#20B2AA", "#FF4500"
        ]
    }]
};

new Chart(document.getElementById("barChart"), {
    type: "bar",
    data: barChartData,
    options: {
        responsive: true,
        scales: {
            x: {
                ticks: {
                    maxRotation: 45,
                    minRotation: 45
                }
            },
            y: {
                beginAtZero: true,
                ticks: {
                    stepSize: 1
                }
            }
        }
    }
});

new Chart(document.getElementById("pieChart"), {
    type: "pie",
    data: pieChartData,
    options: {
        responsive: true
    }
});
