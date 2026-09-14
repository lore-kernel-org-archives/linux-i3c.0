Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4AAC88E6F
	for <linux-i3c@archiver.kernel.org>; Mon, 14 Sep 2026 16:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EJTky0Iz8MIc6r0/JpfAw1KOGyUQFyQ8Q/YzM8Wn76c=; b=iTdWoxobamv5S1
	HY7UjNaiAPlgtLL73ja0/mr0sEO16VR/wRlPXJx2V86RKNh3Zw1DJ/gG+Ck9zM8dlTbrzczOcwh8P
	GNn6/cfXX1A8SKaNiUQKMrIDHd6lADalwX3NpPKHPk8aBh2GFEl6z+QXURtpd8+4diqBXpLoOOiDn
	vruuarmWyIiLUiQ0DWQjg6YHFIr9zmICNJMv/WkSBo4j4wuPwiL70LXtoxfShKY4vJ31EkYt6uaTu
	SuV/lygmVO22JUBP8WOb7aTUWePEtxOGAYHG97uEbpcjeZRnG3070NQE/awDNOMtf9Z6CFXN1KP0/
	qqYXxY81oSW0e5lWRJPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x69yE-00000004LFP-10Mj;
	Mon, 14 Sep 2026 16:55:54 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x69yA-00000004LEc-42Fn
	for linux-i3c@lists.infradead.org;
	Mon, 14 Sep 2026 16:55:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pZfugcV7sCnKCqAYILWDCb15iZwEft/adOqgHtL6jBNXECCWLbpX5s8ADYKw2VQU9mZWpQlkm70icfZK5L7Y7/Dmp5pFiGMpwP3g3K7l/yyf6Bll80sXsDKiCaiqHnKiGJz2KejHo0DLB1Q9JnY6SfbvKLvE4B+GsNUl92vPNK7SyEE+jxA2ac/dxeK7RM/pr7ONPBqsqyu8VF0xjxi/0k7q21P8KCA1cL/B49W33vrsuDSKsq+QfjVlz7jU/KflgCpzeznV6AD0b8s+BUaDrkmUb7xSVDCVN+P015Jh2sTdVg9IDPCv78MUpiuJHq8N0DagcnVkUPXTCXKlOXKudg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vOwTCR2iaEFoI2pvOcFooFuLDVoCQeMToZBuO3AjVFE=;
 b=IU/cJmPzjG/87nP4NfzMx6xjG5Z3FIWtnjAnuRY6lreGWLV3vV1URnBsflolmyUxqMH0RXiLvLXoC+DDsPwNRFOhizpWe8xx8/8zShq96Sdy2Jb0QmNqj45NHWMLH6W2N3YJdghgIL8iCSKjev2ZpEVM3sMp2iMnt/XV/WNeyYzl2e/YzThqlkIZcA3B9qpUTmC8GdTkXfbHrHECQguAStd69XAieAordF/BApLCEnYWcKbSbG8fsXAmC6wTc3OQ3vp+ukXkw2Hyud817BkFFtn270nYRhtIo7eqrOG4+Tr4btLDLDxoQTl56wLOc7Pe0r6B9GaU3W8LoJwHOEHkhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vOwTCR2iaEFoI2pvOcFooFuLDVoCQeMToZBuO3AjVFE=;
 b=lgaFMW1/61HfCflO4iRMqK/rI06ddqxvhhBJUK5PkdNpcLSy6msH33WLgU83C8fQ2DHHP5sWk6fNAAUXG3voqcXQ/aBdK5dQlxtxQx9J+SB94INpA79lbbjX2Cpo/MAOlTDVKWMuVTzsjkYKH55u3oDsd6zB0kAqSktkHoxgBeStzno84GsYYhV5ciPzZ3QP7uBqbINjPJ3qehgxm4Y4ITbZs+I6yfi3aMHl9SUY7vNvw21migPt2VZRYvFqDYPM1hPFhfJK54U8hgIuuOrGlLGIuXIj4W3FAZ9PQWlmerKqSDE8PLecSeWqgf/0iBX0rEIsXP99yfrjJClcD0x8Mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV4PR04MB11876.eurprd04.prod.outlook.com (2603:10a6:150:2ee::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 16:55:42 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 16:55:42 +0000
Date: Mon, 14 Sep 2026 12:55:35 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 12/17] i3c: mipi-i3c-hci: Fix Response Descriptor
 DATA_LENGTH mask
