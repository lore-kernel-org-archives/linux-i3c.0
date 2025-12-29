Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18903E9273A
	for <linux-i3c@archiver.kernel.org>; Mon, 29 Dec 2025 15:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PoOYINxFNUco/yyeRAKFjlfvkoXWfp+m+o4ok4Z/wjQ=; b=akZlxWd424MPn8
	NVDabpNfr0/jiRjuhuzULJQJMvjTlhL0nr/w3TNTeEPArb+VxHWnwy4XamGcvkA5tgMfj/x18FvSi
	yi43N30wMvB/g8/mo3XPOVozMD5obqPK23Xyq1TsuteV+85F2YrDajhhGGYVcbPdZEod+oX/wNOsY
	iMUfmxP9YEIKe7QrcXw/BY/e7T4Kjy1z3tSAVPX5FfZ5m6Voe9AI8qLEqwnoUKWKyM3TiWfFSFSG/
	2hDSbl/Jo7G13MfcoMyau3RLosw2hws7I+gyUa3/hYRdQPmjabsHhTGckO7QAlcFb3Ifs43ch5yYx
	PbvkvcYgv48iYe7hTKkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaFHT-00000003qQi-3Boj;
	Mon, 29 Dec 2025 15:35:35 +0000
Received: from mail-northeuropeazon11012046.outbound.protection.outlook.com ([52.101.66.46] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaFHQ-00000003qPs-26NS
	for linux-i3c@lists.infradead.org;
	Mon, 29 Dec 2025 15:35:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J8gXDkDO4iRrNgWx/Eg+vGjIM6ybTpi3BTUuI/0S1ZaVhw0YoZcKSRP2Vc1eJiPtvbldjC5esur4zqKy2iWisbeDIlOlsWEn57VscxENxkOKbVmSifFRG+XqBTYku8NBMZVFsOIhgN+XEtVL8lty1/1qanb9cI/G2bK9qGaqlksfrDRIQ2xUT5xoldSYwDQVwZZKWnoTmhF7gCXNt2XG3bfG3aB9LLZpw6dhiLf6HojdmsLmJh04fZeM7HdlUUlmH1bm9DuK21HiTQDbHshqJEXYPeoWg23bZYX+TSLNM1/nioQ0Mz6kLbk3pesTCmodv3t4XPxwOGr5c8RTM/y6/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QXl6FYUkL0r87CNppO8NuRu+Ss9goGKzIu/Ac3RDSBI=;
 b=caCq4zmq1sVoUiLiZzi68lb2ftL9/04XVKM9e7GMsFNryJsw47SYaVUojE+cRwZUfBLsyahoTUtQD92XNqooPb77WtZbOZExgrg+gfMw4TnoArfFC03+NIKlO2O3Vz4J79sR0+7fblx85FxTVC3Dm8A++n9u4jXknWjWjmP6wWiPjcs3s9nyHA2j7B77Gb1944rPLqAbOx1DiwkIaF4I5FQD08nnG7l+nwO3matMOEDyBWxvbh7HrcgALCBJ44xBiUTd6rdAdKitw8NdrRsyiUUrxfifxEBOxllyv6bOJND9Zv/BCLRJSKSKcw7FPaV4WWW6euizP1Y5f9vjpNklbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QXl6FYUkL0r87CNppO8NuRu+Ss9goGKzIu/Ac3RDSBI=;
 b=F8p9X02Ax8luwaUzksnAWVElLhczQArvKU0tGI7iVICL9PkFhHPUpHZac9cVox0UwFRSO0yucTLeAcflmah8htSvkfr/+LHHMJ979iKj1Zpq4d3efQPxHNlFXdTR7lx81melodsxtwXoR0cBkvcVCx4EIiCAiDf6WywiPCJ9zz392eUTF/LF0yt3Q7rsYDV7Ja5E+023xFwF7GIv9jyZHx3GwD4MtWLtBBI0AAViPNT/tgsWxnA6ru5XohxLEaTCz8BeXdym6KJr1DOhkvpygr6PTLPt7WXlbaXJlNki4zVcec8GW7rj/uUDMyEOuUnczo19kIAFQd5IRNu7ZVikuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PAXPR04MB8973.eurprd04.prod.outlook.com (2603:10a6:102:20c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.13; Mon, 29 Dec
 2025 15:35:28 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9456.013; Mon, 29 Dec 2025
 15:35:28 +0000
Date: Mon, 29 Dec 2025 10:35:22 -0500
From: Frank Li <Frank.li@nxp.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: master: Simplify with scoped for each OF child loop
Message-ID: <aVKfuq2mzalZJp7d@lizhi-Precision-Tower-5810>
References: <20251224124551.208778-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Disposition: inline
In-Reply-To: <20251224124551.208778-2-krzysztof.kozlowski@oss.qualcomm.com>
X-ClientProxiedBy: PH8P220CA0034.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::17) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PAXPR04MB8973:EE_
X-MS-Office365-Filtering-Correlation-Id: b97069e1-4dd3-4065-6c91-08de46efe4af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|366016|19092799006|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JriWSCpxGDD/kEh+gHZt3gumxdDQL2uTk7XqUzlAhBhzwGz5eDoQD0OmOnSb?=
 =?us-ascii?Q?yY3aexhOF1Nnz3KNdtS1sfTShOQ8/vpaQEuVoZBPT05Pxc7DsR7vCNiSPcem?=
 =?us-ascii?Q?R9ZbhVjLpQWhzWXE1D6f64edijvnQzon7kTum4CuoKvZ2gueRjxP9raXZB8G?=
 =?us-ascii?Q?lIaGb5QkN0aA6L85hOk4WPfeJ+DiII154ZepeC9xo3S6miVMHHvFqrrmy7gM?=
 =?us-ascii?Q?jwicsdg6BETqvRLohaVxlOsmLVamhyY4zfxfzhqe2w2Q/CWLjQ58b1J5IW93?=
 =?us-ascii?Q?TsnxP6g0CxzffQmgdiVar4iLH8AqTc3LUUq65mIqNVK52KqDz80WKYsypGKA?=
 =?us-ascii?Q?TpLOTYUzKTLupE3xn4eKaM3m5hIHQW1czCcVJcYdq3/3ydx8faqONp1HZ10g?=
 =?us-ascii?Q?VhUkKX+b+vTGJ3zkriu9R+LYyyYssLJZJYUm+/aZEvS+Cs2pAjQqsgE+TiS1?=
 =?us-ascii?Q?1gzEVtkdI8HhynbokasfsylafhOUso945UjHX48FGRUSrRy1BrPFIQ03Z83o?=
 =?us-ascii?Q?RyJZjkh5XQhtBW9jEDQ03H+leU5AHQU/7novlUMaEEkTIe4u0CT0ZHbeauVj?=
 =?us-ascii?Q?yqkgytxG2xQI4FosCA6/smltFV91tWhZM/ibjK7nxR6WuTagYeP5BgtpdZ/H?=
 =?us-ascii?Q?q1F4QosZDNXYcfYE2ChxW+Mujk0IJguVrfvDb1KQQ64OcaGtQNrOANfT6ih7?=
 =?us-ascii?Q?WSawp82sHvgfMm8KvWcGhdzA2SmbVaNAd3D/6Qn+9PwMiEZSiZa5q9qcYIpg?=
 =?us-ascii?Q?PrIj/JqV5fPfV3rtFtMlqr10lwVPdW0KIhy3s/ows0JCM/0nT1STUsaVIe31?=
 =?us-ascii?Q?FTOT9gkLOyrYcQudhO/zNGrSg6DMMx1T/9jVYwF/J76fecxoDMZZC45rsCKD?=
 =?us-ascii?Q?I9EhLaNv/gUD+fqPhxpyzhbCgiS6tBDcgqwqEORLi3zkO2aiZqZEaMqpTr4r?=
 =?us-ascii?Q?J31odoyqU3mFiO7hS6YNGuIhFCbUaQRuH2Kux2i7GwFko6gI1g1tIe+7mNVU?=
 =?us-ascii?Q?Rzzgb1Al4/Uo2XO6eUQKHB5dRcGTgZKmW2X/zf+2bsoRJpqJUTDBswRlZNvB?=
 =?us-ascii?Q?uz4YsZswtrXycWt98Huu8+fubtkog0Pa1poEdbGP967ZDZic40hSSJKLLgBc?=
 =?us-ascii?Q?q9a4VSF0qlVyQcX1p+lXLydpJ9VlnVAgHrqjN+q798mvf5HwtYcufYbWw+oz?=
 =?us-ascii?Q?e311y4J4tULYG0xRJmCY9RAoE5m7oISPwWhf/0KYzvDzTxJmnw3OJTBd+w2f?=
 =?us-ascii?Q?dWF2jEl1lztnZYU8uDG76lWKbXXupywGBhDQb8mo/tfVZyHmiIuz+zdT++1y?=
 =?us-ascii?Q?Buvaj1MhgW/LKV/oEHavECjc8ONb5aYu3a/wTgRaeFISGs4TtiiCF1mOdJCh?=
 =?us-ascii?Q?ONZJTkOahxeu5BLXBrLMFZ5v8xTUsox1pP49IQm+Qiq6mlSZudX4/4+noAgT?=
 =?us-ascii?Q?66lb8LoJjwV7F9Orc/kknDvjlpFatkxGhBMvBV+DUBZ3gYIaWGbvTcOP6ABD?=
 =?us-ascii?Q?3RAJJVq63RBbSCXIoFc9cXdauYLBNTGxdHLC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(19092799006)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BbBrPIMrgNfjM9RGeu/yQySxlnxwvZwKmXGhhhiBxlkLp3XudRfBUCq5k3OU?=
 =?us-ascii?Q?u4k/Qw+w7VzlM9YM5VA5jD8Hjuru86UN4lXmz50860lNIQu8SQr9qThGE8d9?=
 =?us-ascii?Q?brMX8abKOMpyYQ7BxjHi/C3ymD7Lo0/AD/XRvO/5IMbE/f7yBIv07dG4l5I2?=
 =?us-ascii?Q?Q0Wlsowr9NtF8ars/fw7zRy9HTxloFmgQtaXQoNBzEof9nVcBjR92ahtYEVe?=
 =?us-ascii?Q?Zd+gT1e9UzF4eMNd4+FZvK5OWRURfwv50xPMMtXnMi9euiUmRd+n/W02phBM?=
 =?us-ascii?Q?Ab+OUGqwU+Av6N32+2nqAw3hMrAIShhpHUGUyj/tMdjeAmtp2TB8Pnumog/D?=
 =?us-ascii?Q?Ej3GDFU4N+WV+MX7EKARM7fgi/nBEolezq2xPmylbLJcNWJwoiC+O7gI7f+w?=
 =?us-ascii?Q?XQzJ6Cvlsq1vFQkJGxVf5My7s/jm9dZ17C1j2GTZcYvAqeP5EWYl8Jo2oao3?=
 =?us-ascii?Q?Wmrh4QHv/PK9SHBcvnMCuaoqaQvpqRClqurdw0QmoBunRNtKkYQdfHz2sccw?=
 =?us-ascii?Q?q/ZabZ4OuKNrmELyt+fwyOhgIxRjJnEYy31LVytdJ0UVQ9XvW49I5M5DfBhO?=
 =?us-ascii?Q?HZIzDQBi0y0NgvrEYKXQG1R0IMot0Nb1NTY0nx6gvzebbdn7mCZDR10/docM?=
 =?us-ascii?Q?z6EaqzwSqbckslKPWK8otwn68pH6Re91cBP7pKvq9Mcoz7n5knlKtQxDKzuc?=
 =?us-ascii?Q?wqqZe1h4QFKBpcfahjszalBybBEnymdfLOMhnpVICMgH54MG4X7e3j/ELxY2?=
 =?us-ascii?Q?JFjPC97CUCfAgDsciDQNWyyvIqSriTE7WxwGumCuiRP/cIHMJ7Ovq5+fPCho?=
 =?us-ascii?Q?sn5hVzZ9u3wFqiB4xZsEsbug63c2yx2Y61+j0et0qayu3PFCMpdbY3ufvOE9?=
 =?us-ascii?Q?/51zww03xJaUMl365bzZtbfymf1j64c3WeGmJUCJhpWGARa+HcOGaWUmOS6N?=
 =?us-ascii?Q?nLNi5EDZ/KcDTErqBAGE1TDuKmgQquixrB50Zoq+PsvTduKCxjH6b2w2ZaM1?=
 =?us-ascii?Q?jGlck+qSZ3LivKAGIXONksrofx5M93eSM4BTnAkX/mPvojobBL2W5+755y8r?=
 =?us-ascii?Q?7VojZteOu7VilCqLbra0PpRyI22JSOx8GAXQNdZZpXvHZMyVYvt7/Ke+5beM?=
 =?us-ascii?Q?0NPfz/b6aBHbX37fadJhIdDNxMcfEPQCyskW2XjQ4enu5N41HKAAWNKKlBUi?=
 =?us-ascii?Q?hnvs/ePq71CKoQaHuklw8cR5eQ85zxest09cf1G3912jiBJ/7emPZH+zX15Q?=
 =?us-ascii?Q?wucnkocrzgvgXsazdl4uDFIU5lG5I6ReYTjeDiZSGQMbAR5nhNyUzB70S1zg?=
 =?us-ascii?Q?0F0xdij3bsY6DUX00k4vVKgjHaOPpI7AvRMgTVyVqrfTNsY8BEqVuHCXN+BS?=
 =?us-ascii?Q?2FMj+lWLD1Wy/6L1g+/crOYbxT9Ll4OjFxjh7LDgnQBGRaE7XCR6cmNRXyB2?=
 =?us-ascii?Q?D0ltMvFIrJ/VOmzjgBSQFbpsxKpUtrVOkLnRsqWUNRRJx2Fhq2dTtFsN+H/K?=
 =?us-ascii?Q?bfwHOlqrms3y+fvOVWoLht3vkN3XO65H50dP4KckKF8HA1D8KD0IQqXya2LW?=
 =?us-ascii?Q?GO0PoTWQYNJ63cZBo85NSa1d2apYIqZcF3pjSAbwNfHecGe7iYX8z188m9ep?=
 =?us-ascii?Q?KImL3AM4I/o8eK3+qVeuZNp4GiiqOJgMlwgeE6dKF7iG3xNGideM/UcQGo84?=
 =?us-ascii?Q?VDOZi+9ZkPKh5i2VbLED9ytAccI8uhWcKlhLTER4d6YRZjOL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b97069e1-4dd3-4065-6c91-08de46efe4af
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 15:35:28.2538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SZNZSPIRX4KSp1585BkRo22Pu+ny47Ih0g80AAZB8J3c+1tKflyuKF23Z0dn8hBgaxRNC18lSYqnwL2Wuhq+qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8973
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_073532_547311_6C9E2689 
X-CRM114-Status: GOOD (  16.27  )
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

On Wed, Dec 24, 2025 at 01:45:52PM +0100, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 7f606c871648..b789ac390937 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -2370,19 +2370,16 @@ static int of_populate_i3c_bus(struct i3c_master_controller *master)
>  {
>  	struct device *dev = &master->dev;
>  	struct device_node *i3cbus_np = dev->of_node;
> -	struct device_node *node;
>  	int ret;
>  	u32 val;
>
>  	if (!i3cbus_np)
>  		return 0;
>
> -	for_each_available_child_of_node(i3cbus_np, node) {
> +	for_each_available_child_of_node_scoped(i3cbus_np, node) {
>  		ret = of_i3c_master_add_dev(master, node);
> -		if (ret) {
> -			of_node_put(node);
> +		if (ret)
>  			return ret;
> -		}
>  	}
>
>  	/*
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
