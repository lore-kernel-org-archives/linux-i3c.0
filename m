Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ACA7C87FCA
	for <linux-i3c@archiver.kernel.org>; Fri, 25 Jul 2025 13:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i5ygk9s72Lhho7fLtaxc4zJIIzqLMC7ApBBIVvBI3iw=; b=hAkXqgvg0NsgIv
	NLxkvATv4WhpsTVJGKBsjeQomM2kMBXjjV48VSFkRoEC8Oc/bXJsmpuVjs2WXoTQQitk+eTW4UdoA
	4NwYVAtqGQGfFoZjz8e0MyVLF+o06Y/Srt0o1K4tkC2bI2WvS1pmSg5mOrCbTBE5f/ZW/67yaDu3b
	Wm7UETUoss/qC68tVr3S5GScooVQM9W+FY7roUqn8eLO0bPlrz0J3uhFnJ7fZSq0NHl2Nnr1l4kKZ
	7aWYDau9QxRR4cpYRPesOXbovjkSH0xWyAoMVZntN34c40EUZB9jumo3i18dNZ5wgkvgN0Lx/H/gZ
	LmyCpTsd34ydCc0gAaIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufIk2-00000009w8B-3E8W;
	Fri, 25 Jul 2025 13:45:42 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufIk0-00000009w7r-2dEm
	for linux-i3c@lists.infradead.org;
	Fri, 25 Jul 2025 13:45:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wYDO5312/JMRKbagqo4ZQgPmUklfY9HeFyO/p7jHAteJhYZJ6AxaXIa2jO5vbwY6/9jOUsUOGTb+MosXvi1ASxccNj5DzE+fvJ6sgbvtJxz1f5VTHyXYybr2MXwV5FmXA9SZDmN+XrrtdDAgC7i9onHW4MCHge+DnugJe/qnriOOod5Bq9nVFnofM1XPcUUajDSZQcrM8JzmopQJCHAO4rnVtnAbowEoD9+XGF0bZMSlTMP74sDTZP1kKdXKLDSHOiP6Ty1esYaXWhYu7C7YXAiu+UVevsNuo6BetL3chWFVSBLZkkZUdDS2kBiTCZEjU0xndISZhOZGmc4bfwvK9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lDjBWu6HK2gewFTOPbbXpFuYoVS7ExK9Y3otQ3J/uCs=;
 b=i1HWsd1jtOe/dyxJElc7AMYkcppnXLhggbU0YTVrCJG5m+1IagUwuDdBwH/muvYW2z2tPN6DPPgArROGjLfIS5nNgkDn3FU8r0RLJmOHc9DLYlhF9zAq1VsTW72NAX3i0PbxEP8OXrCNsDzl7jxjGHjT6Nq6yJe3XUuO7FzFo3ePB0upzjFlGzK1xvJTxbmGffMbxKMBrDEOH1KG2zQQ3rorXJiEiuMxJ/esv2vuikOzaNfoWQN5nvgzLD0+xDszB56Je0BdXm0ixxTLLOr5JuLXSd1YtLtd08SXRlWAHtx4Rj9oXUNwdSjTw1YP52Uzmv4i23ovDqd/93U6zPUbSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lDjBWu6HK2gewFTOPbbXpFuYoVS7ExK9Y3otQ3J/uCs=;
 b=G7KPsxMIRiFy2/0bL55NnaPaI5cThVCIEgAqvdFa0+FsZ06ulM4CzYk135j3SMjapxHZimNLStYSN+DQ+vD+V97M+bCA0nX0sX47XF+VywJAjdmKhJIKx3c8M2pE7cH3BdxePeiVqosga2PWB/KXyHE9old70jTsIWd6/F8GkqqYos/5UZAGlMLzqCnEOKuu0hSP1aP+5XJDIZSewZn94I8/ku1YLPhdUDTJ+RY3DsVdntvdAWDN0sMDl2+Q7kBBGig9tVLZY+FSaOE0qkov3ku0E/WAa2SgcKOdoY1VI/qPgzdQlp+IG8HTkJIoSXNy5qu9KJu14GLD1LQBQVJNZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB11409.eurprd04.prod.outlook.com (2603:10a6:10:5d2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 25 Jul
 2025 13:45:36 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8964.023; Fri, 25 Jul 2025
 13:45:35 +0000
Date: Fri, 25 Jul 2025 09:45:28 -0400
From: Frank Li <Frank.li@nxp.com>
To: Stanley Chu <stanley.chuys@gmail.com>
Cc: miquel.raynal@bootlin.com, alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	tomer.maimon@nuvoton.com, kwliu@nuvoton.com, yschu@nuvoton.com
Subject: Re: [PATCH v1] i3c: master: svc: Fix npcm845 FIFO_EMPTY quirk
Message-ID: <aIOKeClm/vOPp4IU@lizhi-Precision-Tower-5810>
References: <20250725070310.1655585-1-yschu@nuvoton.com>
Content-Disposition: inline
In-Reply-To: <20250725070310.1655585-1-yschu@nuvoton.com>
X-ClientProxiedBy: PH7P220CA0070.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::10) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB11409:EE_
X-MS-Office365-Filtering-Correlation-Id: 793cdae9-1cc4-48f1-8ad9-08ddcb81886d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?88ig3fhUFvCQjlBbvnseVCtnuYDvJW8rBYIrNhwxeVxP9oQ2NCF0prjryn1A?=
 =?us-ascii?Q?x5svx6jWEGXHhI3cnINS/IjajM+VPNUGsbz2iD7wM6V4npyAQGoOwF0lG5Ds?=
 =?us-ascii?Q?mYnj2ACpWKM2mt6SqsqvvwNTBICGTJ6R76fz2IEKh/1nJ9v8AwTI04vewZmQ?=
 =?us-ascii?Q?4bIw8Y6vkzYsclFYAO/pzTkbVIE3BLZqPYF9OiSOcXwyREdwNV/Mq1et5F0Q?=
 =?us-ascii?Q?YJNGBF00mcgGuVULQ4eIkoSO/b64ZphI7F1hAj/7GzOwy7IrqYMExMnsphzR?=
 =?us-ascii?Q?VN5n0RPWCyeKONMyb3xKEkjv0oQoRi4ux9ZbFNtK/EEWrHp4bDiULjjsa3JG?=
 =?us-ascii?Q?+zV1HTgR4XAjVSY79A6bDObwJbXPfyPvVvVfu055PEUwgYHGOH9a8Y5P+Hp2?=
 =?us-ascii?Q?7p0ByPRtz/W3DHi0q27etz+xcsP4JQM1To/TSKmyZSv68Li8CtCMagbU1HQe?=
 =?us-ascii?Q?rkGIDUku0+8hQ+hBO8ABf4HPZTNR4VsdTd5xDmX+3Ipni4Z8KbuP+8gxNsmW?=
 =?us-ascii?Q?DMb1YJvkN0pm6uDXjRb08CmXI5dAYLEHSRrm1lYiNRKIlEdMvBZ/tXEz7rBJ?=
 =?us-ascii?Q?yINLJZJuSowWk1/48dabTr8xzGblzHJQqXN3ljNOjTEzobbJvC5L1jVsHNCf?=
 =?us-ascii?Q?oMv5W6DrVAY0vL6K21NAbvxxWu+GH+OSJm+C/OhwGjaqPVoCT5mJOTxtiJxh?=
 =?us-ascii?Q?Z/VjPk0ske/lJD8uJSIcInuNm5/yTFTQKVuFnRC5AiKJSfen45BSDgqU2oiV?=
 =?us-ascii?Q?NlR7VGdtisKcPXpshRQvH+4TeBnFZ9N9/2sKAFu2C7Edd+02aMLtdPztMJq7?=
 =?us-ascii?Q?EOkcwX4Rrz4lZg2rYKhDO4BVFasZ2dXXG3wpgCMCVY8kPLcfPCcV6k9auNGT?=
 =?us-ascii?Q?8aiREETno6esS6Q0L+zj2ayvQ7S1oJ+eE3boGPRnRy6QvcMAIH3mBm4eicpP?=
 =?us-ascii?Q?a0IV8E+kWmjSVysMwAAaP4icSjows/NZmtoLY0PHKE+262JfFHFuIMXowGMo?=
 =?us-ascii?Q?srcmbocpa1wP0qWYdchrFNjfTZlc1jr83yFLmQ8J+w+w8mhzCIR45n9J781A?=
 =?us-ascii?Q?TbJHxoCO3qjBonlbO76qRayFqLX4BoHqQgl/teCBXoOUs9ZftLgbYT8FDaiS?=
 =?us-ascii?Q?Qnef6ZUdHUED2vEGEtt08VlrmXkzAvX/qfdfPKaqnvjQ77/DMHl1ctpNfvrd?=
 =?us-ascii?Q?ngWpQB70oHECS17T3Lv2Ph/olK9amBW6Is55o6cD1dlxk1qp6FWP2yKtMn6y?=
 =?us-ascii?Q?6ctsikKGg0t1oYaWwU2AvctgnVp5P7fhn0iYeT6HqUkhOVe25y7obHxNvRye?=
 =?us-ascii?Q?eD5uIK3UdO4cNTyt6FKj3/kOQ3m6nTnAi6dFdqBm8sXctO+KZUG22sIbqm46?=
 =?us-ascii?Q?m4i3VtCkmnj6bfpEkpfcCx157qUwjjtID4O7LTRYeHF9UOYAXQlhV4HXcDtH?=
 =?us-ascii?Q?RwEgZtE4JCJ1tffmtL3JZWUivS3P+Yq6Xnus+3Qc0IPYTFWFtTKXyQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?70C3d7X3vPUZGFVpHiC1O6p5g3jH9mGAQdMNtZVS0DOyvfubJUxC6GZSteN5?=
 =?us-ascii?Q?uTwsQYgdRy1e4moGNtKiBDASsqHpwaFQgfQ0Z4OS26/pOiO3fZuY4UymgGmg?=
 =?us-ascii?Q?8i4F1hBQcUbd5eRTn1P9n58cNQ6EHXI95osH/LI+NayIKCwuHy0Wyp/LJB0v?=
 =?us-ascii?Q?z0j8FyGCU+01sJMJntqovVu/6Jk7BmOzaXuT8ldvwirFeZBGS0C1BM/7scxC?=
 =?us-ascii?Q?kUcXpcDRcC8jHjyCS+RVBj9Aavu3J7nvRnZ+4L7bjwdXNzt/oS9WaPtBhbKx?=
 =?us-ascii?Q?fvtTjwFXp8UFss2+JBCMlpXwvjgW4g2G/GKDa+jSIWWLKusdNjShK06/g4ej?=
 =?us-ascii?Q?bWqr9dv/BxqllxvzH4unU4KK9s4hlT9NZAaUhlZI+CMvsi0z8TtfgNECZ1Qr?=
 =?us-ascii?Q?zlr2aguJ1yzo8Nn6PMGyHxSzHWYPTVTuoZadynIWVLxtSxmcJAgf7eNV7uN0?=
 =?us-ascii?Q?7335h+BqVQdElhymvjNPGMflGrxosE9dRUjJLKI2gdKKbvRvAjxx3SbbrcNj?=
 =?us-ascii?Q?Kh/IzUm3EiHuYMQ9unCnDtCMqeAndqwrjWuE9t30fQejBo/2YUbdgL6QohQO?=
 =?us-ascii?Q?JyglCFBaLDrZBluwSVLOXVA0Dz1zz9DswfwykL02TOKdUd+yAVevtdCQWz/m?=
 =?us-ascii?Q?y3p7u4jlQDbIl7jOTMXp/HBvEWXq2+akIq83Y+BFBD5GIfNKD9eauso0AmRz?=
 =?us-ascii?Q?DTr5y4o8DhBcKbyt8ooa1j1KrrfR2QrwYvRFmLOT1oM/eVMPXtixyE2R/uJE?=
 =?us-ascii?Q?AngrHGqYwb9Ti1rjRkbMHFH4yH7aWraBMG49JMlgWJZdcZu0AiNXAkpmkh9G?=
 =?us-ascii?Q?ybaPHzzTV6rDUiv1kZCbvRqJAlmMdDH4Y89E92wsPYuR97iNOpr3p9ReqyjI?=
 =?us-ascii?Q?wsXaq125ts+kFFHK/oAwyPm09wvqxjgyqTqUUXSBrfLnY60huSuYtF5CO33X?=
 =?us-ascii?Q?DIm7Pohuet/Cvv2w3AuONXzPGShsjQRd0LrtuRjp7sqDmwBlm4Oo6ai9HYw8?=
 =?us-ascii?Q?pjLW/h+veJ1gOd0o0wkOp8DH+rj2IjsfULMIRw5j3PunqT64SfgXExSS7Dny?=
 =?us-ascii?Q?sfhMKb5Sawb6fTZe6bTjVWGLyqGSgI7JG99HhNqWfOsecgIjCR4nMgwrlhSo?=
 =?us-ascii?Q?btCLnK0LEKH21iPITfA4psguoyP9fN44FK6XZw4lTcgMVaj4dFKPdprUdQbR?=
 =?us-ascii?Q?iPyoJ89lrqt7isoTDmEHvByxFQkdg4bpGlB0BSaS9BlUETsph4cpO71bUidC?=
 =?us-ascii?Q?K6H+QIyFM2PvT1g/VYuAsch5DrXIW7Z43OYkC3/0TJ1b5ntIKIspwXmBb6W9?=
 =?us-ascii?Q?/wEMiotbRB2L2iIns40d60+J/17YvLo6zVKr6hvo2ssUSAS6ldXIe5g9i8D3?=
 =?us-ascii?Q?BSCYavhjgeaHDaM4TBsFER/TD89C2aOdQZWmiVbWodXMSdz2CKBDliAqrJFw?=
 =?us-ascii?Q?sDdcOBZFkGGy5wSB4iZ0ad2r/l505MZN5DTkUh5SG1CY9KXkcxy9XEveHKep?=
 =?us-ascii?Q?jMHs5A8HgWOdc6vV7/dLtfR+QL79ryiN7pVjVEcmxawOGNfcXgPxeNs9db80?=
 =?us-ascii?Q?r0qdd3PLElaUlPf/ZrY=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 793cdae9-1cc4-48f1-8ad9-08ddcb81886d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 13:45:35.8541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HUXmz3hGzuM9NEG3z4m03su5pkcWHkoc2MSvBxeMQnDBOpaCRT5k6aesUlD1ETUIJzBs7MS+RSPzpcA15ziZqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11409
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_064540_667017_2825E0CF 
X-CRM114-Status: GOOD (  20.03  )
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

