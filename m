Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC55CD343F
	for <linux-i3c@archiver.kernel.org>; Tue, 12 May 2026 16:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oxMTCLib50HBGkzhdQbFuvvTjmuU2rSrXrgLnne6wOg=; b=HdkmuR4KspzLjF
	L2zhuXAaaBOaZU1J87VkZlzgmzlK//8GWcqw6IDnVbIyvGNR0ziOlgWfk8vwnYbF7ekwvQRrzlcy4
	Z/FyIjb+2I4lXXQAYt4Xx91sopn/mnHqUViKyO1bR1kJTh/i5usgMxk7WdqurFwmU1RB/zg7pzMa/
	aJrgOMvLxDrlGUipNrct6U3lzdEtoKPIJ7f4wWNSPx8YOS2/bsdJAsnedwooXIPmezc81B57GuPJB
	CnOReeOfNFAvgFYJGpn+qPJFww+zkfijh/0O8URj5sNGRUWXAm8GGSrT+fy5pKSqHQQvzJ3JtOP/h
	FTr84hdGIzmdJZfuK5bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMpzw-0000000HMsQ-1ebf;
	Tue, 12 May 2026 16:30:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMpzu-0000000HMru-3gp0
	for linux-i3c@bombadil.infradead.org;
	Tue, 12 May 2026 16:30:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rJMlzob4hlTnFBmNeZKgTezCt6x4Z4QNb7iModLC+4A=; b=bk2ca6oTDKb+goPCDfI9a/CxrZ
	nV9F20Xlwa0Lu1WqDRivrY9oBHQg0VX622r4HaAFj7s90DpjhO0HxkaEr0r8jmI+QR7sSzv+appyD
	aSeo3tkPNQlD3otACEofgoc+ACWCZQTjbKyvxT0CRJeJyT+5MlnAOr3ZQtPwREM0bRsZae5Yj/X+p
	AEEQi2yhC9Lh0GWjbjmhifVhraCtcCe9ugcwYSTlsMKRVQHingPsvVmVj56fqcW+nTSn3G6Gl1vYa
	qMTckzsKAfpWINmphQnKMYPePeGXBflBFP3cAMhI+3w0tyY4BBtnAIgUoYld6os4zwR/+LukoUwtS
	AjFzzO2g==;
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMpzr-0000000FKsu-2AI5
	for linux-i3c@lists.infradead.org;
	Tue, 12 May 2026 16:30:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TvQoZZ1FGJmRFzTS4+gCDLdZvRUo0asRzkdk/xN+aUx3C9I+BCFA/wDRlaMKlnTXkzOfXfhw5bue2bM/b3Z1aneeu70HWo31qHBu6XkbZzD6ySjfH1vbuY75WLNd60bxmve0+CRRNpwFyE5jOJ1iF80vqKLx/+lVSeS55elh+mFFXFgHyVyVaQWf00DNV+lmJ0FwNhp+ixYb4cCcR4Q7TLYIk/h6juqqv+En2FMc1d7kEaRWaUkYaWXovJoXT+n625mq7E3iqsADHcGEuoQ9uI4cM3VdhBTUKFwiAsIFojILEs7TQKhmoJ+OjTBmDNTNTXKLzqygJUD72+wQg8w6ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rJMlzob4hlTnFBmNeZKgTezCt6x4Z4QNb7iModLC+4A=;
 b=fovL2UZlOtlLb47f+13Ar+gI4lQvB7rTskDevmkOIW5nD1ENqaIoubS6V6QtaEHmMXT8SzfVlYj50Uf0zpe1mQ86Bg3/jcn6F8Hv25b06EuHghBZYKIx010JgkKqoQp1DaqHLFS+4Msl/31ZUo3hl78j9vz+tN1Du5feJHXMDckUTHk8roz+aPD4MMPpDaNyT8d07FsZUZbe4hWvlPALObrbP77VJ1inOU6ahfG7fHn/b5+CevVc8ypo4cdm+Yo7fHTHaqfnZiMRpVjC4IJT8sW9lGA53KnPq5QyZ8DUM8c6i7m3goFgzFGtyhTrzQflyB5PM5hECoroRO7G6I/7hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJMlzob4hlTnFBmNeZKgTezCt6x4Z4QNb7iModLC+4A=;
 b=gI/nUyx4iNZVEQuN9mTIfHWHRDniQ258bBh0/Z+b1vCTbaEF2I7HAFYAzcaW4ia1YkACwiDBgq6OFBF0/36crfa69rnpMVyCMw6Jd4bfQDAzN1FrTK43NYKuj/ti8du1gWtnHZdX4SipGqsZmAfA+LHQCetdxvB09MHV5Iz6u+yEsnTktQjrVCtF9OV1WjKQBU1hrUdZm7AveVaC24x73rGQYyQ4s+nVVbxvQ0mFD3nhRMkmDiWSnP5ID5Hx+VCWzvv8SCZ7XgdOkPxEUf4LTy2ou+6zqHD1lBkq9MVTZ0zEuRhmICf3TMcMPmmHt6VK6QwEwCuxaFm9ZyIR/DQk9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DBBPR04MB7562.eurprd04.prod.outlook.com (2603:10a6:10:1f6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 16:30:11 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 16:30:11 +0000
Date: Tue, 12 May 2026 12:30:05 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/8] i3c: dw: Drop redundant Hot-Join cancel_work_sync()
 in shutdown
