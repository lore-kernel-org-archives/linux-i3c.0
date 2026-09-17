Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7566C982D2
	for <linux-i3c@archiver.kernel.org>; Thu, 17 Sep 2026 21:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ts7IbvB06SC5XcgJnp1NkK5YzZR5TbUODhA/v+5HFQo=; b=zav9wulba6S+nj
	7rb2+hoPCa+RnILbH4WBiI2Cc88/Iui7JEYRnyNoRUgpshyPUxi2no+3qKA7GIjfqS80xH/xRHGzf
	0K9J+qfPcomK9CdQEgnSkhs/VxIkuN67Zb10f1G2jqS1NU/OE5+arT+TzLN2kOF6W7k18bV3TSY1q
	mZaeZoueYQ6oebSmIHRiLLPKRJwv2Bux0jAH3XFJ7wEpKQ3I0x2T30sRFuJVOsoI5kqdaSJmnvtvV
	SZ4GZtsxCgU2Ae6NRfkKNTiYVEgLGA+1qP5/yFVAAWvCGI78PcpjkuBx9ciMka5RMNNrt2I885rUT
	W+XhgTP5tvnH41EGSqjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JsD-0000000CZkB-2gP7;
	Thu, 17 Sep 2026 21:42:29 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JsB-0000000CZjR-22Gf
	for linux-i3c@lists.infradead.org;
	Thu, 17 Sep 2026 21:42:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AtJHYJdqt8SK6qvaGBYmz6/8GK7plEwLrDQAAPeNibbk6Tc5Wu90W/6qzPmLB/W38UzWUuS12V6+HsASlEAv2Ly8dtssmHH37A0p4fgKO/XlQll3c7U7HRnt9KXcSfESLfYl72iYeVnsrxQCoilsHijXH0Ht3hGgal5SFUIetW+WGA8n6nIk8mtemphRTq3bjJtu5mEMTQeZ8Hwq8sXmjLKCPw2wGrWPcAElOZRMCn65NtJQsEed/5HtFFBwwd70lMtPMESmQ+rtqWqfKkOSEgbHxvjzU83C7XKJ3q1x3/RY34DBcXU0fZJZrLi2l+c9xrQDu06JdWOypoUueq8iDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZaxCBYiYfamLDt2oyUzBHeBuoVEhYN24E6AvblH9Io=;
 b=U2E6yPsUgY3qJCtaIcX0YLfvhtjDoV0pAFoSnz1AF/CynzWQA74Mca1vV2NBNEr2nhKZtOfRo8L85kTVJ7pO4yAALt1NQXIpnZt9uTFi6m+vOysJnQR7xndiCzwYu6/RVKPiwiZj9Eb4HgUC37t2Xk3+9NH27iAJJW6cOVJI3Hbm8uFv4mIbDKpO+DD4xXGE1ByGnIJUTFj8UXYHs5TyPf9nWAQp1/nUBUK6+qpvvP9CvOwZHMvxDl/eg2cDW9LfiKEkVFcGrKlwObGEokWpBrk9uMJ/0kCA45AazpRUUOvj27ZiMhHDF80YLY/owwNSCC7DAaI+6a7xMbLBcjrGYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZaxCBYiYfamLDt2oyUzBHeBuoVEhYN24E6AvblH9Io=;
 b=x1QVClm/mnzIaULvMqStWDQqKBTeRjQ7U17VELKz1BWaMRNbGWImbp1XX8tsN1KafSxh9R6OJNebmgRiuv8cbVD6vJPiDET0HQ//e6/Z7qM6yD4dvtyK/vcwi+qlGC7l+Sffkxhof8i8eZchmEaXAbGsKaWk7Cf5X6lm8Dw7HTnMnqEC77xSQo7RwOvWDHVasg8ogPL7iNbQYbZWwDQXTlVrYHo0T1t9catwqqyRo7ozGiH5e8ukILVwkgr5LW8SkOSB3ng95is7SRFxWvHnBfGj3Wr7UgIO+4OMYuPH01Azg4hDaV36884haRXarzhAq1Kg0fT8wWv2PvfgXQk/DQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA4PR04MB7519.eurprd04.prod.outlook.com (2603:10a6:102:f3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 21:42:23 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 21:42:23 +0000
Date: Thu, 17 Sep 2026 17:42:17 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 12/17] i3c: mipi-i3c-hci: Correct RESP_DATA_LENGTH to
 bits 15:0
Message-ID: <aqxeuRHbRu_JRmR8@lizhi-Precision-Tower-5810>
References: <20260917191356.133242-1-adrian.hunter@intel.com>
 <20260917191356.133242-13-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260917191356.133242-13-adrian.hunter@intel.com>