On Fri, Jul 25, 2025 at 03:03:10PM +0800, Stanley Chu wrote:
> From: Stanley Chu <yschu@nuvoton.com>
>
> Prefilling in private write transfers is only necessary when the FIFO
> is empty. Otherwise, if the transfer is NACKed due to IBIWON and retries
> continue, data may be prefilled again but could be lost because the FIFO
> is not empty.

why "maybe prefilled", please use certain words.

>
> Fixes: 4008a74e0f9b ("i3c: master: svc: Fix npcm845 FIFO empty issue")
> Signed-off-by: Stanley Chu <yschu@nuvoton.com>
> ---
>  drivers/i3c/master/svc-i3c-master.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
> index 7e1a7cb94b43..34b6e125b18a 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -104,6 +104,7 @@
>  #define   SVC_I3C_MDATACTRL_TXTRIG_FIFO_NOT_FULL GENMASK(5, 4)
>  #define   SVC_I3C_MDATACTRL_RXTRIG_FIFO_NOT_EMPTY 0
>  #define   SVC_I3C_MDATACTRL_RXCOUNT(x) FIELD_GET(GENMASK(28, 24), (x))
> +#define   SVC_I3C_MDATACTRL_TXCOUNT(x) FIELD_GET(GENMASK(20, 16), (x))
>  #define   SVC_I3C_MDATACTRL_TXFULL BIT(30)
>  #define   SVC_I3C_MDATACTRL_RXEMPTY BIT(31)
>
> @@ -280,6 +281,13 @@ static inline bool is_events_enabled(struct svc_i3c_master *master, u32 mask)
>  	return !!(master->enabled_events & mask);
>  }
>
> +static inline bool svc_i3c_master_tx_empty(struct svc_i3c_master *master)
> +{
> +	u32 reg = readl(master->regs + SVC_I3C_MDATACTRL);
> +
> +	return (SVC_I3C_MDATACTRL_TXCOUNT(reg) == 0);
> +}
> +
>  static bool svc_i3c_master_error(struct svc_i3c_master *master)
>  {
>  	u32 mstatus, merrwarn;
> @@ -1303,7 +1311,8 @@ static int svc_i3c_master_xfer(struct svc_i3c_master *master,
>  		 * The only way to work around this hardware issue is to let the
>  		 * FIFO start filling as soon as possible after EmitStartAddr.
>  		 */
> -		if (svc_has_quirk(master, SVC_I3C_QUIRK_FIFO_EMPTY) && !rnw && xfer_len) {
> +		if (svc_has_quirk(master, SVC_I3C_QUIRK_FIFO_EMPTY) && !rnw && xfer_len &&
> +		    svc_i3c_master_tx_empty(master)) {
>  			u32 end = xfer_len > SVC_I3C_FIFO_SIZE ? 0 : SVC_I3C_MWDATAB_END;
>  			u32 len = min_t(u32, xfer_len, SVC_I3C_FIFO_SIZE);

if prefill to FIFO SIZE each time, such as

replace SVC_I3C_FIFO_SIZE with

SVC_I3C_FIFO_SIZE - SVC_I3C_MDATACTRL_TXCOUNT(readl(master->regs + SVC_I3C_MDATACTRL)).

Frank
>
> --
> 2.34.1
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
