Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59549C2A07D
	for <linux-i3c@archiver.kernel.org>; Mon,  5 Jan 2026 09:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r8TMyK0+RKc7rr0pAuY3NjCrVKiqywcY4PKeCkdyNWo=; b=aw1uhY/ZVPDJU+
	63+iaQg0fC41ho7U7nQlxtaXQs240tSfWvXFbawhmiuU8y7yjt5NG0EghT5auBOgSTnzzBHJeft7W
	EVxMk1XvYYz1zIv4/WSEONFb/aveWdzebBgkswrPxSyyPKxLtSlo5ETN6yJssMlcRQvJhcmdWIWuY
	yr+u6vpWUV1vTt76S96nhz7UV6KMahM/hhP2qPgTGR0eU2rUJLWZCYHSPYb10qwUCR9Lm+u5ULyCk
	TT30YOBHRSk8bABysdZV+rfYRFZ6jfbLRiZ+bypWD4eLVkBNaYb+Qr83OMDM16LxbPPaJ8BZ3Qfke
	OUBDaFEO0sMSYQ3s0gEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcgtn-0000000B49I-0NPV;
	Mon, 05 Jan 2026 09:29:15 +0000
Received: from mail-japaneastazon11011059.outbound.protection.outlook.com ([52.101.125.59] helo=TYVP286CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcgti-0000000B48Q-2xJy
	for linux-i3c@lists.infradead.org;
	Mon, 05 Jan 2026 09:29:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n4uukOixIEVgGo460BICl0JIlGEybgOij0eAuJnfBiNCEyei5wsR10hI9NmRwDq2ZdB0KfZIJGb2guoEqDbv6jMhufVqVjCD8NlV3D5stgMm27IcO3kaemhfU0+kwiEkW77qr9uVPbXk6ZQBE7+cuWrA9b7ab4k7BfSnjwP07b4dANWTyzjCfHF9CLxgmWfn/WTKqIXMFZMsQVjKofka6nXV8jt+iHwh/q3g/sy4l2VsXXF9g7tm7AnacK7uQzEhP5x04pKi701LWr71Vc+wA9x0x9jT3N/MifWemK4mFokyOkTqd4A+OlNMIoRcnAwHB8H0ps7lzdKN7hOgPbQ1gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ScKCEmBKygoF9+DeGXnFB+GGumLGqc6ltTWAZrYc9A4=;
 b=V+jAXTdzkoMc8PKA1fhoYWIZdZKI3BGJONvn2nI1SXMZd4ncpGDOqc/jRQ47/sBj81MLo/jVbnCXadLerr9R4nciY/rYPWYJrZAyJU//wdkwSmTkvoFVpilhYVY+rsFRnjelyBaF8nbLZkR57I2Xg4NIdZSt73DJRCgPo+qI/uo/KfvkczdkDSAhUpX3nnbb9Ir1FzdHhowpj8U3b0l8bJ6HOU9599vlkbTVuHUECnI+iMBnYEgKWDwSWAuh3aSy0j4E85qhE9ENe0rRVXDzMSh2vtaPvtm0CEs1kHCUA4W+ZpgvWsmTBtBt+icuQUgnFyHBLTSGal5KryESSxPn5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ScKCEmBKygoF9+DeGXnFB+GGumLGqc6ltTWAZrYc9A4=;
 b=MUCpN3hrD40PX48hrURz166zVcHBUmzoSb3H1SV3ojJDpwtpd2I74hY7GrDLmDujLBmJagRjF2+baXv5P+H17sELb3X8uuF4a/Ip9J+fip0skqlU3dgf4zUSRgqFyavwat/58OK+XiW0o3x1LcOaXHKh1cM+H74RTKLiHgkILV8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSOPR01MB12153.jpnprd01.prod.outlook.com (2603:1096:604:2d9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.1; Mon, 5 Jan
 2026 09:28:48 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9499.001; Mon, 5 Jan 2026
 09:28:48 +0000
Date: Mon, 5 Jan 2026 10:28:28 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Tommaso Merciai <tomm.merciai@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	wsa+renesas <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"magnus.damm" <magnus.damm@gmail.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/4] i3c: renesas: Switch to clk_bulk API and store
 clocks in private data
Message-ID: <aVuEPIXTckqCxtJV@tom-desktop>
References: <cover.1767168766.git.tommaso.merciai.xr@bp.renesas.com>
 <c6678c398f89eba9ae7b349ec31bbd0a1cf7355c.1767168766.git.tommaso.merciai.xr@bp.renesas.com>
 <TY3PR01MB1134639E27E86605C6B6270E686BDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Disposition: inline
In-Reply-To: <TY3PR01MB1134639E27E86605C6B6270E686BDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
X-ClientProxiedBy: MR1P264CA0196.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:57::14) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSOPR01MB12153:EE_
X-MS-Office365-Filtering-Correlation-Id: 17682485-26c3-444b-0793-08de4c3cd48b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dHpWbDNxYWIzZWJEcGo3M2VPUGVBRFQ3N1A3SGhnT05nVnpNWS9Nekc1V2NZ?=
 =?utf-8?B?Rkxmdkd0TGtGTXdWaWVzRmVIMTJURzNRaHlPUnFrcURVYWFXTHVzMUV2Skcr?=
 =?utf-8?B?dHlNQjRBbGxnaEREbFFpaFNKMjIya2l3SHlocTFwc0NyNThvT0pxcHNFRWVt?=
 =?utf-8?B?ZG8wV201UmhWWnZTNkp0bGQ5dDdRWm5GMGg2OW1oTEdWYzM5RHN4bks3QjVo?=
 =?utf-8?B?OE83RVJrWXB6MCtYRFkxejEvNnAwTlMxSDRLc25UUS9JT25CdFA2UDFDaTdP?=
 =?utf-8?B?dVkxanlKU3FhYUdMbFlvMTFPUXZWN0tXK2xDYllXRXpLK1gyM3d5Z2FoTUpS?=
 =?utf-8?B?Q0lZbzFuYzFSL3JBQnBlOThiWThVU0c3OW92SjNvQ2F3UVBGeUMvL3FXN1Vq?=
 =?utf-8?B?VEQ3U24zRFdDUGsxVXY3YlEwSFZBU3J6dkEwd3BPdldsQkFybG0rQ3cwQlpT?=
 =?utf-8?B?QitSVlgwbjJ0bXpyOW90VWpwSkVvRFNKZlZsSk9HRGFoS2xtamRid0k2RnAy?=
 =?utf-8?B?ZlBSNmE2eWRzekczUEJYU2VMaGhPVHlTamFUQkVtQWVrWVFDbm5XRW82YWhw?=
 =?utf-8?B?YnBaRUxFL0o5MWh5WWpyMGNuNFFpMThKNWl0K2VuUitMUGlZeStUVXhsVTU3?=
 =?utf-8?B?M2pjdUhsMjRBMFM0M1VQTVlwTlEzdXB2U1Z6NGdKKzlXTVlHU3k4S1Q4d0dP?=
 =?utf-8?B?aFdVcG5Xb0VZdm5sNmRhbGhZdXFVeVdOYlhPV1o4TjhJZDlpeUM1Y0NrYnh5?=
 =?utf-8?B?cENjRE9idWhSS2pRRWdSMFJzSU5pV1dqNm05bks4eXZrZ3pZS1dUOEFHL25U?=
 =?utf-8?B?bVNUekNYVUdjQXluYU93RWk1Nm94eHRqMHdpRTlEM05NSEJCU2xjdHNTYktG?=
 =?utf-8?B?dUtpTWZDMWFRUkxhTjF1WDhRNlJrT2kwbmhOcU1BOGRZbVJoaWpBU3JZR1ZI?=
 =?utf-8?B?dGg5MmU1K1VwWWJvRVd1N1QwSWdGWUp4UlRoS1V3eTFpWlBUc2UvVlEvTUlV?=
 =?utf-8?B?QW1Qb0dLaTRIeVRnSUVWVExiZVlIMFhQRGliZWx6aWdVcTk4ZmZlV0RtQkhu?=
 =?utf-8?B?V20vZjlmbGszVmhCYVVLN2RlQlpmdUs5dFM2M0pYYlpUNWg0RGZOTXlsRDda?=
 =?utf-8?B?VWJWd1VkcGc1SVpDa2M2SWdPbXNqdCtZUXlzYWNla0hwZGtQS1F1VXBxMXZ6?=
 =?utf-8?B?Mm9adUE2OUhsWjhyRFZBNVVDdXlsaXg5bFRiTHk1a1RZdG5lT3l6UVNLY00r?=
 =?utf-8?B?RWZYR0hpN0hzbktIOG0xdVBzNjBQMlcva0pVK3NaVTJPVUxKWHlZQ2xBeFh6?=
 =?utf-8?B?Nkd6bGN0SG4rVjZkSk5DMEE4NGpZalZsV1A3MzJxeUp0YVdsa00vU25aSTRU?=
 =?utf-8?B?d0ZTS0M1N0hSci9BaGtZUlNBVWo4QTRhbGJRWjRWYXVjQzFXaFExSzl2ckF0?=
 =?utf-8?B?ck9FdG9WZnpzdmtBWnFndFVTbFVjR1EyTDUwblBVWE9kNEllbHhwSHdXQm5E?=
 =?utf-8?B?eVN4TkhRcXpnamtSRDVtYlN4Yi9zMUE4TjJxS245WDB4V09XRkplVnVoeTRZ?=
 =?utf-8?B?WWRlQzkrV3BsSGhoaFFpd3pCNGhtdVF3cVd0enMvejRISXpGR0pGV1gvN2Fu?=
 =?utf-8?B?MGxYNWlCZ3UweDVVU3QyZTdPcjVzU0FzcHRLRFBvTHlyTkdYajR0TXR4Wkhm?=
 =?utf-8?B?VUdHdGR0aHZBQmVKT2RzbTc4R28rRkRrRUp2QTMwdFZOQ28wQzBtTFNFVDA1?=
 =?utf-8?B?cGRETVFaMXRsTHlMQ2ZpTFQ3TXBVcW51cnR6VnM2K0RnWmpTTUI4Y2tjS1Fw?=
 =?utf-8?B?ZXlVdWpweFJKdDdCNzR4THNkakV6Umc1T1E3VXdBUUNjR2FuUXFvMW1WUWZG?=
 =?utf-8?B?bUQzM2R2QStPYUtFNmI1WVhKZ05SNmNKQ2JpSStMNjEveHowWEVBZjFlRzBG?=
 =?utf-8?B?Vk1Rb1p6K3FPREN5Zi9Qb3B3Sk1GbHh4Z0RpQk04bitFd1k4OG1HM01qTEs3?=
 =?utf-8?B?RUVSS0ZwaWhnamRvczF5dXRRTjliYldxSzlONkU4bzFwY05xYVVXeUpHNkNX?=
 =?utf-8?Q?ulWgr0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N09JRnIzMVE2ZVUzUmUwcEd5ZGNsNjFXbmtTazFoQWs0cFJmdEdvcjk5alo4?=
 =?utf-8?B?U0ZxSUllN2dOZm5FbksyT1AybUxJZndDSUdCSVBLZmliM09QSWdHK2JGWHFS?=
 =?utf-8?B?M3JlVzBxdkhHSkFzKzFkSnE2RTB5aXdHZTVrZS8xTlJLMisyUVpZYmd5amVP?=
 =?utf-8?B?aG9lYWdJRzd0UzNINFRSNVdWNkgybFA2Nmk2azIzbTZYZmJSQmkvSmw3SEtU?=
 =?utf-8?B?clJnUVRlOWJjYWVJb1VsdVhFZFdJREczTllvTUgzWHZYQStUN1gwSTV0S3U2?=
 =?utf-8?B?UjVkTTFndWdEOXZOMzIyTkNoZ3Y4MGU2ayt5dTViZWNISndlN0ZaYlkxM3pR?=
 =?utf-8?B?Q2xxMDh4YXVMZHRwSm5FdDRHVG9PTmJGZnFnK0V2Tk5NUHJaOWJrWVNPdzQ2?=
 =?utf-8?B?TWN6SVArTDYrc2RJd0RCQzhITFl1UlNjSm5SaFJqYVNjR2VkN1FjbDN1RnBE?=
 =?utf-8?B?VjBHckxQVlVFOWVVMnVsNWhYT0k4RllPYTlkamNOOTkzSTd4ZDBydnpBZ1dy?=
 =?utf-8?B?QUZhb0Z6WEpiNGNsMTUwSGIrQnJWOXN1THFCSzh0QWVEUXpOdE15U2oxYVND?=
 =?utf-8?B?VW5rWmUvOUd5N1IybWp0ZlVyZzJhWWIvYVA3U3dWTVh3UzZFc2s1SjFtN1pu?=
 =?utf-8?B?dXBRdys1NXUrN1F5NFd6dzJ2MHVzRUVRNnhkSkMrQU1uSFptUXhpSUpuckF3?=
 =?utf-8?B?NzE0T0pIZWFFM0N2eXd6NHljdWZxUGQvUGdROCthOW51dGFyS3FmeW5JNlVm?=
 =?utf-8?B?Y3dyKzk5K3c5ZkJsV2dqUDZPNDdVVG9STUw4YXFjcHVLVEtJUWZGRzBXWVVp?=
 =?utf-8?B?SGFtMUR2bDY5dmFGVEt1NW9JRXZBMktxYm5TczMreUhsU2hxeDM3dCtpZEtM?=
 =?utf-8?B?S050dzlibGprbm1rOEdtbFdjZWY3bWIrM3dCZGI3V1J5U0RoMWcvYTVWYnAz?=
 =?utf-8?B?NTYvemh2Z1JBSzBUQnoxMHJ2MjFsZUo2Y0YzUkVBWnpxbTY2QXh1cUt3dWJ4?=
 =?utf-8?B?V2hQSk9PSGdBKzNKSUFXenUzNjdDVVhRS252NXBQdDBnZWZFYnFyYjBtMkJk?=
 =?utf-8?B?YlpUWSt4SDFnZ2VFYVRWY0dRYWRTNGJJT1lzUHJjZWdmS2dlTHoyMWFXMjlJ?=
 =?utf-8?B?aXF6NzRuWEwvZFQxWFNFNEwvbk93OWxjNnU0VDJJeDBrWW9LR1JpQlJiVjVW?=
 =?utf-8?B?dXZiVElWS0pVUjlVOHR0R2dkT1VwcDRrSTZjd0c3YXkyejlGMDlXM0tPK0sz?=
 =?utf-8?B?eHJZbngxMzV1bk5mVGZYQVV2R3R2WTZCSU9OcXlKM0lKdnN1eWwyZ2laZERY?=
 =?utf-8?B?bUh1cDFEbG1Pa1RlU1RmTEdURHpoZGkzWmNGS3ZsNVdrU3FhTjJyYmFXdmZD?=
 =?utf-8?B?cnl5Uyt4OEFjYWxBQ29nTmJXb2VZUG5Qc1FtTDY3VktNTGdWeDF4QU9KODE4?=
 =?utf-8?B?VWpETmorcWJEejd0TW1CRkRyY0NPRXNDZU5aU0YrQ0luRmpSUDNxaFpJUzZ1?=
 =?utf-8?B?eDNMNmpRY0Q0UThlWXV1T2prRXRicFZ1b0E5SHpGUUlDKzZZSmo1OGR0Rmth?=
 =?utf-8?B?WWU0VFI0cGJNSStiVDNOa3JCejFpSkxubWFGQk5iclFMbnFiakNLWHUyVmtq?=
 =?utf-8?B?cWhmY1RuNjc3NS9YaERidGk3SFZpV0RXQkFZQ2pYOHQyaWpCR1N3YjJvU2d5?=
 =?utf-8?B?QWROMENSVGVKcGVnT2pLNzF4cFVhZlRZR2dFQ3Vzd2xQT3VjS1ZmeGZiUjFr?=
 =?utf-8?B?QUdzS2xNRDVBVnNVVHd2M0xqUEtVUDg0YWM5d2RtZVVOY2ZSVWZ6T0ZkRElQ?=
 =?utf-8?B?cGErNE5Vd2QxdWJLVVJBU2dYajBSZEppTUs3SEVCdG9QZE9BOWJxYVBQTm9u?=
 =?utf-8?B?d1NTYXZmT0k1VDRXVlptWEEwNCtaRGc0TDBhLzhFTU5wZms0R3J1Mk4wLzBW?=
 =?utf-8?B?T01RMGJYZ2crcUNWS1JkVkhIS1M0SGlJWmx5YXltWEFwNytkT0VSYlY1SVc4?=
 =?utf-8?B?cHJjTEN1RUdXRFBjczJtMzhsanE0eDY3MGF4d0RhZlNxY1BzZnFjUXJ2eS93?=
 =?utf-8?B?bTArbVA5d0k4ZnVXenFnL25xOWluWEQzdkVPbTMxbDNZaTZVMXNpMDlRa254?=
 =?utf-8?B?Yk8zdVJiV3Jla1lEUEQrNnUyUW01N09ub01pOEF1K2xSVjlVMlFTTDhVemhU?=
 =?utf-8?B?bUtNQXBXOWdJNnBzdGp0OXVvb2NhM2g3NVdmMStHQkRpSGVHNmkzZXNvY01G?=
 =?utf-8?B?bnJNNjFLT3FEU211U3M5M0FiMzFQazJCM1NkT1pOSWxMcStreGRXL1hYWTVl?=
 =?utf-8?B?RlFJWWlpMUdHN2t5ZmNLY1R1OERvV0RZZ3BRc2syZ1dmaXZrNGNOWmRiZHJM?=
 =?utf-8?Q?o0PqV1Dr7VGit98+ZiNa2yktyc1X00A/8EUoS?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17682485-26c3-444b-0793-08de4c3cd48b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 09:28:48.4636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tg2O2H628ysgr47sT3xA2p/txmwVBlz5zcbuEKv29hyYg0jdSFGoZFEENr4vWdnBRB1lnKT3myFrWIb9XjXb9tpvf/ooN4vyxLKlvj7ZILMAO0Fpekw+k5E+1eONV7gW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_012911_087714_C2B4F855 
