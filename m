Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80365C369CB
	for <linux-i3c@archiver.kernel.org>; Tue, 29 Apr 2025 05:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6c1jANZxCrIh1Vsrd0/z1VSuxPyT8+lspUXOlXs2qQQ=; b=AQ3iKX4d9OCRVn
	H3VU/wBGVxGUMmOt/H7NVxidhvVyoPgU8jte0Cifn+Ma7HbWuYwWYQYF0rXXAyBn2fyLgeV9miijc
	2K5El976SzZYprPS4zUE+eGKZ9m9PompD9Ce5rPBjHiKk8j1V4FLHhEMXhS7puP8rDNcKP/fppulf
	hKyweIf+VapDECfd1rotNiWQlj2xY4RWHA/3USZpOusXTrSqYEb4GEK6cT4tCoIn+hGsyTjW2eZBf
	Q7TLLaLb3L4OZygfxjFZN5I+AtGFBE7C2jntb71gYCv83dKEm3tkARn/lESVk+hAz6JC7SF+4/jku
	FqXwWHuPqDMSNX7lnQeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9dgq-00000008PUH-1ALx;
	Tue, 29 Apr 2025 05:39:32 +0000
Received: from mail-vi1eur02on20619.outbound.protection.outlook.com ([2a01:111:f403:2607::619] helo=EUR02-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9dZY-00000008Oev-1Y9f
	for linux-i3c@lists.infradead.org;
	Tue, 29 Apr 2025 05:32:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t0/w/jvcw3oUzd4jQvxrjUwdfaG/iV+toZ/MuJXk8YnGuq0OIPpCmd7GXt8fXr4tbPqUkmrGB/vcBvsaZXFqiPUoFeNQfhbVY7pPw/bX8EfloyARWO9JNz+Fgg/n4vsxkF4cEgQRTNWgJbtUvpufh/Efw59Ogzb8mZSesSE5XG9TgJAO1xDXIlbwZEMModwquCeRwzRXT4altjEfyBdNoxngIPfj7Uwd9Itifw5EX+VN1XtzGwzGvh10HjYDP6zyvtXta1S0NlKCoLZqwVP1+fYxBiuGCHH3vYRygz9zWUJ99QWIef09yZ/xovlc8vttt8vbvPkEjW5kC2hCWtxIEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L65RovnMgsshTb8RhvozrKYcPr4ayV9g72LBL3HIqpM=;
 b=SY1VpSIgzEWrmkJsCUk/dfAGz3Fai/2Dxf4O8qNxG4t2zJ+9UUZb647YtYHfY/xmQzcEauMEHAlhiDuN6EKpQRg7NBH1q1/B5kkqnjLPJtM9OGyqej2ae26mGoDVZcsi8my8Ynjb0td9RUesb4pD0fNZ/hB5725t2D3vMsYJ3OxLn67UQWjSZR+1GT+LLr7YF8Rv8JDf/j3JVujXoiPg1lWTVNU74yVo7yAIGToCNAsyqvdH0Lem0y0Pn1HslUjzU7KWZn5vxtCfRrjjlO9piJaO1BLrfNxLsiOdxq91AWui0bTQoIGPpL7WtcVxJgG/WVcWKseZLkwHT1hKYyCSCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L65RovnMgsshTb8RhvozrKYcPr4ayV9g72LBL3HIqpM=;
 b=K8Jnq93rkx0auLH6VLd0rDyhzU4JYyyHdXzuuRc3QILZjgsmgWEyqfX10ufy1tKvQZA+IANsuLsJNNq7unf2+zAnsuZheHsRvQ7hrVOIEk9BcuthnmU8gLD11RLM/zOec3wAeSycjXHWVzgqAc/XGnhpwYhFBDGljX5xtc97Esgcg9/ZIta+VA0/jjbGJdk0DCxq3kc4pnDQtzIjJ+9GaR7xG6VpzLZdCmx7Rc0VX+zmSQzeDewkVMPHWRO9cuVH2fVqD3kEq9Ii73+jqQXXVfeXSHtwYJNFEFkknUCM0FXvSlg+qon1bpZ72P5YXuor/BpAOu7HS7TK56AQ5QVyhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA4PR04MB7949.eurprd04.prod.outlook.com (2603:10a6:102:cc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 05:31:44 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 05:31:44 +0000
Date: Tue, 29 Apr 2025 01:31:37 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v3 1/5] i3c: mipi-i3c-hci: Allow only relevant
 INTR_STATUS bit updates
Message-ID: <aBBkOfW3sbB2LA/D@lizhi-Precision-Tower-5810>
References: <20250409140401.299251-1-jarkko.nikula@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20250409140401.299251-1-jarkko.nikula@linux.intel.com>
X-ClientProxiedBy: BYAPR05CA0103.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::44) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA4PR04MB7949:EE_
X-MS-Office365-Filtering-Correlation-Id: 3828cac5-f0f9-477f-1191-08dd86df2083
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|366016|376014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dYASK5MbEvKr9TkEo2WVTXFWo0HBCpBfWp4ELRMtXWscd0s0k8gW9MOxXHwq?=
 =?us-ascii?Q?D7eW+2qYvwTzZKnBwfDsvEeNHE35h8PMRgQQRwwaRtF3Jv3phF38/+8mkf68?=
 =?us-ascii?Q?mQtMV8RY1K+xDBebYp/RZOeMzLNij1tuw19bMG2KgRceE8xXUaEgOTpisPYi?=
 =?us-ascii?Q?h1RUSH0G0LfhqOIdsFweRAyLQknLwt1/FfOX+vDkOzIhi5FmGpCCUBThqFBI?=
 =?us-ascii?Q?LA+o1QnV6jLROYRWOXgWNbHtewVNR9/iAxshAalzhchDPtMV5PLbXELN2MH7?=
 =?us-ascii?Q?ezt9W5Oqz1AXzDdpDf2JR+GemVma4p8p9Fif2DHR5HuSxi7B1Wb7iDwvTsXR?=
 =?us-ascii?Q?hwA7j6Eceapd0KsON5bZ+sub/DOcLOuUSftQvIpgNLrK2Ms7dvuXCa5uHp7I?=
 =?us-ascii?Q?WLhH2/uUsFHWRDbPjT/5n3wlrifBe1ioaHvxMcmilR5iLfnK9A8tLC8r6xw4?=
 =?us-ascii?Q?YbmH3hbHSu3SQ+dhdblvmHE0ZcF6vwzPuJB8QG7npQpwCETLScR7DFd2ktL+?=
 =?us-ascii?Q?MYsozxblDijttEfVEBUwQH0YgeyLb6F4iC0CQGus5Lht8ehd8AtpCh2opMm0?=
 =?us-ascii?Q?/37CcxqG76BOVggidx2ZBU+L7PNRrk47hnPVqGKQhCNVZFm03sNStoZ9Kk0/?=
 =?us-ascii?Q?5NwnMV1u+dHczkmXUnINDX4nd9EXblAghbPg55w6XWiuE5BPOPhOh5ylHdA0?=
 =?us-ascii?Q?4Wx9dMIv2k438N+3P3y9cZ1CgzaOqwTGCTpyvxVZ81HPDQC8XQelt5wY6Njc?=
 =?us-ascii?Q?Q9UWOjXE6oqfjjfXRGjtN0EcqEAA1v59opNPFVRe07tMchZZzETB/izF6tcK?=
 =?us-ascii?Q?YeVsJidVRhRzUFSUwOO/RDm1SSWKuPVkstMqyF6Rr8rO2WL3Zgqeh+1Dh4d6?=
 =?us-ascii?Q?1ABt6/sXYcMGOjZCYvLkckr5sqsh9M1PgEoor8w1so1F/J8Zb1NBwOaGYbR1?=
 =?us-ascii?Q?XP00g/XLH3e2fLrUuZ5rEvREcvtoyk4P0NJlow4nzLZoSPhfsWFVHwv1vAAs?=
 =?us-ascii?Q?hWiS4VlaUnYg+m1DLMAwKJNwfyHn1degbIz4tJtzuoejgRABJ7baJcKwa+sJ?=
 =?us-ascii?Q?tszpjBkFdvlI4fHUtB0dkKn13z7oAvphRBhGgMf0q7OCw5KSL1KJSp0kgeYu?=
 =?us-ascii?Q?liWw5CLYrMdkksOuXqQrfVAGs/3HPHdWBaSEG96OiGTzFFa9f1P/+3W5DihM?=
 =?us-ascii?Q?cRogFrKKNYZvOctjUlXYnLHX5xZQyaIAdKZGskSfV8+dniYcgO9Cn82TkbgM?=
 =?us-ascii?Q?8tylLi7q3rH77e7dApPVZEIWV7a5JMmUCPoQe/SMYGVgsnGBK+5rnC4rWwte?=
 =?us-ascii?Q?dFPLQhzlVkCat5/kG/45wwqWjDMWsh0+o5DGQRhCnpgIQSgipAlqdCJ4rjF8?=
 =?us-ascii?Q?Sri9XC60W0AIAWM58htT8mwFIYBvLUzPU4qPQcd8HWOv3T/FiD1o+PBZzyds?=
 =?us-ascii?Q?8TCGRdCUBGqI0BlKOwLHV1EKPuLtxgpJSBNToWhOESWfNl79gyTsiRH+9urs?=
 =?us-ascii?Q?y/9zThfTeudYTp4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?trs7ILBTNGy2VuadtAd4jwSW2xRbodtueckvhPixoQiIbngK1V2eqEsRvWza?=
 =?us-ascii?Q?NXWjPUn9W+YEOgFnia3Y35vw8jtymI29Jz8/6KVBsu1ssGL8kUm39LGRFnBn?=
 =?us-ascii?Q?KsHcah8NmyltQCZjm2nGr70lNB48D7X8474YSzFVhmhRORW0f1yROg47rVhx?=
 =?us-ascii?Q?Tb2oUSJpF4hHofWZ0fpHiJB8usBVszPjIpx5XdCpD5EOXPYZQALxw5HkXXAQ?=
 =?us-ascii?Q?Yj6PWqpGWDPiXsqAB2xkWSDjaE3syNJI4N3oCu6UB3mmBNhM6IR1ab6tUpnk?=
 =?us-ascii?Q?fXzoDYDtfe63G/iEAKXv2nsqUe3qEPIHNN945JDqMz9QJD3F1sn69dyCkpQi?=
 =?us-ascii?Q?gpRsa8o1AqsXqQz9/p51YK120bTuW19aNiBiweG42VHlKskgxg2EsK0ejcT5?=
 =?us-ascii?Q?3zAslz0xKGJfU7J2tJfhD6QGTI37TLoFENIghKhVLbgA9NFyUV+1UguV2EjJ?=
 =?us-ascii?Q?5Fb7a6OEJk5oXnUWsxA2ooGv3LGpuL4/IMpoztPCmx6COwa5Hv7EVNilcSZe?=
 =?us-ascii?Q?r/sDELRBpQ9kF4yST3eMQYD7IHxcePzijie/ukfA0QuxYTPqHmiHZanTSVqV?=
 =?us-ascii?Q?tGNcdEfocXaNYgQ4C/5fgUPiMSRJ/Gbo3CEInKSnl/lTc32CSNkmG1jFqyI8?=
 =?us-ascii?Q?lwenqSheYe5yvlaVs7DyRKzJQiVZ8sfUa4CIWMqcJxL+IuAxEWa9sBf8xqZc?=
 =?us-ascii?Q?u1PASZkMh4wGkDde5ZPBPHItwMRl0v1VVTJNndKpAmS3FOXFgsv/u+ODvWc8?=
 =?us-ascii?Q?4FQwIlCQhLDFmUXDPTLZ9rf/GtLncaIRkwRZl7pfyDyP17rkzhyxiqz03jsr?=
 =?us-ascii?Q?xUYVCNguNQCi4yx55SJRQwxwIlqZK7Q29XfVUIFzXL7XmjJNWESoL3Xa8BGR?=
 =?us-ascii?Q?4sZkw8UimESmJZXvip3zmVd5bDAfA6HyLvuAU+PP+jDEH+qHjqKtOnpCNtPK?=
 =?us-ascii?Q?wYQuhExW9mNqH2naEMeaWoK8yRQ71KIjRVjm+sCRWMKmRVCe+wvbTwEc17ym?=
 =?us-ascii?Q?O9pocpaeSbX1MnnOIZsOvEFXE9/FDDTVzSSpNlHoTnlwh5yePa0fDFZkebSY?=
 =?us-ascii?Q?hk+AFlsvSLiBTse/6Lji5HH0FWVlxmgMa0M4Rs7Z8rXkao4nIcSU3hWbvLCV?=
 =?us-ascii?Q?GxQr9ENs0+WsySQyXum4yPq7SB2+5Mz1pCuWaGAo9A7gOvXL+lPrjALMeboj?=
 =?us-ascii?Q?ONcPviB09h+0wMo1EYwShF5EGEoQplgdnckAjBlJLnLXVNfzimqMd9SxdiEU?=
 =?us-ascii?Q?DOHahI+8IssDY4KOb4hPaWKRhdgMire+quZEkA/sIb6N+WO3eJ9XlBMqeGBc?=
 =?us-ascii?Q?xQpsLTtsTepDj+9xkrQDeXX08yLyG8mm70WMEcJ8joaC58HlZBeZ5EXExwZ1?=
 =?us-ascii?Q?vQz1QuO5w+W3AqwYwe/002bNouSEGej7P55MZ2ZAWkkIcWPvyK6FCHSc7pYv?=
 =?us-ascii?Q?0E4x8Fgx86UmLs6yymHd15vtk1wMQeDM/dlL5dSBoX+kjZ8iIpJIhXKuHWfu?=
 =?us-ascii?Q?t1Z0Af0b8HlQA33TAOuKrq9LuI62unLYJvmm49aa8SOVewbhquIo81VCY+B2?=
 =?us-ascii?Q?gIHIVGTTa7GI4P73io4=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3828cac5-f0f9-477f-1191-08dd86df2083
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 05:31:44.1128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MkDBK6l/cSQtvWUvLj7485gDVNm93gF0ynZpiW283xDGfVlheVNrpfG8i/aUZlziyQavSdtAiyOpzLdICltZ+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7949
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_223200_436674_093A351F 
X-CRM114-Status: GOOD (  21.61  )
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

