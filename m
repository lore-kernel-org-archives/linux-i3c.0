Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 948EFD12671
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Dec 2025 21:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RtWCCQkF68ysctqfiOPhejJ5N53EnpcqGK3XIQGcdaM=; b=pXdMmhmPkUZosT
	E8wyKMIZ1CT1CU9oKbnDIx0zdMIMmsBguIIV0m/FQXItDBtTNZHRlgs+9vNKCwdJGtBbJQeI1FbHw
	BhnfLQnmMiJ9aIIeZNwMeL+QFOP/9pSxi3uRpmR1LShgF+S5BjcGYOYHNY3JwAYKF5grdVneinmQ9
	/CtwY4Bm0pJj/Zsm1m7hx5XKHjWSDjL5DJvaJF4ge3p/0nrLvJG1clqE8cThVO4jA6+gbusnPh582
	g3gNbwiOnaar7giRVqGMIkj6YJVA5bWkKrTi9lVDAWYdpti8btIt4qbvwF4x+NJ2t7wz7H4TJL368
	BMuM82mlFKm0FGa1c5hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQXiv-00000005q3R-0Nr2;
	Tue, 02 Dec 2025 21:15:49 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQXir-00000005q2t-416j
	for linux-i3c@lists.infradead.org;
	Tue, 02 Dec 2025 21:15:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mW2HHMe5aDYrAcMJK2kZTn1gHUL0uA48vNYXMjPjrZ3iKX7wp6vUVr//HuWhy5PzfBpPK0ZhWu1EQur3jV1xv1ob9W9to+73dzoNjH8lV8vJ0J0SuN+uGma19WeErNn10SR2XnE13hA0+FLH7GgSBTj12gz/lLDBKFLeCiDCg2o6iaOFvmV4PHOx7PnbTBtldy10W6nj8VymW8Nd1NfanJ4G2YlIKpY4A8RRmkZkTE9aGjvmTv4QVcfch8Qk01VPb2xw5uA2LAWBnCC4n1RoUtsHbo0IuBLUmN6BeDB6fU/JoR8WKq84k36vieoF1PB6XfUOX71pSUMuAxWW39OxOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z2pm+X0U2oOlntOrHkpo/4jju98O8/mlBQHRk+86pcI=;
 b=xQd1gWi8muVCLyfOxLLOfE0eExgtYixh0Tdl9/srohs2wRlzEISCXoI/iREukZETLilSEyixVE8KQW4Upe7or5YT7Bras7jRqTnTypeqwYhfgoLevgb9p00wUM064HhEO+Vu7X+0HImUVzDI9870KlMd6L4E5t3kH7ivyAGYvGDAOGgaChpf5xw6TE0eheixmxcySf6PSsMO1OsIC0n38A//KBkhDejG4qVidm8nv7W2a4D14QaRfGANPN8FhCRsd7W8OvuRPCGVN66h66QWtXapR6Um0uLbl5yXf76OK/4fq9RqqQ8C30RVujmyd6Zx41iHUkUUdwXFbYeV9U9iAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2pm+X0U2oOlntOrHkpo/4jju98O8/mlBQHRk+86pcI=;
 b=Z2ccbNj8ibS/30+rj7o7CymEja7EA501dNQqhotfpBEgyLYSwbexDqCrfUdWIC2fy8Je2pDo7FaKHWftU8tvDrvYeAhrwKeP0Z57y9oz9cLMyeSmqXCXIKe4puDouMKTOYuRj3CQYrtUPz/ZMNpjz9WbD6jvSqF0IiH1vay88MNsedZEzdAJ435ZXWoVnL6Q2oF1RsTaRPGYPefXSSyDMUsNZNZIs1yyLHSU5sou96vyC1WUn9HUK602rUJhwA3eyh71cPSO8kdhXqs/td4ZJNBKkqQ8OXmIMxuQqDmbLhTaFfWrU1/8zZXQ3s00hzeVjzcrZN3zKSnU5Bwt+QPSFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PAXPR04MB8368.eurprd04.prod.outlook.com (2603:10a6:102:1bf::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 21:15:35 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 21:15:35 +0000
Date: Tue, 2 Dec 2025 16:15:30 -0500
From: Frank Li <Frank.li@nxp.com>
To: adrianhoyin.ng@altera.com
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/5] i3c: dw: Add support for Device NACK Retry
 configuration
Message-ID: <aS9W8lvwAHLCkb2t@lizhi-Precision-Tower-5810>
References: <cover.1764663888.git.adrianhoyin.ng@altera.com>
 <6ea3449f6bc533b6fe3d8c4fbfbc0801d786320e.1764663888.git.adrianhoyin.ng@altera.com>