X-ClientProxiedBy: PH7P220CA0046.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::10) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA4PR04MB7519:EE_
X-MS-Office365-Filtering-Correlation-Id: 33c05f63-fd05-4e0a-5ec7-08df15048ead
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|19092799006|366016|23010399003|18002099003|22082099003|56012099006|10067099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: b5/9WCEOLfYd3GPXroChhMkGmVCOLTOWSNyD0dO5R5YonWua99PyyJOtKNOgGO++qUVCwC0ilCFtVo1IQ3LHtAnnSOVf1WdBgQPl/ZQyTbD2F+D2sIZnY8K/zZTbrdTKXMObM3F7ZxIw02kGTDnAL58traZxeIX7w+7N4vFzZBukx+UfKVciEI/Lg4dECawUHfk2F2zCEwJwhg03nvqBOgDvTwH4bztKOyIz3kBCGTuiXwAxP6peFuacH8JMsV2ZIH3tNY2J1S478knLHRWLvM5c8xyceShTaQ86ps5aaQoXfcBCzLaiPHNJVrQEdFNXC9blY2UFFYn5l7ZsCUisdPm7uJOSRWPepVDBji0TJ/LzTiI4TR+HCk4cVZ4MZRHObJcUtALCUp3NVMVBiLfGYMqzPOLlhZcDATPtegMvhz/PO7JF5E6yizDxAPPLri08tLDiL04YNELd/wSiRFnI3Dhs+Qklh1xOZ96/m5grijjV2uCqlyFNLb+YeuzMD1T28LxGfBIoMGL6s2d+8y1QEhu8PHEnAKRRVDwUFONPCNBtlCUHzx5XhztMWMKy5AzDyvo4t8uuYYcaFXLvxGCzU4BH4WVTZ4JfjktAK3WPR/fA0pqh36UQzXlwmccyrtREhw2gLQvvq3yCxcPNPgBGfR3xdK4FqdGG6f4ixgzpGIE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(366016)(23010399003)(18002099003)(22082099003)(56012099006)(10067099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nE4G+SKvlFxCymHBsI87Kjwdi6N0bubBwD8cNINt+MOiuThpRJay5TTxrNIS?=
 =?us-ascii?Q?bmuZb2rjyEoMs9546/qpOoAS7F4LGmPzkplXBwRRoVo9rCGKIz2kOWs2+liO?=
 =?us-ascii?Q?pzzWGCaZgoT1JZbcKKxARv4oVFG1YY/9m3/TXYENd6jc7DrR0V+vIEjHyWKN?=
 =?us-ascii?Q?ebD0JVq/MLG4mZkF9xzXiAJwO8fCtVDnTivrkX5ioLtI8u9DFo8NQ8Va3K2d?=
 =?us-ascii?Q?XyxndTORiD8cgWmnRutFm93W1gv6MhzascSCtIAPesPogEe0qTAZvW6W/sZD?=
 =?us-ascii?Q?zOoMey94QnKIpvG+QcLucTVcZT13oKbbA9x8n8iCvLGiPSv7kwp0CayVHOIZ?=
 =?us-ascii?Q?PrQOPOPZ3OruT6PvogFj9Hgn0o/G6yeRCNWXghAWzyd25w/71ABS1gjMqHK8?=
 =?us-ascii?Q?siLMQ5Blb05lv+9MG2jp37BcFAB+yQJxeoAVFojj/LJWuIY27Tv9C//8Mj0s?=
 =?us-ascii?Q?JRZfd2BwQg6XqBKDnIN9gUfeijpnye7blE2tlIs+BpJuIAGaTvp7rJmAXWvI?=
 =?us-ascii?Q?RfEsk5lqYiM2vnD7AvJgJCP1qywWLWCbOF3l17gshBmk1to5HoFEKxLAurWb?=
 =?us-ascii?Q?BIqVXbA7ufNxP54eZ35cf7Q9Vg1cYD3PnrB6oaVCL6ja3TxxLR/2cPxE27RT?=
 =?us-ascii?Q?jYzthhTAWts+Ve07bUB09qpOq/AkmIw9PUeOMHKM9KIJCpwnbrp2k79Hob61?=
 =?us-ascii?Q?v012vP2skWZgjuwCUpUZWT36BmkRnk+DUVNJ1zCBkmyvAb4bvLKKxHhGr6z/?=
 =?us-ascii?Q?2f5AN7CFsAttIPKTRlJnoWdt+h9pRiKPZr3oF1apiHD6qxL51+5StDFT3Jh6?=
 =?us-ascii?Q?70caENPcO/avryKzdVVL+P8ho1ThrZ9WAuyLm38g4Ck/tR8aJ/ci5FZiPppj?=
 =?us-ascii?Q?CHaVHUobW86OPyHjUOxOsjsihG50Kn8CSJnfkeMligeS3CkjDexuZLw7Qw+x?=
 =?us-ascii?Q?AxxdkmugVtYsI0N4sS4IE6CKes5Hc9fyw2d75b9VhKxTrmkVZBnAyaxdxyLf?=
 =?us-ascii?Q?FQBINlh9dHJnSU9K4eMwPw3QbHigbnaQKnjd0n52UwqHb1VAYiuMNP9tkRbA?=
 =?us-ascii?Q?0dHqtTkdCUwCcZ3dQwtOC7mL1D4971RWL6uyJkNHsJAxeZ5UDFnn2WgE4Jto?=
 =?us-ascii?Q?9s/lOo/+lpJixaQYkLRDBwhyP97JXOzsZHEinGUN5uEFljNJTpiVRAEljWC5?=
 =?us-ascii?Q?8FUSDMWCnedtXiYC0xKgFJp/yumH+cJ3hUAManJQwuKYIJ2rj/oeu4dzodTT?=
 =?us-ascii?Q?o/izTNkN/7v4afuQX5fPSri/rgHcZ2xel9yC1XRzrjBiaP51qNAcXyl6mDph?=
 =?us-ascii?Q?XEFpKW1NiWRTxoiUd0ibkRQXy8cHoz+xCcl8AA6l2RuYZT0bMCClFvxa6aXM?=
 =?us-ascii?Q?+QAMIkL+Vbakh7SEhSwKDpp69EideQgWgnokZ3bq6JM1mhaFpMKVm6xEcLdX?=
 =?us-ascii?Q?dne97gPGtx3eD+/RKnxxRGOdiEPU1QccQ8X/oHlmi5vIwn5YKqEANIT3l09r?=
 =?us-ascii?Q?t8EmWrofrJR8V0gsXnOzs9EliMVd/pSS+wua8Nmin02uCIdHP3wUH948sNCu?=
 =?us-ascii?Q?8pSPRqkxHHictxMJvqRqKefFp6OhVIpjY2LtGmH5TZ0RhFnouy74yJtbBBa+?=
 =?us-ascii?Q?2F99iyyh4Flhc69g11WeFddck2OxoUqe91GiEsVlQSV72b7ouACYFtuE+nPB?=
 =?us-ascii?Q?a+6o01oc55LkO9sptE/hSxnjkBh3O7S0SigRsv6KnB98wTOylgNq1ZDMpA4+?=
 =?us-ascii?Q?cddiEc6Ns+f4aB+fYcXcx6HXeiKkfWSB9584G4Tgdao4eVhwjE5L?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33c05f63-fd05-4e0a-5ec7-08df15048ead
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 21:42:23.4705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Td/g7pMZqq4TW4dZtAbsW9wIwh4nBtFrRSQUrZ3BsCEFtd/bXFiyi05PFjDXxyHRXS+Ir0dg9G66z4tX7JPUEJIiz3vzTWin7EvcdYv6BMv5THEeqZ1DxhHsWIhymkX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7519
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_144227_534000_75268D2E 
X-CRM114-Status: GOOD (  15.37  )
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

On Thu, Sep 17, 2026 at 10:13:51PM +0300, Adrian Hunter wrote:
> The I3C HCI Response Descriptor defines DATA_LENGTH in Bits[15:0],
> with Bits[23:16] reserved in all published HCI specification versions:
> v1.0 (Table 91) and v1.1/v1.2 (Section 8.5). However,
> RESP_DATA_LENGTH extracts Bits[21:0], incorrectly including six
> reserved bits.
>
> Update the mask to match the defined field width.
>
> No functional change is expected because compliant controllers return
> zero in reserved fields.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V2:
>
> 	Reworded the subject, which was previously "i3c: mipi-i3c-hci:
> 	Fix Response Descriptor DATA_LENGTH mask", to name the macro and
> 	the corrected bit range.
>
>
>  drivers/i3c/master/mipi-i3c-hci/cmd.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd.h b/drivers/i3c/master/mipi-i3c-hci/cmd.h
> index 7bada7b4b2de..e0d4a6e0e319 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/cmd.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/cmd.h
> @@ -24,7 +24,7 @@
>   */
>  #define RESP_STATUS(resp)		FIELD_GET(GENMASK(31, 28), resp)
>  #define RESP_TID(resp)			FIELD_GET(GENMASK(27, 24), resp)
> -#define RESP_DATA_LENGTH(resp)		FIELD_GET(GENMASK(21,  0), resp)
> +#define RESP_DATA_LENGTH(resp)		FIELD_GET(GENMASK(15,  0), resp)
>
>  #define RESP_ERR_FIELD			GENMASK(31, 28)
>
> --
> 2.53.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