On Wed, Apr 09, 2025 at 05:03:57PM +0300, Jarkko Nikula wrote:
> Since MIPI I3C HCI specification version v0.8 INTR_STATUS bits 9:0 are
> reserved. Version v0.5 has bits 9 and 5:0 in use but not handled by the
> current driver code and not needed in DMA transfers.
>
> PIO transfers with v0.5 would require changes to both
> core.c: i3c_hci_irq_handler() and pio.c: hci_pio_irq_handler() though.
>
> For these reasons don't enable signal updates from INTR_STATUS bits 9:0.
>
> It allow to get rid of "unexpected INTR_STATUS" error messages on old
> v0.5 IP version and is a no-op for later versions starting from v0.8.
>
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
> v3: Changed the last commit log sentence and clarified more the comment
> about INTR_STATUS_ENABLE signal updates according to Frank Li's suggestion.
> ---
>  drivers/i3c/master/mipi-i3c-hci/core.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index a71226d7ca59..ba7aa6bbcec5 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -699,9 +699,14 @@ static int i3c_hci_init(struct i3c_hci *hci)
>  	if (ret)
>  		return -ENXIO;
>
> -	/* Disable all interrupts and allow all signal updates */
> +	/* Disable all interrupts */
>  	reg_write(INTR_SIGNAL_ENABLE, 0x0);
> -	reg_write(INTR_STATUS_ENABLE, 0xffffffff);
> +	/*
> +	 * Only allow bit 31:10 signal updates because
> +	 * Bit 0:9 are reserved in IP version >= 0.8
> +	 * Bit 0:5 are defined in IP version < 0.8 but not handled by PIO code
> +	 */
> +	reg_write(INTR_STATUS_ENABLE, GENMASK(31, 10));
>
>  	/* Make sure our data ordering fits the host's */
>  	regval = reg_read(HC_CONTROL);
> --
> 2.47.2
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
