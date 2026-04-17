Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC076F8E4B1
	for <linux-i3c@archiver.kernel.org>; Fri, 17 Apr 2026 07:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CQTIv+0Fv5SZsg0CF6WdnJP2XnN9koYbhhXT1zITIE8=; b=rsmYGa1EArLzmi
	NYAS0nwtAFovh7HcmvbLJ8ICrhhKTPB/lWSj8Z69AOx6pgGCdQ4PldT9z8qsYUaERKvjXvvMZyOy5
	r85NNLKCizvldJj9fKIDZJZe3T2UdWkpPPElHsCU61UGZTKiRTCWe+GM8e93iUTJu+dhEoziTa4Ot
	6TG61V3zum3wfDifTyKYeIgPr6rEoYU8QNU2U+tkFnzaHTs6rWkb6PVPDj/lA1IQNSqGFali9+M8q
	9Fi5WcsLCCSTR40YF0M1gvz8DCFIpt0wajT7Kfs2hilPWMYMD3ctf0Qqklrv4wb07L4u/oMjLotUN
	1N0M94TK/TqBE0AM7sRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDdFy-00000003ZQk-0XlU;
	Fri, 17 Apr 2026 07:04:50 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDdFq-00000003ZQF-2mlc
	for linux-i3c@lists.infradead.org;
	Fri, 17 Apr 2026 07:04:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ft+98Ene7Cxj1pY4jqLarbXXvPt5M7C6O0q8hs0yisDe0UyvsAsGAAMFmlWCb5HaW4ef+th72HMU7Mlp8OM6KUuyAH+B2MiCkJj+70xLkxjaklTaLESL4W4rjcFBibKX7ev+MZOhXJm1YdOBTrp1pCBzgnjZ+OB9R6meelJo4cGRYcpZv6nl/65v/70IkYu6wyYOuAzW8I6pBaIfg2IGy2QCmZZ6bPQGSit/1UZOqXzwu71ThUBot3sqRDEfinLYt82oBP0WG2rM/9U1aC8rgedv2D4mrLetvqN4Hpk0fdwnOIYaMAcgYGzCdekUHXiYGB1WeqrDP38ZhOS/SjgZSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BufES3ARGXUv2ZuJDQ1Bt/R6kvJDzjAP0iJ7uP7GCg8=;
 b=Oy1EdYU1jgOIRpyabEd+7nEYebfOMem97Ww8yr21zWiu+NUSNeeb74ucZFPcmo9mf2S6cwsAU+9F/i+4MEX6UDpZ8/G0jeooyAUMfLxEl5YRzVYM1/IhLLQmpdZWLC4U0zb9I2bHNrpzegPNWRV4qza+JYwG9XWzm5suqjV7B4ff9YPjuK6AMU5cYrgYkrwKC+jqYPrIqxEnqLBMxFpfNjX/XmAKnNWIcmnFSjOA2tMNkJB1Fq3f+pZmxlBiPc5IM4SgJAyjaErQI/8CirgemPDOuCMBJESfqZ/LtiDYfJv5vUaIb0hnkirT5mP9dA9YwyEXTc2foqGjUAguL0TRtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BufES3ARGXUv2ZuJDQ1Bt/R6kvJDzjAP0iJ7uP7GCg8=;
 b=Er/l6yFQN9z5uYg8W5Xy3hk++WBhwrorEKXk2+1dR91YDdn9t1c5fxVXu3xOblcNlvqxu5izPVMc2A8yUD3Yx3z7tK+E9dlN4BsHOUQcZwZb6YWS+IJ+zJ8ePgdQk2ljpk3zKF20bRA6TouH9VLnlD/1PiV2KyKnpAQgtFfp1qRmLiPzhxG0rdzWMiWqKrhuv0yxbyPgJSnFQODS5qT4EuwQ5s5LlIdXgG6Oxdv+m71CvoLuRhx5pQJIr6cXSrOdn3ozpxG3fNJroJW+JQKJuyYozHJTIaYwIJPFWhaB9kPgJKnZREqKT87w4PNCeksU9sW5ji6qZnpci5+AffzBFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB11483.eurprd04.prod.outlook.com (2603:10a6:800:2cb::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 07:04:37 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 07:04:37 +0000
Date: Fri, 17 Apr 2026 03:04:32 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/16] i3c: mipi-i3c-hci: Call hci_dma_xfer_done() from
 dequeue path