Content-Disposition: inline
In-Reply-To: <6ea3449f6bc533b6fe3d8c4fbfbc0801d786320e.1764663888.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: PH7P221CA0078.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:328::9) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PAXPR04MB8368:EE_
X-MS-Office365-Filtering-Correlation-Id: 840c78c8-a192-4c51-db75-08de31e7ef2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|19092799006|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CQQ8YKP2gTuXnxPo82UuqP0u+gSnjJqBic/gTJ0/rD29dmoZWA3j6uq6j2g+?=
 =?us-ascii?Q?KUfXJS5ONWz9myHzWONRH0XfXxbr2ZBdankNeynbxfNJmsLEAzVEg/DNxqBG?=
 =?us-ascii?Q?XirDMBHO+/cuSqtl5kBl1xz4y88KWSWbPnUvKJOicL4E18d3Jn78i/tvL59C?=
 =?us-ascii?Q?RWTmOt3Yo8amPoCZM1INTnDq+gWKknKUlTsPmpcDQ54ENB/sxbnkk0Prgatr?=
 =?us-ascii?Q?XPjKdi8F5GPYIWEJLZzUfvg9NixdJD2aajiEUdfx7yc2AOjbrDxknqs2TXXg?=
 =?us-ascii?Q?GE2Uch55Z5pdGzupfkqdhuJa3D5LxWzw38UEeH8zNM61N9wTwTwji2g6lSnw?=
 =?us-ascii?Q?pOFYp+01yHb2EfjDVkFdu4G9Mriz0QVItmQoC/ZxxEvMGbpd19smjg09zvgv?=
 =?us-ascii?Q?x31z9lq/qREO6Mzu+WnX/BCTYcjnDGHo1qNhaQ4Y1esSWTTgfHBBo3Mi0kVR?=
 =?us-ascii?Q?uRyaRAO2jXr+TSNA4MoW+MTffIfEA+IQ3K9y1nmvT1BbMf4wSGfHsHYEEn+O?=
 =?us-ascii?Q?gbeTjaQ6ueCKZj+jszX2YoIIHPhGeDO3Et8U5WlCji8d8qDjRFdajcV0w7XE?=
 =?us-ascii?Q?ThwxhLj4NnXsZwcm5snbC8TwDIC/AAmuLd4bMWR4JWGwMMSmTQLOLfFkwlAu?=
 =?us-ascii?Q?8U01Zx/4Bip5fKX8VlRjqF711HOehSxbqNd5vYsRfqnfaHZ6sT2RltTN85A4?=
 =?us-ascii?Q?jh6+ymfp2HTCiXtiDFl+W3N70dbgcnqgjJos1RJ6OYvXQIB6qJJzv5xaEbOS?=
 =?us-ascii?Q?fqI8FkjDTdmfugpltyAmp6Ihka3yuFrVhk2019bsTYDPNmRt6YtTNEhWkPNo?=
 =?us-ascii?Q?9XqWnS50OnkhvIxVsUBUNRo22T/HT/hPxxjAc7orgUvXjOsj5uJvdyPcq8X1?=
 =?us-ascii?Q?9w4jEtjsDyPz1/cb4C57qd1pP3Q+Gh1A5e+C/bMvEdptcIxd2ohkVFucJpVK?=
 =?us-ascii?Q?KeKGoEF0lUo3a5lWHbbR04VD8Y1O9TO0ZcHpUv94YSFbNqzr59qx5tM2okrv?=
 =?us-ascii?Q?bsy69IR8TpC4/q18/XZF9CdDIWlWnZZCn9tbeSFJ0vpqoTFCoptSI8PZwaia?=
 =?us-ascii?Q?07yTdvZyfHuEEb9+VOuAc0EjDzuTTz7S7WVVhyjGgvDnRuGwCIogpQ5nqlGi?=
 =?us-ascii?Q?5nCWcll9XRSm/XGS66L87u4Gfcr81fj4YRNxOo8FIM7AgTUmR0EYQ4tXAjCt?=
 =?us-ascii?Q?F/DI04EVGolHn2aatUiZhV7Epwc33eLuyL8wpp9uJMoWY/cq4YyIqSOIhIs+?=
 =?us-ascii?Q?XHs+1RkNzxg8b1mZ2HFox2kXrP6+JvtnlLvh+qlMT4E+MA9gAbRiMbGkqPc1?=
 =?us-ascii?Q?Hei5faxD2fAS5ifAw0shYseHZ7Aw630QVN3kfB+rYfQFWSTFOc3Pyr9eUmbQ?=
 =?us-ascii?Q?Ii9sc109ZBR934Is/oltABCMzOG44B/ljUApsVHHeJjASNU+1tIzBmEeUD+e?=
 =?us-ascii?Q?DXOqc7drW8o3huSwZpBPpCA2ZpU0nGvjkP3276FMrmLOX1aRJEedkHDlULta?=
 =?us-ascii?Q?7SyJBsUVQtPtvb/qponDFNC7CNjveRjrzFCg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(19092799006)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jg4lCB3IJ4WI0qV6cn4/ldpJLWgW+txsKhwEBqiYM2djnvB6DbuGjYp0okSI?=
 =?us-ascii?Q?cq3pv9qbRqEcSxnsv29fYn9qXa73l5BiyJmH49vayiqcOEvu4i3TSSlY2uB2?=
 =?us-ascii?Q?mPAGMaECEoM6ZyArtDZ5NbcG6GyFrULsFRk8dUxx4bnPoXo9ogrsqSM7vgI+?=
 =?us-ascii?Q?vWXHMK9XL2jo8X6Enk8bDwWq4RyzZnlrYA11Jv1PUEa5w6bhUZbAjx2ZH2/4?=
 =?us-ascii?Q?8Alg/MTkvBXmck5xC7tOyfRG+jPlw1qShgJd8PjoQC3bKSTfvk8FJHH3HAZf?=
 =?us-ascii?Q?Q2FEjSFzU0ur0lcptNmlfimaKdbaQODz4BETTaCWBc+SoPPkrAE6Os6Y7nKW?=
 =?us-ascii?Q?K5RE8hyXYzo3PnbOCPbF0Dimhz+YFrPAv4T8nEEoahNXOI1BTX6KDj94n0Yc?=
 =?us-ascii?Q?Hx4ZM5KUCXWvov+h2geryn4VkelVT4e7ORKgRMB6S303NR1VmwiZbGxFQHD8?=
 =?us-ascii?Q?d6xWKWBKHIlpYZiJIJOjLx7ikBRg0Ax9yQ/aNUqv+TgQRs1vbfZdg1Al8tuj?=
 =?us-ascii?Q?V5fRyn9ADR+fU0VaRIgdNUpc4tLCTWSrJVcd+jxi69KP4LQOenqo1SZNKRXr?=
 =?us-ascii?Q?gl3nUW2O7Cctg5+zYHeWEa/lotXZdVBHu8ifihpda/KwF483zqiIWee0ZjXR?=
 =?us-ascii?Q?6xCmIAQAxbkQpKiTLEJWxXqkTN2DyYvIWruz01Mnh8Y3gpCeT7tFk84C4X88?=
 =?us-ascii?Q?LPmwq+bO+KgrwiqfE0U6h3EPyl13Q+pImO+wtdsfKy9VjW83LJW9Hki2S88x?=
 =?us-ascii?Q?dsYpcQcWjMG3gLZAQva6ox1Uvgm3sV+D7yB2J7dTK9n7+Q0CXo4r7Rglfuct?=
 =?us-ascii?Q?tRzEnGpcXN87KGYa3iWVq9BdLRz5PFUNMifH+NTmFaFouVjl2wltYD3Rw8Ig?=
 =?us-ascii?Q?lr8oy2XDMMchOeWuvkYz+MqKNrEA/hEZpFscPVMs3XZVcEK7G6jee8YUuH4s?=
 =?us-ascii?Q?cK++rZeT+ayZndNny4P+ZJ5MGG3Zxr/IVA3nXsz1yaICG7iPFH7sbV1jxUsB?=
 =?us-ascii?Q?r7PSbgl4Oxrkoh/589VWOngRhR6yIFkGCLDgH1zu5+A1wFb45zrgPFyUI95e?=
 =?us-ascii?Q?Iv3v9YIuOYoYHStk6kkO9LHtHisEH+oXgdq5+IxSC43kvN3zTDK+C5cwgtzJ?=
 =?us-ascii?Q?x5XtGRWcYJe08RJSGFLHPAwtdrlgI81ap2FbFXkLc51n6EUbPTef8sA5VQQ4?=
 =?us-ascii?Q?bx2PfQFBWqDw2jyrGZi2/06V47xBzDzPFGfsCaBscdCUfTjYEd7m3xkZ/jDd?=
 =?us-ascii?Q?KhPaGpjG9sEMItQxIjZImG5qCDxUivmMAT1W3iDOrbnyv7P/6j+gFgy3mx5n?=
 =?us-ascii?Q?Tdo7T2y8M4Wpo7edHC3ATzjbiH17TFhnBxDYgT2hPuQa8qxT3XBWvhgyLaEg?=
 =?us-ascii?Q?ZjYtfXhHvCx7RZ2D3UxvPrBwviNB3RT435l+zuRCCznmQyOzY+FKD2JiMX3c?=
 =?us-ascii?Q?QrypYbrfLPleAnTwsvUdvAxdyxq3qJQSgMbE021qQuqoQzIr1UhJ4Jtu6eW4?=
 =?us-ascii?Q?fM3i4Gr7ncxxdD0a+bT5so1wqkDZ2URVAwQnUe7RkppEj6d6O4hjsJ4Jul1r?=
 =?us-ascii?Q?hlkJRTa1bayg4r0VJZjzDAbUF3diGpyyztqtYtV5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 840c78c8-a192-4c51-db75-08de31e7ef2b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 21:15:35.4091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gWIEKL4bbFinx8bmgwIvpR1/XKNO1obn6KBkNkQcZtLAeZ5UDPbofs6pA15XAWSsovPYVjFNemPEEx3JzI1EmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8368
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_131546_003083_477CEE30 
X-CRM114-Status: GOOD (  24.28  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Tue, Dec 02, 2025 at 04:26:11PM +0800, adrianhoyin.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
>
> The DesignWare I3C controller supports automatically retrying transactions
> when a device NACKs. This is useful for slave devices that may be
> temporarily busy and not ready to respond immediately.
>
> Add new ops to configure all active DAT entry with dev_nack_retry during
> runtime. Returns error when value exceeds hw specified limit.
>
> Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
> ---
>  drivers/i3c/master/dw-i3c-master.c | 36 ++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 9ceedf09c3b6..8288888be591 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -204,8 +204,10 @@
>  #define EXTENDED_CAPABILITY		0xe8
>  #define SLAVE_CONFIG			0xec
>
> +#define DW_I3C_DEV_NACK_RETRY_CNT_MAX	0x3
>  #define DEV_ADDR_TABLE_IBI_MDB		BIT(12)
>  #define DEV_ADDR_TABLE_SIR_REJECT	BIT(13)
> +#define DEV_ADDR_TABLE_DEV_NACK_RETRY_CNT(x)	(((x) << 29) & GENMASK(30, 29))

Use FEILD_PREP()

>  #define DEV_ADDR_TABLE_LEGACY_I2C_DEV	BIT(31)
>  #define DEV_ADDR_TABLE_DYNAMIC_ADDR(x)	(((x) << 16) & GENMASK(23, 16))
>  #define DEV_ADDR_TABLE_STATIC_ADDR(x)	((x) & GENMASK(6, 0))
> @@ -1484,6 +1486,39 @@ static irqreturn_t dw_i3c_master_irq_handler(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
>
> +static int dw_i3c_master_set_dev_nack_retry(struct i3c_master_controller *m)
> +{
> +	struct dw_i3c_master *master = to_dw_i3c_master(m);
> +	u32 reg;
> +	int i;
> +
> +	if (m->dev_nack_retry > DW_I3C_DEV_NACK_RETRY_CNT_MAX) {
> +		dev_err(&master->base.dev,
> +			"Value %x exceeds maximum %d\n",
> +			m->dev_nack_retry, DW_I3C_DEV_NACK_RETRY_CNT_MAX);
> +		return -ERANGE;
> +	}
> +
> +	/*
> +	 * Update DAT entries for all currently attached devices.
> +	 * We directly iterate through the master's device array.
> +	 */
> +	for (i = 0; i < master->maxdevs; i++) {
> +		/* Skip free/empty slots */
> +		if (master->free_pos & BIT(i))
> +			continue;
> +
> +		reg = readl(master->regs +
> +				DEV_ADDR_TABLE_LOC(master->datstartaddr, i));
> +		reg &= ~GENMASK(30, 29);

define MACRO for GENMASK(30, 29), you can reuse this macro at
DEV_ADDR_TABLE_DEV_NACK_RETRY_CNT()

Frank
> +		reg |= DEV_ADDR_TABLE_DEV_NACK_RETRY_CNT(m->dev_nack_retry);
> +		writel(reg, master->regs +
> +			DEV_ADDR_TABLE_LOC(master->datstartaddr, i));
> +	}
> +
> +	return 0;
> +}
> +
>  static const struct i3c_master_controller_ops dw_mipi_i3c_ops = {
>  	.bus_init = dw_i3c_master_bus_init,
>  	.bus_cleanup = dw_i3c_master_bus_cleanup,
> @@ -1504,6 +1539,7 @@ static const struct i3c_master_controller_ops dw_mipi_i3c_ops = {
>  	.recycle_ibi_slot = dw_i3c_master_recycle_ibi_slot,
>  	.enable_hotjoin = dw_i3c_master_enable_hotjoin,
>  	.disable_hotjoin = dw_i3c_master_disable_hotjoin,
> +	.set_dev_nack_retry = dw_i3c_master_set_dev_nack_retry,
>  };
>
>  /* default platform ops implementations */
> --
> 2.49.GIT
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