Message-ID: <agNVjZ73zYC6Dw6t@lizhi-Precision-Tower-5810>
References: <20260512121732.406009-1-adrian.hunter@intel.com>
 <20260512121732.406009-6-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260512121732.406009-6-adrian.hunter@intel.com>
X-ClientProxiedBy: PH1PEPF0001330A.namprd07.prod.outlook.com
 (2603:10b6:518:1::19) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DBBPR04MB7562:EE_
X-MS-Office365-Filtering-Correlation-Id: e0ac6622-490f-4011-6fd9-08deb043bcf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|366016|1800799024|19092799006|22082099003|18002099003|38350700014|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info: qGIcErm/nyEtmbu5KA0/NbYm2L+oRzH9U2eBeZpB+JvtdeoUOlLW5vcFQ8uxx7MrDv7YhxLJZR2Fz8vhKbROs7uUII+3+wGEbNLTwKRNG5GQFjQEQoByvFt9Ya+UrurPu42+6YbD7ZsKLBiaUybR9eGbeRL7EX7HjhK4H7qFEf+pXqQGq2TfFtYKRI3+h+R+aG42dlcUGL8F0UyQFJrdYkwhNNwZFSyUAkhvkJ4Uo8pFOM9uoiA3Xe0qpVN0JsRP5Pn4L9UhOfkYUNUvZjxel5puVhLrC8kS3tn4hMkBkdffJoDsizrHTf2RJrjS0JfmWq2ygJJeKBFwMH8veuiNWuUov8Ju4AsxHbCe6vCcpcPjScgdV/FhMYqWIq+6vtiFI4ncTHQf9t7tPx9B869fJPxJBcNH0p5yS6dE2nVbZepHwldhWBnIUKUU7xZqN9OtOma4qlegdkhLnIaHSpfwdEG/e0M6lRMrb0f6AjICnzGKCGvy/qX3Wmyb2T1dS7ajp46z09jT1PQm8d1IGXywFzgggwgCNN+FIvTbRgj4i0hjsI15+1KQ01SE0E3wgEr9yz+GXeLGA2eIII46N6FyP2067Lu/TClQZLXMhpAZrQl04mw9I/DAoj9Sdg0AybqVlnutSy17DH8oEi5UICM0O5h+4OXh7VXT80yi5xDsL02dUlDvmQ7gxRumqsv3mfxe8cKNMpsL5g8sKwzjhoirkRbvFm1WSttJVcjm/h5ubu1LMB6RH8nN12mLDysQmGLa
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(19092799006)(22082099003)(18002099003)(38350700014)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2Xp0uUiVMT0aVwUcVBA3JWKqDWGJb0zXSvPJLnR3bN9CpZOM3KmbUbi+2pHc?=
 =?us-ascii?Q?Za0Y7n8ZFveNQprXuUDjhtG1fDwP6Nxx1vitmnhv1yG0OZMTPyAcEN5F2r70?=
 =?us-ascii?Q?ol3FvlB/6SmGc7xVf1IswzH9b6Q2XBSX4oQW7q8/8QD7KS3NBb1skePso9j9?=
 =?us-ascii?Q?no5oHB9H2S14fh4xE/utburjJQ5i3O3fkz2BswP4HnIUbD3RMHKPxeM6zgKq?=
 =?us-ascii?Q?xRxBwZiclzznzqw0fSzCtEs+xoLX+0TF5gls09igL55K5GGFFxrVrcKyIigP?=
 =?us-ascii?Q?jVz5k9JSNVS9+TW3mm0qaXcb6wF86R+W9uZ2+yhT1MQPd9kdyobjUsQA3+pN?=
 =?us-ascii?Q?gvFT60zZ6FVIAU9gfwaX2AzhdYxrrJ1sNKLQCr3BFQWnFy9PMIoQ+s5EtATg?=
 =?us-ascii?Q?T/BVM08QQLFo0ZgyDuLLXPfrlSEzL0GhKEmztr1kssz8Tqtv+9R5UMnFPx0t?=
 =?us-ascii?Q?QjTev35MPDzuZYJCkQBJlP7cxcBoI8mRaOO3RIJW411WhGeM76e69B61Uk1i?=
 =?us-ascii?Q?cj+1ZaQ0BULJ46oryagHBZ4rlkPoGJaFazTw+34Fa9K9gPcnBmXadIT7DbwB?=
 =?us-ascii?Q?UngsVGjIOu/nTPT2bgL9CFM7OQzrQ78sWPr8pDuzD0oor1+3PaYbKleke082?=
 =?us-ascii?Q?1zlsOZ6D7VOhsDTATRzIItecb/QXFtc418Ane4DhQVS2eaVrpF/KTZMCR+nd?=
 =?us-ascii?Q?jLVWAihTVbMGfGrwAjVL6ZdE3HfQ7q2QxnE6OZHGAT3YqGDVew+ek0ekjNEz?=
 =?us-ascii?Q?6sKmVSlcUYBgHNh7BBqWac6SPw/n9O/IbBAHAYZ5uF5iTr7sfAtiQktBlP6D?=
 =?us-ascii?Q?UZQql83Vgqv/BQ64bP5jALliwDoWh2YLgAcJwAJ9WdJqvgBBeHIxYJWY5Usu?=
 =?us-ascii?Q?9VKGyAKTfAS/jCWWHuAt7hUo+A/8nlHowvNIGWqQPsto0XgKqJ15dLHH21sw?=
 =?us-ascii?Q?pzc10EHcc1iun35tM0fWM28lW8MtBbVfJdmVX7Abhcs+V0+1YfvYKLUDLLVQ?=
 =?us-ascii?Q?CmnvRJksBj0DJqHhu2Bj7pdQLEewmYaDLIXBXHVDLPe5+I/N12LDecd3AYo5?=
 =?us-ascii?Q?xENhHJ/9akoD+MxmnZX9U6Vcm9hrqG5+n5qe9MPND7AutIjhOpwDc9frtWTK?=
 =?us-ascii?Q?kt7R62siSOp885oSB/Ml9Tg5RkQ5L/LUVd5CBZqdpK6wR52xQvn2jJOJOz01?=
 =?us-ascii?Q?7YpLNApC+AbJdeVGCJ1AVAOLHoH8Xdqx8DQdkoINKVa9BnQ178h7iz76H7r6?=
 =?us-ascii?Q?ny8si4X0VosjV3TdYBwMvAWYKStvzzlxs5j/7xSpa4YGoMzgiZ/WtjzQ02nU?=
 =?us-ascii?Q?zc4hdyyUTAwkEtsC7Cy3BHTi3/d6aIfc5yG3brDg5LyQnO83s8cjRIgVQIdA?=
 =?us-ascii?Q?IM4DMziE8Gq8ZvuE+JFLHjnIvH4U+295BeW32kxJhg6R4UXIIqV5eVafF9l3?=
 =?us-ascii?Q?1Ou6T+U/FS9875jp77WfPuObxSgc9mfXUjpNgI5QmO+GWljWs9CRGQgSCp3d?=
 =?us-ascii?Q?hlQszvK5b6szafbnGSs94igjuH1eTOIwcmmCGKKve87sUCg4rSnGyMqD4hVm?=
 =?us-ascii?Q?IKwjSAV5WM5f9GQJ0KChMvnY+nH/RfTNgW3PTUyNcnBUqbN2oxpnD3kyOrxY?=
 =?us-ascii?Q?oVbQTFMaoNLzZ5KfVwax9baEKK+jilSvvwMABy39zgL0JxIQZxBgeNmceJJ/?=
 =?us-ascii?Q?CYsgfiU33vqerW3PZn0V06twHo8K/GdgKu1hCdw4ZQp4yzUhsl/Qdt5IQHT1?=
 =?us-ascii?Q?s2t1XCugGQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0ac6622-490f-4011-6fd9-08deb043bcf9
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 16:30:11.4989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iB0CWnGGxaGzFzbFf8HXXYJa4vbgj776Z4xwLChtu/6PRQAE1Qko3lfWuyb/OYPdOz7b1kr0xNKqNq0sQGa38g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7562
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_173015_962844_676C51BF 
X-CRM114-Status: GOOD (  15.85  )
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

On Tue, May 12, 2026 at 03:17:29PM +0300, Adrian Hunter wrote:
> The I3C core now installs an i3c_bus_type shutdown callback that
> flushes master->hj_work (via i3c_master_shutdown()) before any driver's
> platform shutdown hook runs. The explicit cancel_work_sync() in
> dw_i3c_shutdown() is therefore redundant: by the time it executes, the
> Hot-Join worker has already been cancelled, and the shutting_down gate
> makes a new worker a no-op.
>
> Remove the now-unneeded call. No functional change.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/dw-i3c-master.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index eb9a13a73684..c7030d0cd8a6 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1793,8 +1793,6 @@ static void dw_i3c_shutdown(struct platform_device *pdev)
>  		return;
>  	}
>
> -	cancel_work_sync(&master->base.hj_work);
> -
>  	/* Disable interrupts */
>  	writel((u32)~INTR_ALL, master->regs + INTR_STATUS_EN);
>  	writel((u32)~INTR_ALL, master->regs + INTR_SIGNAL_EN);
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