Message-ID: <aeHbgMSDpz9gtU9Y@lizhi-Precision-Tower-5810>
References: <20260416175704.41217-1-adrian.hunter@intel.com>
 <20260416175704.41217-7-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260416175704.41217-7-adrian.hunter@intel.com>
X-ClientProxiedBy: SA1P222CA0041.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2d0::15) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB11483:EE_
X-MS-Office365-Filtering-Correlation-Id: ca6276c4-7035-4a8c-8eda-08de9c4f9669
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|376014|366016|1800799024|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 1PEci5p0mJT3PfzotyrXL9+WgINSUeZRtYZSO9r8NS+esFIEPP97VxEemogwJxkv6RM0zzDuGvxVY8FHsHgdqso6LItFIo6XoRqpV67IoDUHsr5LleJK1BIe4qt8kcgAM2AiDD9GXQBisT4BnX03C7dawtBENBF2uaae3wkoXhuA3WyX6IF0A4y8lR7Gsvf484EgRqDylNsCEAuHhu/Pc8I0yyV76hfOYjxuJbMPXprr81nIR0XOXthI7d8MW/VDLWjNr3ULvN6SfClqEFUYWaO7SpfGwdcVWTRaUA04qaxvPgkZHA2GgGESzJczk0ws/XC7+J4xA81eEpM8G3H6haQndXPkDruEvjM3Nf0/6HnwPj0RRE89fLMy7cjpvdwz8o5T8P/KxYb35Wc6KVZ4OZXYPqNdKKSm30MkqKFSGOxoyM7bcC8SNalIZe1n07kR7nu+LoDYWvRGbQmo4WPzJGxqouX9cppL/onnqKtBHm+jQ8GuWilfANZrvJq6B12N4sieQ7J3daTvGENV+P9s5mA9Gq6yZzPknU/lPpRC4xYDXptOJZEHdUYCIwsg4Q+06o+ykE027EInYE3m9oZ6Hmk0CdINN7bma225QPBaJa2NV06oqzivuStNnKrpLI8bnZZic6TaKQs1+uqWvxgyeyVeiDBU7A5lHXCrLz0F/0+yvolr2TAzuSCa93B1ZGN4LW14aIuW870xScuEzvdkS66Llk/9NQte86zqPgGrlTV9bFDXa82XRGE2G1utAJ8hvxTxPZoGf+KsodE5Ow0lIHMvsQT1DYKP6zFpvEsP/5E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(366016)(1800799024)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lQUnKwhpoLa1cALqRpt3ouDLBM6OBstLCRDHzkLmVM3T5pRTbHdEFyQh8y1I?=
 =?us-ascii?Q?bk15qnpLkuLrrnoCKZPT390GUO79iIjcXF5Qn3Xrsq7dYuS9hv4XlPRWd5AC?=
 =?us-ascii?Q?CCkOxEvG1lI9VKZsswmDb1lAj9Ni0Exqf8FH1hchmw2/6L4m1rmRqakSjImz?=
 =?us-ascii?Q?wcX3fB5872EnjwclodBgp2IomnIKirGouFKtnObRt/xolGGvpiaSD6iaXaDU?=
 =?us-ascii?Q?/ZZIQ4ev7nCuP6a+sSHofSGJK1xyU/erpZau22LtN27xZtDCeXv1Srt7S+wM?=
 =?us-ascii?Q?j3qEkXQcjcPUkFi2bPoE51GEq8wV/bTCvd4S0druzvJxEArhkH+Vc9RlOOMK?=
 =?us-ascii?Q?+cs3Eyxb8ol9+no8ONel7wk/HhZA7CrWwUfnuyuUNv4VTEL40xPTo5kCOkA1?=
 =?us-ascii?Q?Wn6yQ+ihDbRAKyxWKNf6qDPQjfT8XNhNQnmAp6JihbJ90xYcSUKyVRvv5K09?=
 =?us-ascii?Q?HRSt2hUgOqmdmKed8D3004tK1AHJlo2acsni+clqSqJzLvzzoiBxwbDZDMYP?=
 =?us-ascii?Q?5OqAJZPUWIvFHj/Y3NPzUk7TcTILRpATeYbJkAzWDzMMoxRM/+yqujpQd/6b?=
 =?us-ascii?Q?2k5ztKvWVX+YmuJ+6zmcRM2PeObvhbPx+F2FXgicAsrJhNQ8CQf+5IBQxezx?=
 =?us-ascii?Q?26IkvcKAByJcIV2sHVNSjiF8j4KiWF3/dHlvGbvzdzR2vBKVqqFm9tfrPD4s?=
 =?us-ascii?Q?6TBTlnMXIlXoznRhnat4dt8zUH6InJGPDjcaTtOlBvA0wZKiUkJVEIpTvZV5?=
 =?us-ascii?Q?7tVnMT6oOoam2uEzOU0Gn7/jpRdgfrwj+scBh6n+lhvF/WjNAsZwIwFB7V6A?=
 =?us-ascii?Q?/+HEKUoeFAwYuJM+NaAawmR4XXKqb7Lazi57BVoY6c7eHOLoPL8hGmmWxpxO?=
 =?us-ascii?Q?4C/ARV5VdYu2MPShTZCg8Ag53zQOtLt0q/6KHgRWRr5dpp9tjTsmVYpg4mVr?=
 =?us-ascii?Q?el0YP4Y5byJyhpgWEKzzi97CsCBcMic5/c5SrP1UP+YMSgV6Td9zyUSrPVr/?=
 =?us-ascii?Q?/rUc90ML/109m3Sg5ZQjLBXXrFic5M6OrQ/Ar2ZyS52D3N+6TWMRj69xZXzp?=
 =?us-ascii?Q?xL1mfjl2EsVSyG+lV5nvwhUyhEw35pIwCIRtsJ2iiKJ6WkFb8kG6yLZvbH0o?=
 =?us-ascii?Q?eMxs8NhI3tlCU6zENLZebugUH6A0fWYDBa5FI9mKEfNfmQIIrPimaamKYBYX?=
 =?us-ascii?Q?F6y9BLI7ISHnVg4aNEE1/6iNLiqY+YNQmFICc5mCSAHZKgk6n1FumEmE9Qxg?=
 =?us-ascii?Q?cOKw1NbYZQ/KCeiYRcZluuJCLitHuO9+Ojy3Ys6kgby4Q0HTmqH8zrUOhQQd?=
 =?us-ascii?Q?k1ZxMKDV971c5zpQ6DHYMAbI4UqAD0BUG/A3+dkpzbMftdCV98KF7RkYMaXR?=
 =?us-ascii?Q?FItNOrMTmokgp2rctW7DZR0HLj49dO7HmIjhUTA5cB3nwHTiv1SBmF7q17vd?=
 =?us-ascii?Q?lKNks4wivBEZIDe5CudJehHWOpg6RDXr5vR6nS62ODzIsRYG8f0SDgoSViZx?=
 =?us-ascii?Q?BadbWNeEZ7x59HezgdJUbLVMhn24nHZn9xIOSpvUh9qdLS/klqIyrMIiqnnD?=
 =?us-ascii?Q?lZLNXNb4IhFI3dJibwTnIINczgf4v61XD0HcBWETP5AKz7/rIGOkwPf2S0s+?=
 =?us-ascii?Q?hDuAfIzYQ+cUwHyTEcvCa4bxZwP9j8Vr8ihAg1o1/MnexKzPFEic54xQ09To?=
 =?us-ascii?Q?+P5KDqWAnGLqQXaAwvwrEpvHqx5jrfLtd1IE5U6yZkvk7w7a?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca6276c4-7035-4a8c-8eda-08de9c4f9669
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 07:04:37.4285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oIrkthgTH5r0tpk8wPpO6N/HDNIUL4eRTcDKY9dsI+MW0rN1olct1v2o+kFt69iF4FkcGHAQjyHpd2WFSeEdRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11483
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_000442_722690_5AD2B097 
X-CRM114-Status: GOOD (  15.43  )
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

On Thu, Apr 16, 2026 at 08:56:54PM +0300, Adrian Hunter wrote:
> hci_dma_dequeue_xfer() relies on state normally updated by the DMA
> interrupt handler.  Ensure that state is current by explicitly invoking
> hci_dma_xfer_done() from the dequeue path.
>
> This handles cases where the interrupt handler has not (yet) run.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/mipi-i3c-hci/dma.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index c9852b85d6b0..28e4d38f55d3 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -635,6 +635,8 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>  		}
>  	}
>
> +	hci_dma_xfer_done(hci, rh);
> +
>  	for (i = 0; i < n; i++) {
>  		struct hci_xfer *xfer = xfer_list + i;
>  		int idx = xfer->ring_entry;
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