Message-ID: <aqgnB3MOkkRUAEX8@lizhi-Precision-Tower-5810>
References: <20260914113003.183150-1-adrian.hunter@intel.com>
 <20260914113003.183150-13-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260914113003.183150-13-adrian.hunter@intel.com>
X-ClientProxiedBy: CY3P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:930:fb::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV4PR04MB11876:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cba3bff-e324-4b3f-343b-08df12810351
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|376014|366016|1800799024|10067099003|4143699003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: XPBCKCMRPU4PvL05jduKZj7UruoZoJDgqXaqIK6Jflv47oRePkqj8mnweIWtgV5taFn997NM0wDPKR2Z507Du578UgVN6TMHX8fYakCIUw4Tt623rJA29KrhrRMDoulrWI8XdETTEJFaFQUitLXGB0MDe90VbwzYxo8YHLJy7g+1qZqJHWH4TXS7o5ezy11y66uKEOu2kKbLV9mHDzj2GcQVJrJcNS2bCSjRQWHvNYQUbHiIVdAaW6ZYJyZEgr4JRCz4lxKqzVWPwEKPPMw62tNnHspY3kmOMCWzI8wRB0k0SCbIJp9xIMd4gDBidWFNkQWmlVrdMvnELb8aN+dZzm1WP4X7W775QFfi0wuT96hT3WewA5oDF4AhOGMvA0TSIVDtgxlkbAmOsnHyG8BLnhG/2EY7YlLwyXhQbMTAdJ3Zd8VvX9hfLQ4/Dh7apLRIwBgk4L2Rb2Tn4P52vsnuyIb9KbMvEaoMHyqkZp++E4zDzTpbJnw4CnGZHRmQQUB+5lftKvKjYHIu3Q5EvzFzzhOpR+zTnbJVK4neryB76fUAU/Ah+Gy8n0bSpZ8bB1EMRU9pqdyIW4BHuvNaIqvtlEbUFIca5+ZrZHUxhrn4HBg/v/U9slI0zODBAsi8hXTRFXbCC8mi9RJTx5Qbgrn7AsrO6G6GaFaGfIK/5kTNHAc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(366016)(1800799024)(10067099003)(4143699003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GYNjA4H1KusnhBF9Xhnq17d1RF4NbqKK69PsMD30xUnza4luiJnW8gbP4PSj?=
 =?us-ascii?Q?iu/numk+jf3wu4wfPoMoq4d7LRa3zif9R40jypASEqyDtyuUbA1yr8hrXGp8?=
 =?us-ascii?Q?xBNSp1CAobnXf/rLZVdT2B85NnAoFz4sGTXu7dwBMdoQeXkCvTModMQQmYTu?=
 =?us-ascii?Q?zvf14mLZvX8KWTejnEj0UOUd25vKArY2q6DixmjgMteK/kuVBjTNm6As/Cnf?=
 =?us-ascii?Q?EatMO7XS1LOX1E6FfeXS8kJVmj8cLr85QGIsGFvFhW1DV9Yr1mnZoyuqzlXJ?=
 =?us-ascii?Q?PiAMEet9QdjaxmnBc5bIDZTs4ZT/8Ot1AZd/nS+ehWd7D1LHGPk6Iq5pr3Xo?=
 =?us-ascii?Q?FhhWxweKYWMczxzmbnZZ/Khqnr2gDpWVrk1m/hS3jCjRL2pUcQeq5mQKW//2?=
 =?us-ascii?Q?/eQDaKpfbkdLa7o0jYsybLIhse5HE76wrTvEu2vALpvcwoOhFsLZog8JMIfO?=
 =?us-ascii?Q?2oXGxhrMMw/UKjkXeVboeiGoph3fCs4v7/vDFGs6Hv72fubejI3tSkGOmuwj?=
 =?us-ascii?Q?42V7x4B4sAVdGsuTc57fW+OAkVsgW86e18/gHmnICvicRigg1o1809PAUS6/?=
 =?us-ascii?Q?aQAAKnRqDCOgfoe8i8FOY0Nlm+dJnlX51RoRDf5bNPIGj8PNWSrAslKpWJeZ?=
 =?us-ascii?Q?2Ax70mX8lZ90gHQjbg8WdPyvHb5wgn2DXKZkXxsc7xBKt3c8wV7UnLqZVO7z?=
 =?us-ascii?Q?PdT4ErMuQx2Czj7cK1aV0Z9zEHqVqnIvd5QuPxTBe7CNMrdWta5rj47aSFB+?=
 =?us-ascii?Q?zGS11EUiIseDZYNSTSDymaJHnEaQ6Z5EzTc6QM8dT6dBzcPwhddeg7a1f//6?=
 =?us-ascii?Q?aoHz5wPHjvwXZxIVqQ2g9goGANLLom3ibdUFy13n0nadHOtkXfiNPQuLd7ZF?=
 =?us-ascii?Q?e5IpyYc7SMu63HcWRxwmvF46kmoco7YLOH/mccvSkG3+uY8ieeRerNTAmTiw?=
 =?us-ascii?Q?5vMcIRPNZg3YUt1A0YA58ZNRc3ucPVaBWPvRYYo6wgb+aV4J7EW8aPHhPdgk?=
 =?us-ascii?Q?PWOvwESMwMDGn2ZQpUdDo+VuiAG7Liowva6wDtPdGrRaHlllJvCUvFcVllGf?=
 =?us-ascii?Q?W78deHDmogwYvjZU2xawnawn2Y1gGFFB9P3ksSxOTo0Vd8PnFPjbrNbzwkYx?=
 =?us-ascii?Q?LjQIIRyrPfDPfcJi8bhlFS3mQOesISqFXKh0bgM/adsY2BLhLQCslUbCHmOR?=
 =?us-ascii?Q?IK2OhJ4qieKqk0l/deZ30Scxe22GP8XZw5B35Ygvm/uAEPie7E8bmUvzoEvR?=
 =?us-ascii?Q?CSa1wfHUrHoSlt1lJ85OHOo8NktmBKOLCWK/tkk91en5j8BQeHzHyXbyBcyS?=
 =?us-ascii?Q?/RWzDDrepEUMJ122vb2BbmIQxOBhtsjMrsKYQm34pi22UU9Ps+K8e6PAocxp?=
 =?us-ascii?Q?CtJTncxr5ROqK2zi9Ei8q+TwmlaX5xEg80MGjt9oQS9zUKFj6NVoYDN1spmH?=
 =?us-ascii?Q?kztApHBLPqzB39fBu39VsP2WqtWC5TUGWRhXGj1zqjZo6MQ4xf2ZEOZiiwR6?=
 =?us-ascii?Q?V7uWgnXqUKXbWbtrAgVy/JZT9hm+VvOpAivSxpEwJzF2F1/sNVGaiHkzM86h?=
 =?us-ascii?Q?plWl0ucS4RKhAiOMiZXrw5AbkbiVJixVOPpe8/GnoLY5AhAOcTau7KfsvOFH?=
 =?us-ascii?Q?iFNamCHXrQ/XfcQ/hiBy7ubrYuzetru1TwpHsRY7oGaNO/+LoL5QVErt1k9O?=
 =?us-ascii?Q?Z5UqmaXBl5XjzcAup+C1nhqpc/HreTFiPC3z+HnoUsipMZ0rK7FglK9rHScs?=
 =?us-ascii?Q?BPtE+498uEuX0cdLOIPoE3U6/Cg7pSS7o7k8tvWzcqjzCi3Ak9o3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cba3bff-e324-4b3f-343b-08df12810351
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 16:55:42.7241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sy6nk1FVZe7OKCGHnnT0CVrRxgezjuhcJ4iYQT1roku2MpwtzYkhW8znirCFPmkbg7pf/nOFIiTTAcluneQRWjnjBUC8D/FEzExLcrccnYyFw+FW4OR52MwrZ1wsoUkF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11876
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_095551_000624_01E09FA6 
X-CRM114-Status: GOOD (  14.38  )
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

On Mon, Sep 14, 2026 at 02:29:58PM +0300, Adrian Hunter wrote:

i3c: mipi-i3c-hci: Correct RESP_DATA_LENGTH to bits 15:0

Frank

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
