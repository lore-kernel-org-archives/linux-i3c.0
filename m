Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B383C55174
	for <linux-i3c@archiver.kernel.org>; Wed,  5 Aug 2026 20:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B0BZEoocVDI7cCRyOLpIaM7/9+u/4m5PCdLxyclSt+g=; b=n809agXZI8NYYv
	kxTVE9eFSfzNDYFSzLZIMnm72fqvE46PNhAHcDCUsP4dkKHX8Ru4otJkSzuyD++6z5sxZQGgneECy
	G2+RDsrUQ5b7hnylGLMOMcKOARQKzbRF04HGUkEVOS9iYAGIZ+N2A02wgYCjtFLueGQOad5jNNS2c
	u6u3AFcR4kR22BjrkiKcqKYzpAG3CRMEOqwfe+8LUU9e6U75FpNF/197Hdeo6oGRYDUVAtyEFyEkU
	KVqlQMPpBzIcLoHCQ6JGLR/ySg71d3xA+eXNY3fEfzwB5eZCTsNnMF9Ijmmj8Ktc2ufBCmzu1czxp
	G9VdbnA5m8cnTmdTpEpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrhs6-00000004Vpd-2ZTr;
	Wed, 05 Aug 2026 20:05:50 +0000
Received: from mail-westeuropeazon11013040.outbound.protection.outlook.com ([52.101.72.40] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrhs4-00000004VpG-1YLt
	for linux-i3c@lists.infradead.org;
	Wed, 05 Aug 2026 20:05:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SW2NJw4pZB9pyTVgdSCDLJ6PKYblALWi2+g1ZZqAym/VZmV8ItpJsAXLRTohYitlA3fmNQn5sjZjvNZwNRRZMMG2FOE5JegRj2klTkRzmjlvWMVOuCAqopX43TBl6so+weQa99qi5a7woVrKcS/20pn8nmFrBfU9Ny8W5VnPa5hALqdSELmTkKI7oqu6rD4mczP4kSL1CAoySvh0feh5jdNERfW35vaGe9qbIH7o7R59UrCUAXK4/qMUPQO7HbZBMAHMNIb03CPw8MBnjVMuvZREZiqFb+ZdLNSRd50zjLzqhEFF2jTObj9HG4o/6IekyK2VKq+uWE7rhjr4v91eDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vgbxl0O1bIS8njVYgpIveJQUmevgqBsAzt7YOZcd48E=;
 b=CTnBwVZevJ0BNYrhwqfkELpNZDMqiOwjrieDaS4i0MKCN0C6K6w1sNWoVSegzOAyocUXjOz82XHY/nrWWNCwMA1GGJfXDBiGFttKirJl3P3igRrTJrwzylE7Sk4NdHzduqYfslInPVhm7Oiu/QYo0kPEz939zIu2cMms3g838Dw66HwjtXuIHMha+GhXbCbTMVlmB0Bbz5iz8y/62bjYiXYKxtikLMaz3wwqxDsoPqViPIVE+c08reU8Ng18Eo2HPrrwJl7nY669uZ8UOOMwFV/qStqXHL+N57rMKzqGF1iEMdDgb+F5pKsPr8ed4rBEoJ+wsTFY9OKK3G6hOvMV3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vgbxl0O1bIS8njVYgpIveJQUmevgqBsAzt7YOZcd48E=;
 b=RepAEUT/hOa7SjxXs/7A3dEPTGi/8gtI64ETisn7wTKdaYQr4wmoeTOSzfcBAnhqJ/JVHd8llvfVFHMQm46hTt9LILcmyuY0ab81gl3b/am8I9kPsWhnBTFVax9D4d03INL94gYEUalcLDjHa3Q1ZOYbbDi5LaFoGGQ/msSvaGC6WmTf9/X3IiktHnuhkMhmiJNmtHUxbU+YzrtT/fhNoERt0VeoPAAG1AIgTKT3RYs3g2UxbursWOL8HVOFukMFld4RkqD/2qDMm8Q9HGf27zaJXTblc/2WapMnYFYR8c+D2FuXOmgQKDGAPohhkIoDNLXtZAxUZhBTv/P0bdb0zw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV4PR04MB11851.eurprd04.prod.outlook.com (2603:10a6:150:2d7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 20:05:42 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 20:05:41 +0000
Date: Wed, 5 Aug 2026 16:05:35 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: dw: reduce do_daa time if there's no client
Message-ID: <anOXjxCRfW4qfPaM@lizhi-Precision-Tower-5810>
References: <20260803140307.12665-1-jszhang@kernel.org>
Content-Disposition: inline
In-Reply-To: <20260803140307.12665-1-jszhang@kernel.org>
X-ClientProxiedBy: SA1P222CA0119.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c5::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV4PR04MB11851:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b21253d-fb7c-40b7-cd0b-08def32ced30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|19092799006|23010399003|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: DJmBQJ3DkBsllyRt9BAc6ZnHsAJw8yOPqB+wWUyGNTtYYqgoNS9wslx6bFtxhpvZdCW7ZgYBeRKcbbvTTpH/Y+QWoGS+untRWu2jvfjYQftF1qUzbquYZsvW++KChxGVyL1i7btI9QwZN9z5c8n2XPEZf64bH1/6r76SNaA1b9GTvDEUGijD2lWjUI4mIrUS0b76HwbotxMiAqXV8a0EoxFbS/bGY0qKQA1y+yS4P9Yhsk5Qjk+q53y6cfytMGt2VSg0CCXr+tynvSD+3QjitTej2oev9vMyds4Ysvae3rh/G0q8/6waqTSiTLHVRoc7r9c+acxVHgPVQ3rcs5WABRwvRGQa66jEQDEyb0nInLtUNvU4T9YQ+zAXqdpuXNlmlwAG+R7CyZbEgQnN+URfsOAAY1heiGltdRVlrE/Po671c02BOFyTImJBe/74QoqEpSgToTbZAm7U4OHplZMnRE1kMY73LJP2vr3QE49uYExjCmq7mmMqeTXDa0nHGUIU4WxVu54+S5Bfhr3tv9EOJlUv34HRgf83FyC2ZIhJFbVtVFEm0+13M70j4Mmcj+5OW+EPZIfV3HSAsV2H/6r7J8KrvqXkuPNDz1OmzXsphy9k8krlEecmqOrPSOGfcUw7zgUouTcT3mVfsyE2MhYZiVobU1FT43CRkb4PyAyfgy0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(19092799006)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sWGCaiQxVQQMxHN8q3/WExtXPPBFjmkM4P/bv2Gu2/CaksL7i8mbX9thsL3H?=
 =?us-ascii?Q?sNvn1zZsxBn0oywZ0VViErhv73VvLi1J+zLJsgSU3RfiC+5jjmDh6TINhSOG?=
 =?us-ascii?Q?jaSWrl57npT7eobqFUp7iBLlfduyqOUU4LIfOwHRGuUN2wmAXbB5j5DECG2w?=
 =?us-ascii?Q?xC4QS2zl9ZVSpU/e1oFHkx1Hq/bmAqYamA3mazXds6vhWWG1oEp/Oa5PbgK2?=
 =?us-ascii?Q?vnJHRsvteELmHIQrFs1Z+q1sTrZr45XsdBV1C29PorQBLr1Nb01RzyoQwU9V?=
 =?us-ascii?Q?Q40nrC+32dC1oLzjH0I3VEQgdWbU8vOj+I36UvjQY3AZmSzw86Co+E11q9AI?=
 =?us-ascii?Q?4P8MKq2IBnCKXtPis0OB3IrqHD0nVZJVq9l7Yow4D3KtCdYsUmtwvSFE5Uou?=
 =?us-ascii?Q?00OpNkn/FhRD0ZL8sUgCMorAckJJSSVy90HURqCnsgEikLIb5V5850/TrJj2?=
 =?us-ascii?Q?nvYKY+rHKgZ3j0CRX4q25LJwgPTBBTUKEguDeO5b2e0J9akhh3t87yK1FFYg?=
 =?us-ascii?Q?Y1+UlpJx0lrJmAOBRnoq7C9JR1odEgJ1Qr5v7q+JovIqD6CLh4X5g/ISNO/R?=
 =?us-ascii?Q?amoNOwJ+Jhb1FwQtM/CsYvQD/Sj8nvpCqLHsuKQap58vzmwOdfeqfrVj/Uk3?=
 =?us-ascii?Q?QnEwuA3tSi/JaJ+kx4XPEIaWe5xX64uEBby0QKtw1bbMEXu3dGjZM5yyu1xq?=
 =?us-ascii?Q?j6pBKpjxW7nwZQwikg9oczyYI7IIIo0XdDaMmsUdj/zMfGwH1pY0M7y6LMWL?=
 =?us-ascii?Q?gPSbnaGTHC6FUOMbhwXjtRgEnfnOj/vk+hIjD7cxHXbl38ksfOrXZXefdmFo?=
 =?us-ascii?Q?8Xu+bbApXzoYE+pL3oCG0pD8UInhZtgMAueEtl8cFwpHPtHLL0fvQ3z6UdLr?=
 =?us-ascii?Q?5pGSntasVjhBP93wM8GE+OEVZWPFtza7Fi/BP9Inn6m9dXf1aOyPrigZqfhm?=
 =?us-ascii?Q?i1eBlFRH8kki05Ml7Risojp2x8i9x50rmAJiEvpkPG3CVJaUfh/wTo+ov9JH?=
 =?us-ascii?Q?eueSPCfeOewdnf6zcAu+eH9B33s6XuSQSn5yw86csO9biWKO2LGDGT5KRgMM?=
 =?us-ascii?Q?fzcNNIeEmo2Qz9tzvCzdHxZ0/OTEJ/hY4B+tkPn6sfR4B5NHfyQsY8JjMpHe?=
 =?us-ascii?Q?o15qdGwV6+zQUboExWKsEz9f/3mHKstdqxdb3xBEFmsETbr8MS+QICfVibsC?=
 =?us-ascii?Q?RznbdVmStFGsbaJdTkjg+AtDnpKr1IgRwP5pU/wOZnsqHdIq45n/zok7j1Yr?=
 =?us-ascii?Q?/drkHdDu83pY7Jn2ETw1PRbQ7XwFXAARYgPWcWt3Ye6MBA1QDw2psfIRyhX9?=
 =?us-ascii?Q?Kxc/iMo8Oj5ZPfic5ZCMj39FUJTQ6n3uYDHvYNpG+A8B5TzF8a3p4MW8u4oM?=
 =?us-ascii?Q?cjlRPfXZh9NkuZh6q9XLn2Cjssrlgwfb4DlhR7LzyblieKcBK2fBNpS5dpgR?=
 =?us-ascii?Q?MBQlS7MqQNHAODN4quJqxpv4HA+2l33iVwzoYKHe39nHPpGeDRzlLn/1hOA9?=
 =?us-ascii?Q?Nkpkex+J8xZLw7sZgGwLFnlFksdm65e9RpV72pb6pOnGiFg8F2l/b7Y726Si?=
 =?us-ascii?Q?acfSftvbFPDTs/t1VuPPXvNrvyexZxLQ9nBZIEwzVmcitaU0IWLD7yY/H3qM?=
 =?us-ascii?Q?npYZjvqWYujdfPuePxDiKM6w9RMeNJ3S03l4CgUntkb0vsM0mczAtF+OzNVB?=
 =?us-ascii?Q?ncsbDl/be25Qcz9lHtsVrtAJjbZg5gL9qDeO7CBwsPSQg/4FmcfOWzjxvfBg?=
 =?us-ascii?Q?+/uslDwBpRQE30BNaPksilssnMxruKJ5ERMExEXpWqwMBsq4FGJ1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b21253d-fb7c-40b7-cd0b-08def32ced30
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 20:05:41.8556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /rTEd4YDNLobCU2xdxmOXOIdfsDl3jIHM/khHl6KIKpZCUDLLFR0f7Q5lMMt4ED75lOvSZkWqZQY8CXHiSIRdM5oi126cT9gFR6xmdn/2FEh6+MZLX6BwQeP2M/j3NyU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11851
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_130548_431864_7B014B67 
X-CRM114-Status: GOOD (  15.34  )
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

On Mon, Aug 03, 2026 at 10:03:07PM +0800, Jisheng Zhang wrote:
> If there's no client, wait for completion will timeout, then there's no
> need to add i3c dev at all. This can save boot time by ~6s if there's
> no client connected to the i3c interface.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  drivers/i3c/master/dw-i3c-master.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 0625587f1527..18ebf304029a 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -885,8 +885,10 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
>  		      COMMAND_PORT_ROC;
>
>  	dw_i3c_master_enqueue_xfer(master, xfer);
> -	if (!wait_for_completion_timeout(&xfer->comp, XFER_TIMEOUT))
> +	if (!wait_for_completion_timeout(&xfer->comp, XFER_TIMEOUT)) {
>  		dw_i3c_master_dequeue_xfer(master, xfer);
> +		goto rpm_out;

not sure why save 6s. timeout already happen, does register i3c device
takes 6s?

And if do_daa find 3 devices, then timeout, you skip register found 3
devices.

Frank

> +	}
>
>  	newdevs = GENMASK(master->maxdevs - cmd->rx_len - 1, 0);
>  	newdevs &= ~olddevs;
> --
> 2.53.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
