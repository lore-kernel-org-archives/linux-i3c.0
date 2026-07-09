Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F88C43458
	for <linux-i3c@archiver.kernel.org>; Thu,  9 Jul 2026 18:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iq24DeedEGWrDX72lchXgVhps1ayiRUht+qPSOVZVnU=; b=X6FdRCPWlFmfDG
	muNrcuG4Z8sXmziJvZSYSpD5rVhYMOYeGproamHTvCx9u3SKCsFVLfWoeucqK+W524IebFszxHT87
	EU5QgWf93g2M4lb60YnnVIk0AM4D4tBe+hZmG9vF9FoTJPqwAGpLYPgEO2dBBIEVr7yL29L5MFYmK
	ChmjfIhprbkGvSM/rYnlFax1fTUnIx6pkR8f+KEcdpYpX2J8335PioEPbtFF45QTazUyRrnEdSQvN
	/8xi6vIl37VodbmjYgoWGs3V+c0RGt7MwZO9riAOMKVxk4Bb93/QOljHu1FOMV8hTZ9O3VDM2pAOk
	bqBG5i1sVKkLsRf3RofQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtm0-00000003JQv-1MNO;
	Thu, 09 Jul 2026 18:47:00 +0000
Received: from mail-westeuropeazon11013037.outbound.protection.outlook.com ([52.101.72.37] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtlx-00000003JPk-2XnR
	for linux-i3c@lists.infradead.org;
	Thu, 09 Jul 2026 18:46:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DCn3ah5NP0BbnVbgtYGurWC455kaxGy6guo8mNV5ScD29gym2vuTKOvePCNgDxTZ4431J5x+EB9PQItE7D+hYuLVTU6L+ZJJGDn3yOZIOkyMvq548nVhwJUInK5SEpJkdyO064GVpjd2ki7FjU7hJnmBugRyxVIjO4xdjnivWrAXjQTD/hNlpe9rM/MtvbYzQPo/2qu/FB0so8SFtTjF9JpFLCoO6QCa/ZOhNbauLio+0a1NxO+j8NJh89CB6CnGXQrTGC0+FLt5vVdVJjx+PQMkMy7lFI7IOuKAXMJ7atjASzY8mYyVp5NaD5yNPenuEh4+Lchn9mDpQBDChdO+qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O7uytTJGxKP8XS+oH0zfvTF5/btQBssozvXsOuciqfI=;
 b=DLkHGrbGDoa5Hlm+Kfo1ZMFCjZv8B2f9g4UxH0i/+EhY2xK7Fh5zxJYH6OFnKt7+rs35/uXuU2teEH13orYvM7gZelTk89LHR6jKS2tDWk2w0XIUJfxAC4mCDie7jj3OVhkO4k+V/nPVQStT+cmzrPIgNnIrWeG/bfdXlHxEdIXeHRRxd12yHK0MeFojWtouYcfHJGW92bWYgy84tOlUdPEgXmGOoobO7sxf0wusW+DDZA5pcUSSZT+WW/jfflgWr6bHEWcQ0reveTE1/M6CWzvvUJdb03++3GlalHXpyi7kzXB9hvo9QV6dyX1JJVMKNkjX3fsofAzmn2lUypolFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O7uytTJGxKP8XS+oH0zfvTF5/btQBssozvXsOuciqfI=;
 b=FfZ8A+EM9hP9AgTSbJTXohMrhAB+QakEjMXf1heax7iKGkX+Z9KMSb5uHKZ5fDzqz9w1JFQBwOcdXqI/JYRk4zwzqMahHL0D1cRqvQL6emHLGQCCOrhDjwNrq8rhdD7t5p8ZKogDSCxkwf9kn7LZCtgXBamji2VUNwDqt5nVKezf+Xh8cEFbhT1ND3MqwsBTxpbVqxPbuX+fuW7oZ9IFp7nvIm513qku84sqBnUeitNCx5TncE1v7IVZKmyvWhaB01cPll0ZjE8lzz34GrAqCm5XH7z0ZvzEc2++97Ds35r3bYu2u0hjw3hllrGoO8tUXd9jWpsMRBRytjfnGUas2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB11505.eurprd04.prod.outlook.com (2603:10a6:102:4e3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Thu, 9 Jul 2026
 18:46:52 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 9 Jul 2026
 18:46:52 +0000
Date: Thu, 9 Jul 2026 14:46:44 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Jian-Ming Liao <tim678910@gmail.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	adrian.hunter@intel.com, jarkko.nikula@linux.intel.com,
	linux-i3c@lists.infradead.org, Jm_Liao@asmedia.com.tw,
	Chloe_Chen@asmedia.com.tw, Yd_Tseng@asmedia.com.tw,
	Patrick_Yen@asmedia.com.tw
Subject: Re: [PATCH 1/3] i3c: mipi-i3c-hci: Enable IBI threshold interrupt by
 default in PIO mode
Message-ID: <ak_slNTM4Y8ed7RN@lizhi-Precision-Tower-5810>
References: <20260709071744.333403-1-Jm_Liao@asmedia.com.tw>
 <20260709071744.333403-2-Jm_Liao@asmedia.com.tw>
Content-Disposition: inline
In-Reply-To: <20260709071744.333403-2-Jm_Liao@asmedia.com.tw>
X-ClientProxiedBy: SA0PR11CA0054.namprd11.prod.outlook.com
 (2603:10b6:806:d0::29) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB11505:EE_
X-MS-Office365-Filtering-Correlation-Id: da0efcb1-e2f7-4517-8173-08deddea70b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|23010399003|366016|376014|6133799003|4143699003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: UJ9jY0qAzlnOJ6T98rJkhrGpl4tmXDwdbbxf0R8GonO20fPTCyEhUXuK9Cc+plsaI3MglFqpV1M/UUVZaxG5P7o2A1zkP5fGMNvVJTX1PbaGaEpKk8G0UzScQTwFlDpxpsaB8x3aXwdaud7OkxyKNKyIiv5jv1ZVsiWVTSggfVYepBuOHElVbYYQmFbQi3DU4R/Af798aZvf6rdZ1gxjVQiZm30+mgXX9tQgzxNXJErF6mkWZ9wUMokCMGRnYFeELBQKdZpfyC+pH1dvA9OQpNSex2U9yY8wr8cYJHE7jutmW4nyN7D6Pi/39twvl2pmxqYOa2fr3Id1S2dw82ExPPY20oMzOXJtoVdVwjf1W/nRv0UxcBBYsGQKHzOm+tU3lP5oENTrdifqNzsMbWH+EgA8oAO9DQCCzXmAjT43NkjLAY2Ygm0rLtqQoDxI3hEYdeLRvNe59bVyLMidxtdZTEuQR/A/q1JhQ4YdeaqlxZGWgMPbAHzHT0GfIIVuHOmqXIAd0htpIdXLSMIEv+S0hXkDGALfoyBk0y8ZdqKkh/C2GKFXZ3hjueNRuY4brsYO8OZmaFWqY27R5xGYWCNbWjARd1b8zzn+lLyXW4tsnlAMHNkvjrKYqclvH3XE0d2Tk5MUlsb1BoXRwjJ/Q5WVSFtFTi6cRFJYJ8aUvQOQCkE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(23010399003)(366016)(376014)(6133799003)(4143699003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0E183GqQZWX1D0NVpPiTHYjo9mngmGwP+6Hq3UX4xifO2n42u3s7IZ+pCCfz?=
 =?us-ascii?Q?IsjKaus6ki/nytuyBk+SanBf6C1ehLufQXMkG0BZl3jMylnKl2/a4SO7+yuV?=
 =?us-ascii?Q?97nqVdF+YXPUgZWsVkqXJ7t37GVYuhlJqGiafdlczZJg9oDmDP35eK94zBOx?=
 =?us-ascii?Q?RRreZcNYvHAAOvJ7xP0zJQgO+BcHZUjofdWo5h17tv0HYZKqt7V1Ay3nKYiW?=
 =?us-ascii?Q?Zo54Cep5DneB4upqRSSIs4pcdgyfJOqHLeW63F2eXO46QjKjeR0dGlbHbiq1?=
 =?us-ascii?Q?V1kdfl5696gCtzZbK9frHyocG3f+0LXJY/U52fX/N8ZV4Lp119E8PuxmRK68?=
 =?us-ascii?Q?OwyMpl0agmcgiSWlBxYrZkTjdcmc1FTBC4C0TG6SvlvQ2QV2LqKaBiT9PokU?=
 =?us-ascii?Q?/KyIeamUGZ7hZgDnv1I7jWuG/f3fRhG0uemlCEl7dESGhLKzN4Qcv7YZd8Mm?=
 =?us-ascii?Q?VA8kduYwKsmnH3/tMqg2CaL8JHirr2nTcofxN9ddGO/i+2JdHUQ42jxR4kXh?=
 =?us-ascii?Q?SOHxMgf7i/kIJYr5pc8/kRYc1X8Z25G906xXOXYcBKge+dyT+/Asg7YsSU5x?=
 =?us-ascii?Q?pZKGvHl4qdKKijvgpOixC24TTO36tz9hdlN653WZpHaDFRlWLpISQOfWKXFL?=
 =?us-ascii?Q?XtXyyoc9hxcV9onadCNJvBY32MjmwY2YiX+7iW5Q13BjaGdjVojmJno2XJxo?=
 =?us-ascii?Q?CUOTrXhjfQHwCLQo/V/3LQsMuIPK/RNuzSK5o69xNmK7P3xxtJQhaex0jUF9?=
 =?us-ascii?Q?eKu1tg+30Vu/ahGKxm63ZPKHIZtUWc8cixMjaEhtMHzKUTXqsF4aBh0TdLR9?=
 =?us-ascii?Q?NdVQGvUyq+FPUHNFamBtJBW9ZKXoxCpme9qxFCKU9HxXfzaOXTB262VUi+Rb?=
 =?us-ascii?Q?gsCMmvYZmuvKQH4d7S7xtMx9nK3JqovLX/Bq/mvzjJfOOIuqRzforwscPwmX?=
 =?us-ascii?Q?wruC3y25kpjbFhE5WX0NSkTRfA6S5Vkzx2mv9FnPpR38zC42J6E3rqEb5794?=
 =?us-ascii?Q?KI7Q4hhK6S7Q2VCp9JFcdzEJOFLJUTF6QWAJuls+78XPIxL0YAB50GE1PRF9?=
 =?us-ascii?Q?liObsNEoWWDSQNkSZuZ5YQvQ05k5HSX0SDT74IIW8mszNI8Drp0OIQgWERAS?=
 =?us-ascii?Q?+2qpw+ptQyfZtd/MiuOUBj1F7cpFU8DbgZzJYraDGSNYjwfTXNx7IHsMueqr?=
 =?us-ascii?Q?mbaTmFzFbaLNGT8olz3DUcUPLhYUDKhR3GDYsG6gfTQ8njWcp0gRfxmkeUip?=
 =?us-ascii?Q?QJsSNs/lHhKLZ1+AWpsJJ5p2m5kVHzC4HEVSQbhr/YfOLa2yClfK+FuygSFb?=
 =?us-ascii?Q?9emrIep+68NZAmeokXuEy5fBiMhN1UlbG53AZFbQ5TEBjEBTprYQPZZPWNPG?=
 =?us-ascii?Q?F5m8/ECDVki6Wxzc5xgC+ZOKMiWBCPz5M8NnbvK+GSTneslrfMWonm0JnogS?=
 =?us-ascii?Q?xd+frQ23F+Z4IZC7+6FL0op3KosTuW5qObA6iIIIN+9yfPgb/AYe9SYORZl4?=
 =?us-ascii?Q?qogq2OhiEQpSiQy+JVWWeg6UnSXsQn9C7ZvWJEaIpwRJULhbfRWUCGzkMWrh?=
 =?us-ascii?Q?rgnMSPLq1LZGdCa3MMSapbuwwcdL+6OYpyP0EQRYo83KpOItUUpvDYNJj4u1?=
 =?us-ascii?Q?8AYbBkFii08jHfMkumIT6yQ65PM0dnsv8NaLLTaYrSSRJlGiV9YBVA1E8gzF?=
 =?us-ascii?Q?zqUx59wMfe4Bf5/PZ3QePOovB4UTTBj7nNO622pyMdDvAED6hcmyUpLyP0lR?=
 =?us-ascii?Q?3PIwfp35fhB1iUsjaI6er/lYChKvll/GQb2cmK6ZLMsBlRIpuwuD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da0efcb1-e2f7-4517-8173-08deddea70b7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 18:46:51.9959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5IqHQtjYWU/bz2/HETuF5hFt4EaNFeObMWoWbyxfpHpmtV734qqTa5WoFNgymrh6k70zuYxjFCEBUgroultmFkWnRbKm91naI9aWt0MWKHuclwCQjMAHCNrhPeKk8i3R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11505
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_114657_665208_9A653EE0 
X-CRM114-Status: GOOD (  16.21  )
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

On Thu, Jul 09, 2026 at 03:17:42PM +0800, Jian-Ming Liao wrote:
> Enable the IBI threshold interrupt (STAT_IBI_STATUS_THLD) by default
> during PIO initialization. This ensures that Hot-Join requests and
> early IBIs from devices that have not yet formally requested routing

Do you means not call i3c_device_request_ibi()?

Frank
> are properly captured, improving system responsiveness and stability.
>
> Co-developed-by: Patrick Yen <Patrick_Yen@asmedia.com.tw>
> Signed-off-by: Patrick Yen <Patrick_Yen@asmedia.com.tw>
> Signed-off-by: Jian-Ming Liao <Jm_Liao@asmedia.com.tw>
> ---
>  drivers/i3c/master/mipi-i3c-hci/pio.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
> index ff2657ee220b..7870b2c7888f 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/pio.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
> @@ -185,8 +185,13 @@ static void __hci_pio_init(struct i3c_hci *hci, u32 *size_val_ptr)
>  	pio_reg_write(INTR_SIGNAL_ENABLE, 0x0);
>  	pio_reg_write(INTR_STATUS_ENABLE, 0xffffffff);
>
> -	/* Always accept error interrupts (will be activated on first xfer) */
> -	pio->enabled_irqs = STAT_ALL_ERRORS;
> +	/*
> +	 * Always accept error interrupts (will be activated on first xfer).
> +	 * Also enable IBI threshold interrupt by default to catch Hot-Join
> +	 * requests and IBIs from devices that haven't formally requested
> +	 * IBI routing yet.
> +	 */
> +	pio->enabled_irqs = STAT_ALL_ERRORS | STAT_IBI_STATUS_THLD;
>  }
>
>  static void hci_pio_suspend(struct i3c_hci *hci)
> --
> 2.43.0
>
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