X-CRM114-Status: GOOD (  27.98  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

SGkgQmlqdSwKVGhhbmtzIGZvciB5b3UgcmV2aWV3IQoKT24gV2VkLCBEZWMgMzEsIDIwMjUgYXQg
MDk6MDg6NTRBTSArMDAwMCwgQmlqdSBEYXMgd3JvdGU6Cj4gCj4gCj4gPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+ID4gRnJvbTogVG9tbWFzbyBNZXJjaWFpIDx0b21tYXNvLm1lcmNpYWku
eHJAYnAucmVuZXNhcy5jb20+Cj4gPiBTZW50OiAzMSBEZWNlbWJlciAyMDI1IDA4OjIzCj4gPiBU
bzogVG9tbWFzbyBNZXJjaWFpIDx0b21tLm1lcmNpYWlAZ21haWwuY29tPgo+ID4gQ2M6IGxpbnV4
LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZzsgQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJl
bmVzYXMuY29tPjsgVG9tbWFzbyBNZXJjaWFpCj4gPiA8dG9tbWFzby5tZXJjaWFpLnhyQGJwLnJl
bmVzYXMuY29tPjsgd3NhK3JlbmVzYXMgPHdzYStyZW5lc2FzQHNhbmctZW5naW5lZXJpbmcuY29t
PjsgQWxleGFuZHJlIEJlbGxvbmkKPiA+IDxhbGV4YW5kcmUuYmVsbG9uaUBib290bGluLmNvbT47
IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29tPjsgUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5n
dXRyb25peC5kZT47Cj4gPiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVy
LmJlPjsgbWFnbnVzLmRhbW0gPG1hZ251cy5kYW1tQGdtYWlsLmNvbT47IGxpbnV4LQo+ID4gaTNj
QGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKPiA+IFN1
YmplY3Q6IFtQQVRDSCB2MyAxLzRdIGkzYzogcmVuZXNhczogU3dpdGNoIHRvIGNsa19idWxrIEFQ
SSBhbmQgc3RvcmUgY2xvY2tzIGluIHByaXZhdGUgZGF0YQo+ID4gCj4gPiBSZXBsYWNlIGluZGl2
aWR1YWwgZGV2bV9jbGtfZ2V0X2VuYWJsZWQoKSBjYWxscyB3aXRoIHRoZSBjbGtfYnVsayBBUEkg
YW5kIHN0b3JlIHRoZSBjbG9jayBoYW5kbGVzIGluCj4gPiB0aGUgZHJpdmVyJ3MgcHJpdmF0ZSBk
YXRhIHN0cnVjdHVyZS4KPiA+IAo+ID4gQWxsIGNsb2NrcyByZXF1aXJlZCBieSB0aGUgY29udHJv
bGxlciBhcmUgbm93IGFjcXVpcmVkIGFuZCBlbmFibGVkIHVzaW5nCj4gPiBkZXZtX2Nsa19idWxr
X2dldF9hbGxfZW5hYmxlZCgpLCByZW1vdmluZyB0aGUgbmVlZCBmb3IgcGVyLVNvQyBjbG9jayBo
YW5kbGluZyBhbmQgdGhlCj4gPiByZW5lc2FzX2kzY19jb25maWcgZGF0YS4KPiA+IFRoZSBUQ0xL
IGlzIGFjY2Vzc2VkIHZpYSBhIGZpeGVkIGluZGV4IGluIHRoZSBidWxrIGNsb2NrIGFycmF5Lgo+
ID4gCj4gPiBTaW1wbGlmeSB0aGUgY29kZSBhbmQgcHJlcGFyZSB0aGUgZHJpdmVyIGZvciB1cGNv
bWluZyBzdXNwZW5kL3Jlc3VtZSBzdXBwb3J0Lgo+ID4gCj4gPiBObyBmdW5jdGlvbmFsIGNoYW5n
ZSBpbnRlbmRlZC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogVG9tbWFzbyBNZXJjaWFpIDx0b21t
YXNvLm1lcmNpYWkueHJAYnAucmVuZXNhcy5jb20+Cj4gPiAtLS0KPiA+IHYyLT52MzoKPiA+ICAt
IEFkZGVkIGRlZmluZSBmb3IgVENMSyBpbmRleC4KPiA+ICAtIFVzZSBkZXZtX2Nsa19idWxrX2dl
dF9hbGxfZW5hYmxlZCgpIGludG8gcmVuZXNhc19pM2NfcHJvYmUoKS4KPiA+ICAtIEltcHJvdmVk
IGNvbW1pdCBib2R5Lgo+ID4gIC0gRHJvcHBlZCB1bm5lY2Vzc2FyeSBzdGF0aWMgY29uc3QgY2hh
ciAqIGNvbnN0IHJlbmVzYXNfaTNjX2Nsa3NbXS4KPiA+ICAtIFJlbW92ZWQgdGhlIG5lZWQgZm9y
IHBlci1Tb0MgY2xvY2sgaGFuZGxpbmcgYW5kIHRoZSByZW5lc2FzX2kzY19jb25maWcgZGF0YS4K
PiA+IAo+ID4gdjEtPnYyOgo+ID4gIC0gTmV3IHBhdGNoLgo+ID4gCj4gPiAgZHJpdmVycy9pM2Mv
bWFzdGVyL3JlbmVzYXMtaTNjLmMgfCA0MyArKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAzMiBkZWxldGlvbnMoLSkK
PiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci9yZW5lc2FzLWkzYy5jIGIv
ZHJpdmVycy9pM2MvbWFzdGVyL3JlbmVzYXMtaTNjLmMKPiA+IGluZGV4IDQyNmE0MThmMjliNi4u
MWI4ZjRiZTlhZDY3IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyL3JlbmVzYXMt
aTNjLmMKPiA+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci9yZW5lc2FzLWkzYy5jCj4gPiBAQCAt
MTk4LDYgKzE5OCw4IEBACj4gPiAgI2RlZmluZSBSRU5FU0FTX0kzQ19NQVhfREVWUwk4Cj4gPiAg
I2RlZmluZSBJMkNfSU5JVF9NU0cJCS0xCj4gPiAKPiA+ICsjZGVmaW5lIFJFTkVTQVNfSTNDX1RD
TEtfSURYCTEKPiA+ICsKPiA+ICBlbnVtIGkzY19pbnRlcm5hbF9zdGF0ZSB7Cj4gPiAgCUkzQ19J
TlRFUk5BTF9TVEFURV9ESVNBQkxFRCwKPiA+ICAJSTNDX0lOVEVSTkFMX1NUQVRFX0NPTlRST0xM
RVJfSURMRSwKPiA+IEBAIC0yNTksNyArMjYxLDggQEAgc3RydWN0IHJlbmVzYXNfaTNjIHsKPiA+
ICAJdTggYWRkcnNbUkVORVNBU19JM0NfTUFYX0RFVlNdOwo+ID4gIAlzdHJ1Y3QgcmVuZXNhc19p
M2NfeGZlcnF1ZXVlIHhmZXJxdWV1ZTsKPiA+ICAJdm9pZCBfX2lvbWVtICpyZWdzOwo+ID4gLQlz
dHJ1Y3QgY2xrICp0Y2xrOwo+ID4gKwlzdHJ1Y3QgY2xrX2J1bGtfZGF0YSAqY2xrczsKPiA+ICsJ
dTggbnVtX2Nsa3M7Cj4gPiAgfTsKPiA+IAo+ID4gIHN0cnVjdCByZW5lc2FzX2kzY19pMmNfZGV2
X2RhdGEgewo+ID4gQEAgLTI3MiwxMCArMjc1LDYgQEAgc3RydWN0IHJlbmVzYXNfaTNjX2lycV9k
ZXNjIHsKPiA+ICAJY29uc3QgY2hhciAqZGVzYzsKPiA+ICB9Owo+ID4gCj4gPiAtc3RydWN0IHJl
bmVzYXNfaTNjX2NvbmZpZyB7Cj4gPiAtCXVuc2lnbmVkIGludCBoYXNfcGNsa3J3OjE7Cj4gPiAt
fTsKPiA+IC0KPiA+ICBzdGF0aWMgaW5saW5lIHZvaWQgcmVuZXNhc19pM2NfcmVnX3VwZGF0ZSh2
b2lkIF9faW9tZW0gKnJlZywgdTMyIG1hc2ssIHUzMiB2YWwpICB7Cj4gPiAgCXUzMiBkYXRhID0g
cmVhZGwocmVnKTsKPiA+IEBAIC00ODksNyArNDg4LDcgQEAgc3RhdGljIGludCByZW5lc2FzX2kz
Y19idXNfaW5pdChzdHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9sbGVyICptKQo+ID4gIAlpbnQgb2Rf
aGlnaF90aWNrcywgb2RfbG93X3RpY2tzLCBpMmNfdG90YWxfdGlja3M7Cj4gPiAgCWludCByZXQ7
Cj4gPiAKPiA+IC0JcmF0ZSA9IGNsa19nZXRfcmF0ZShpM2MtPnRjbGspOwo+ID4gKwlyYXRlID0g
Y2xrX2dldF9yYXRlKGkzYy0+Y2xrc1tSRU5FU0FTX0kzQ19UQ0xLX0lEWF0uY2xrKTsKPiA+ICAJ
aWYgKCFyYXRlKQo+ID4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4gPiAKPiA+IEBAIC0xMzAyLDEzICsx
MzAxLDggQEAgc3RhdGljIGludCByZW5lc2FzX2kzY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KSAgewo+ID4gIAlzdHJ1Y3QgcmVuZXNhc19pM2MgKmkzYzsKPiA+ICAJc3RydWN0
IHJlc2V0X2NvbnRyb2wgKnJlc2V0Owo+ID4gLQlzdHJ1Y3QgY2xrICpjbGs7Cj4gPiAtCWNvbnN0
IHN0cnVjdCByZW5lc2FzX2kzY19jb25maWcgKmNvbmZpZyA9IG9mX2RldmljZV9nZXRfbWF0Y2hf
ZGF0YSgmcGRldi0+ZGV2KTsKPiA+ICAJaW50IHJldCwgaTsKPiA+IAo+ID4gLQlpZiAoIWNvbmZp
ZykKPiA+IC0JCXJldHVybiAtRU5PREFUQTsKPiA+IC0KPiA+ICAJaTNjID0gZGV2bV9remFsbG9j
KCZwZGV2LT5kZXYsIHNpemVvZigqaTNjKSwgR0ZQX0tFUk5FTCk7Cj4gPiAgCWlmICghaTNjKQo+
ID4gIAkJcmV0dXJuIC1FTk9NRU07Cj4gPiBAQCAtMTMxNywxOSArMTMxMSwxMSBAQCBzdGF0aWMg
aW50IHJlbmVzYXNfaTNjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiAg
CWlmIChJU19FUlIoaTNjLT5yZWdzKSkKPiA+ICAJCXJldHVybiBQVFJfRVJSKGkzYy0+cmVncyk7
Cj4gPiAKPiA+IC0JY2xrID0gZGV2bV9jbGtfZ2V0X2VuYWJsZWQoJnBkZXYtPmRldiwgInBjbGsi
KTsKPiA+IC0JaWYgKElTX0VSUihjbGspKQo+ID4gLQkJcmV0dXJuIFBUUl9FUlIoY2xrKTsKPiA+
IC0KPiA+IC0JaWYgKGNvbmZpZy0+aGFzX3BjbGtydykgewo+ID4gLQkJY2xrID0gZGV2bV9jbGtf
Z2V0X2VuYWJsZWQoJnBkZXYtPmRldiwgInBjbGtydyIpOwo+IAo+IFRoaXMgc3RpbGwgYW4gb3B0
aW9uYWwgY2xvY2sgZm9yIFJaL0czUy4KPiAKPiA+IC0JCWlmIChJU19FUlIoY2xrKSkKPiA+IC0J
CQlyZXR1cm4gUFRSX0VSUihjbGspOwo+ID4gLQl9Cj4gPiArCXJldCA9IGRldm1fY2xrX2J1bGtf
Z2V0X2FsbF9lbmFibGVkKCZwZGV2LT5kZXYsICZpM2MtPmNsa3MpOwo+IAo+IAo+IFRoaXMgd2ls
bCBicmVhayBSWi9HM1MgYXMgaXQgZG9lcyBub3QgaGF2ZSAicGNsa3J3IgoKUGxlYXNlIGNvcnJl
Y3QgbWUgaWYgSSdtIHdyb25nIGJ1dDoKCkxvb2tpbmcgYXQgRFQgYmluZGluZyAocmVuZXNhcyxp
M2MueWFtbCkgd2UgaGF2ZToKCiAtIFJaL0czUyAocjlhMDhnMDQ1KTogSGFzIG9ubHkgMiBjbG9j
a3MgKHBjbGssIHRjbGspIC0gc2VlIG1heEl0ZW1zOiAyCiAtIFJaL0czRSAocjlhMDlnMDQ3KTog
SGFzIDMgY2xvY2tzIChwY2xrLCB0Y2xrLCBwY2xrcncpIC0gc2VlIG1pbkl0ZW1zOiAzCgpUaGVu
OgoKcmV0ID0gZGV2bV9jbGtfYnVsa19nZXRfYWxsX2VuYWJsZWQoJnBkZXYtPmRldiwgJmkzYy0+
Y2xrcyk7CgogLSBPbiBSWi9HM1M6IEdldCAyIGNsb2NrcyDihpIgcmV0ID0gMiwgaTNjLT5udW1f
Y2xrcyA9IDIKIC0gT24gUlovRzNFOiBHZXQgMyBjbG9ja3Mg4oaSIHJldCA9IDMsIGkzYy0+bnVt
X2Nsa3MgPSAzCgpUaGVuIEkgdGhpbmsgdGhlcmUgaXMgbm8gbmVlZCBmb3IgY29uZmlnLT5oYXNf
cGNsa3J3IGZsYWcgYW55bW9yZS4KCkFuZCBhczoKCmNsb2NrLW5hbWVzOgogIGl0ZW1zOgogICAg
LSBjb25zdDogcGNsawogICAgLSBjb25zdDogdGNsawogICAgLSBjb25zdDogcGNsa3J3Cgp0Y2xr
IHdpbGwgYmUgYWx3YXlzIDEgLT4gUkVORVNBU19JM0NfVENMS19JRFggPSAxCgpJJ20gbWlzc2lu
ZyBzb21lbnRoaW5nPwpUaGFua3MgaW4gYWR2YW5jZS4KCktpbmQgUmVnYXJkcywKVG9tbWFzbwoK
Cj4gCj4gQ2hlZXJzLAo+IEJpanUKPiAKPiA+ICsJaWYgKHJldCA8IDApCj4gPiArCQlyZXR1cm4g
cmV0Owo+ID4gCj4gPiAtCWkzYy0+dGNsayA9IGRldm1fY2xrX2dldF9lbmFibGVkKCZwZGV2LT5k
ZXYsICJ0Y2xrIik7Cj4gPiAtCWlmIChJU19FUlIoaTNjLT50Y2xrKSkKPiA+IC0JCXJldHVybiBQ
VFJfRVJSKGkzYy0+dGNsayk7Cj4gPiArCWkzYy0+bnVtX2Nsa3MgPSByZXQ7Cj4gPiAKPiA+ICAJ
cmVzZXQgPSBkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0X29wdGlvbmFsX2V4Y2x1c2l2ZV9kZWFzc2Vy
dGVkKCZwZGV2LT5kZXYsICJ0cmVzZXRuIik7Cj4gPiAgCWlmIChJU19FUlIocmVzZXQpKQo+ID4g
QEAgLTEzNzQsMTYgKzEzNjAsOSBAQCBzdGF0aWMgdm9pZCByZW5lc2FzX2kzY19yZW1vdmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+ICAJaTNjX21hc3Rlcl91bnJlZ2lzdGVyKCZp
M2MtPmJhc2UpOwo+ID4gIH0KPiA+IAo+ID4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgcmVuZXNhc19p
M2NfY29uZmlnIGVtcHR5X2kzY19jb25maWcgPSB7IC19Owo+ID4gLQo+ID4gLXN0YXRpYyBjb25z
dCBzdHJ1Y3QgcmVuZXNhc19pM2NfY29uZmlnIHI5YTA5ZzA0N19pM2NfY29uZmlnID0gewo+ID4g
LQkuaGFzX3BjbGtydyA9IDEsCj4gPiAtfTsKPiA+IC0KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0
IG9mX2RldmljZV9pZCByZW5lc2FzX2kzY19vZl9pZHNbXSA9IHsKPiA+IC0JeyAuY29tcGF0aWJs
ZSA9ICJyZW5lc2FzLHI5YTA4ZzA0NS1pM2MiLCAuZGF0YSA9ICZlbXB0eV9pM2NfY29uZmlnIH0s
Cj4gPiAtCXsgLmNvbXBhdGlibGUgPSAicmVuZXNhcyxyOWEwOWcwNDctaTNjIiwgLmRhdGEgPSAm
cjlhMDlnMDQ3X2kzY19jb25maWcgfSwKPiA+ICsJeyAuY29tcGF0aWJsZSA9ICJyZW5lc2FzLHI5
YTA4ZzA0NS1pM2MiIH0sCj4gPiArCXsgLmNvbXBhdGlibGUgPSAicmVuZXNhcyxyOWEwOWcwNDct
aTNjIiB9LAo+ID4gIAl7IC8qIHNlbnRpbmVsICovIH0sCj4gPiAgfTsKPiA+ICBNT0RVTEVfREVW
SUNFX1RBQkxFKG9mLCByZW5lc2FzX2kzY19vZl9pZHMpOwo+ID4gLS0KPiA+IDIuNDMuMAo+IAoK
LS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
