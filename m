Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC34CCD4F24
	for <linux-i3c@archiver.kernel.org>; Tue, 12 May 2026 16:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sDMLy273RukPg+JRnnapPiH4WSqs2dXul6d31uHIm2c=; b=Nc22EoDZgQO+Y0
	SkrNMF/nJeb5Pf9yU9L+ZsUDdTPaoHoGoP4ouv+ml+yM7WeVZmndDG8VEn3E5WoBogtNUd15FJ2/m
	B284pmsT3s0jn6avRhcFFzKhAywZ2PICtI9vNVSEayzZUuxOGaT/FqNzAaLhVrAPQRuz+KuVkfwgW
	3+WkjCWLGNKtFOrY12olg4WM/nQxvjL6ojwW/Wd4DKYj28YuXQjIX1Wc5Ey4w5vxtnBTa/LHKWXD/
	BBXeriB4I1wXxUOOGvwTyq7nh0t6fLPy0E3LEl71FnNOl799Kt2gzO0hGSupBiqYFU3dRrl2zmF0t
	IGMwPudXzx6BzjR7Br9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqG9-0000000HQYO-2hiU;
	Tue, 12 May 2026 16:47:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqG8-0000000HQXx-0UfQ
	for linux-i3c@bombadil.infradead.org;
	Tue, 12 May 2026 16:47:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1AK/ey0jyyrFNzIpRdY8UhjrqQOAEfYDL5tfTQ/w+ds=; b=fclC9JgHd+q2BMxKUqzsO1kEmT
	PXpMVLqLeo3MdDWfDp44tgqjG0Xb9huVD/lRa3cKJbL5mClbZ4ORiY2T8beF7rZhEAldOjiI3P2vd
	uzph2tinpp6B/lrC2AcNFvwdPYCrSLeNLW2S3QSmLC3d7sNf9ivrXRcjD4rY0NsdLqBEAEK59nqr5
	BaY5i5PUW2v2CcT+5N4bmJ300ykZt6Am576WeGmC7NaMIIQ6C1oCPszGReJ4Za2giJ6+jxDbNW/Hg
	UNO+FerDtYXBIIkm1DTPwpERj/2t+LAyEmQUoBF5BIdNxRRulnGFYqPtvT27GotzbznBbVPlLUcBu
	8ebcbH5g==;
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqG4-0000000FO3w-2JRd
	for linux-i3c@lists.infradead.org;
	Tue, 12 May 2026 16:47:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hn39hKc9QflH2XYvBo9TVWkO5J0gig9zclyTDpojXOds8LKr4ZXY2UgYuHLwCfZSqpLRGrUHCHnqjCvju6h8/2GWUty+oWEl4NIyBAnvee4hI3qRPF7a/6hPWGHwjw844cqTrXMICO0bEGODvEiOBmd2yvTFEWyjGm4jjeLgXBZNzNOIUHRJp/QZxdvVFIPIiBxIVrsy3HYJ2hgsYS8I2Y8DzAc1Y1fZgi1cQa1FHna2mv5NaXv4PZBN1NhjZRtH2+uauSRNjr9JBpFqeQXO+GsD9tz+Qyn0mJOt5YFhgi/KPwnz++Exnhckc493y3zEjSKlBaBlVGmvzNmWDq/61A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1AK/ey0jyyrFNzIpRdY8UhjrqQOAEfYDL5tfTQ/w+ds=;
 b=XjAjfW7OKzDj6eGh3DpjEFOJgEhhjkgd5TiKyXbk63HnAm8I/OOEaMQTqiKLwSPbt1jokYE8ZpbIEa4wylYS4HuanV1YVsxko2ZfZ2D6hRWR+3UzUiwXC+ooJ++w0hNOVjrM7Vb9iQ63m5fhLS9+42HsRED7CUgstURZWPA+DNwBw9hiY4BdV7/GUAtHDLaLpWCBFxZu3kYAnZ6K8D1YaQQIWQ+rRlE0TywkrXlh3k3hIu1CinMJxNP7RjrVI2Laq1hoe1HXgS9RFBiNOKLTgB4SeEi4YnMTISeKWKOlriUQba+oGbTdCAOPbc8LxitSDh/g8pAREPBbdjM9am78rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1AK/ey0jyyrFNzIpRdY8UhjrqQOAEfYDL5tfTQ/w+ds=;
 b=DvH4mw3WZVclbGkn0KDObCr9j9Q3EFez97Fmv1LwoxYaBQFnEUH94cox5df+iv/KAWiF/8jtNLxLctldhmsGWdHQcMgHEot2x1wM5t52WU4Gx+SfqDT+WRGMCkll7RPtClV3fGmyAP+VgVuG4vCnX1uh+myMUz5MCyr8Nyx+/gvIshogxQQTboYryviMPqkeP8Y5MwuWDDFSI/ga0dTKpOz1Y+HXb06hxLbd3na6EWcFj+B5eYRBztG96nW9wAK6fqlakyfDq7yh52ryuIMhty0bmrcjSi111X3m82BVKnrgKrfeRMFh2RdF2k+5eJupq/knxQ22tuqVMO9B0TQSPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB8069.eurprd04.prod.outlook.com (2603:10a6:20b:3f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 16:46:58 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 16:46:58 +0000
Date: Tue, 12 May 2026 12:46:52 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 07/16] i3c: mipi-i3c-hci: Complete transfer lists
 immediately on error
Message-ID: <agNZfL92Fo5qM0Iq@lizhi-Precision-Tower-5810>
References: <20260504113352.38490-1-adrian.hunter@intel.com>
 <20260504113352.38490-8-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260504113352.38490-8-adrian.hunter@intel.com>
X-ClientProxiedBy: SA9P223CA0003.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::8) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB8069:EE_
X-MS-Office365-Filtering-Correlation-Id: 38f96d62-d4de-48c7-40f5-08deb04614d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|19092799006|1800799024|366016|56012099003|18002099003|22082099003|38350700014|11063799003;
X-Microsoft-Antispam-Message-Info: eQYG1hoLN2Ep2+DpE0XCM7mAzVpFACz0JdHHc+Zw7QhoRDU+7dIti+l7W0D2A/Wf2lelMvv77kxyUyHq6D0m/Hao9hee3NNcP3W0ntokIEIQAygxgLTvEBC6V3Ugc5hNZXhj7alMpiKo86p4/5KkCQf2o4+bgNCcuja+qS4kF8NSjMSQtYwr+RouBtzTaEznyvKnHVeuumIPdG7lrzo1jqEqCNdKUbeys2u4iWquzJH7Z6Uz8xy4o3bFnKG850qToV9lxGwNgXiw5yWCl3cgdpNWVy8up/440NQ6T01lWxrl6nRF2mypLvTE61rcGN3S8JoCY2a/iNUKFBWq4JlZj27be+qkb8p53z4pbbuB0mnp/LOjtUMpgzK/cETCyTf7FopAguqeJUAFwkZJSntTeHaPID8ipH13kDdTMHX4fwOvUDRP/OCmr0pmdS16p4ur1LRgoq1hZJQnjK5d+TU/EudYfUX1sNqRdjHk64R913Se9UmwsHvFUymazzjVF6Za+HcAfT6DyEFED/ajX4yA8yGdG17qYn4TEqSmFxaiQTI7QCtf0tJsdC7JaF0abDWMFaLYJNUxtpR0WeZdx4ooGzRskLr6u5HiBalrXCqU11JrKqp38gUD1s4vIdZyXhcD9dh4h83SLddD0RO5j17tq6QNLVgr1XXJeuufuud/gRwaZTpK3w5ecC5h90m1F2DoMQdgwknva3CmTD17R46FM2jHYEsJcVpJKtgCexPpWZ85Vaipk88lrNu5RavutJQx
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(19092799006)(1800799024)(366016)(56012099003)(18002099003)(22082099003)(38350700014)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kE1P1UQk5qrPOUccpWIhTyIQL1P9mObmFhZMvjf4ww+srfr0AKzcaKCfPmN5?=
 =?us-ascii?Q?P44Kk/981fjT7ibtld5OzkWIf3FhXJEG4d0+kAAzn+QC/tgsppto/jBP86Bc?=
 =?us-ascii?Q?reZdxqWu4c9irJsjZI8oN/dyNYG9+XUAI6VxXZ53mRHHwCP369RLVUaw7mbv?=
 =?us-ascii?Q?Zl7m15G+jALHuMJqMFomWs0rWUgv4zgyK3m6bXJ5I2sxxFQLYf++6HWlxgfP?=
 =?us-ascii?Q?ay10zNbMCEcDNNQtE3p7aOsocjFg1wbEY5VVeY/5gcB9VkcO8k5CtcnAAN4I?=
 =?us-ascii?Q?b9irnc+e8NlUBSsW+SDpTLQ4WD2W0QQh/wdzab69NGWoUKnxS/VANq2axCjT?=
 =?us-ascii?Q?D2U8t4mcQ8jID7Ndli06plqqG0KFJMkDZij0TJeSUmBzYu6w7Vv01Hxmac5x?=
 =?us-ascii?Q?vbFBz56tdUnAmZQ22QBhX2RL4RXAQWtbGwr4+JasB5roifuVVTqKx9t3NVyP?=
 =?us-ascii?Q?rgcQCSaazE1kN3EQo/ec1kQ0mPDhPAnyzZ/GV/jPirGSuS0wxvecbmA/DkCG?=
 =?us-ascii?Q?TozwYeZv9cdbzndel/macIyfZhCxuAxpEZPetGP1g2rQV7OSMLMS1eW/yLkq?=
 =?us-ascii?Q?jtBHgSMFjYTEUb+GYhy7RadzFCFmogk7MAfOXL4RrD4B5snJdEEvMa2Cexu6?=
 =?us-ascii?Q?ryY7WHeqoz3oTiFqZcj258smTU2pL80n5iEkJ/TujfNE5RuKHN5sNnMCptGc?=
 =?us-ascii?Q?NW4yWzNs7YfPhJTP5qXGWd27NLQmOBZeCsjr1Ty2xTRH9v7kA1S+pTa/afhu?=
 =?us-ascii?Q?oj4OYVkUueIsQfPn4CAX2EQGqiwAZ+5oAdOIdf+0rWswqfNSFtElecX2aEt4?=
 =?us-ascii?Q?CnV6qpobkQcsNURr5Ro2+wEcwmqxBlkh70cT+z7tDHl7+px24QHkQw//O/V/?=
 =?us-ascii?Q?nlBTAQ34VjAowv7CVSmHpLxEeMmxcRm2t6pFF8e4HPnJgKZadxLAgTstgGjY?=
 =?us-ascii?Q?PDWVydORHdXd3vNkVowUPgQZ+1ii33QImGbKgTQ36xpstVCzEqDTZh3s4vIO?=
 =?us-ascii?Q?H1xytyRQ14hmysfSE+cHNVUO7dBlGQwJeyRhbBGH7lxhN8/dL8SaQv5f5xn/?=
 =?us-ascii?Q?ZF1/pH7YaMgmqHRF9nN8k91ekfVzzv1P15DAblAybjRzVFKoAsoAmyKrsDvI?=
 =?us-ascii?Q?AvxYryQLztOtxKLpJQpaO1A3nEUgRhQC4x59RLrKp7H0XDLIJnosQKDDbU1a?=
 =?us-ascii?Q?wN84j38w5w3BZo0kiIFmbBmphE5AKcL0wFFQfIZlspRJaI86dKT/x2F/lGRW?=
 =?us-ascii?Q?LPJM040NLPONZdT1ay//xlu/TYdGJd9vu/PIyHnLHTdDz7FG5tOskoAF01iE?=
 =?us-ascii?Q?aW6Gg/vPvzGqMPNjypljEfXSFUyPIuBquystGNNj4E/S9PTRFYjGOtVUBbYy?=
 =?us-ascii?Q?9PdE5OOHeOPVMb/psXkcl1dlu6TpQsX7jB7lwvZPdoUjLGs2kN2jiWkxnD+m?=
 =?us-ascii?Q?vVZvcydgav4NdysbOVc/zYd0CRB5hhD64X5l6Lanl6mQL5Aj0obOkcki0fla?=
 =?us-ascii?Q?jWAv1ZEJl+JuXHSlTDsyctnUsVFrKYRUyCiJehbm0Bw8ROFemYNwmdbRtVp2?=
 =?us-ascii?Q?S6qLPA+CCdzviZ4XC840H8YFBvVY0Z5fDtQnAIEIDu73JefQZ8HYnqWkIq7M?=
 =?us-ascii?Q?uRnFLk+cJiGnbCxJQVoiNcQY78kFCCUbkYzNw3DGSUEjE6qal59FYb3MT69B?=
 =?us-ascii?Q?1Wkkzc5DkMOOugosQpfqdWjNiC6tCv/OXNqoMGebyqgMZ9I0/ssK5L4rzHuo?=
 =?us-ascii?Q?RHayFlklqw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38f96d62-d4de-48c7-40f5-08deb04614d7
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 16:46:57.9546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E+0XCa0/xACvisMYyse7b31Mdvu/EcLNmjOn6TipzS8bTJu/ZigNGH8FaLn0fVtZ4gUW8vlM3DVyvzbmzBa6mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_174701_138197_B7518EB6 
X-CRM114-Status: GOOD (  23.28  )
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

On Mon, May 04, 2026 at 02:33:43PM +0300, Adrian Hunter wrote:
> In DMA mode, transfer lists are currently completed only when the final
> transfer in the list completes. If an earlier transfer fails, the list is
> left incomplete and callers wait until timeout.
>
> There is no need to wait for a timeout, as the completion path in
> i3c_hci_process_xfer() already checks for error status. Complete the
> transfer list as soon as any transfer in the list reports an error.
>
> This avoids unnecessary delays and spurious timeouts on error.
>
> Complete a transfer list completion immediately there is an error.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V3:
>
> 	None
>
> Changes in V2:
>
> 	Renamed completing_xfer to final_xfer
>
>
>  drivers/i3c/master/mipi-i3c-hci/dma.c | 6 ++++--
>  drivers/i3c/master/mipi-i3c-hci/hci.h | 1 +
>  2 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index 28e4d38f55d3..899fdf6555a8 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -502,6 +502,8 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
>  		struct hci_xfer *xfer = xfer_list + i;
>  		u32 *ring_data = rh->xfer + rh->xfer_struct_sz * enqueue_ptr;
>
> +		xfer->final_xfer = xfer_list + n - 1;
> +
>  		/* store cmd descriptor */
>  		*ring_data++ = xfer->cmd_desc[0];
>  		*ring_data++ = xfer->cmd_desc[1];
> @@ -576,8 +578,8 @@ static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
>  					tid, xfer->cmd_tid);
>  				/* TODO: do something about it? */
>  			}
> -			if (xfer->completion)
> -				complete(xfer->completion);
> +			if (xfer == xfer->final_xfer || RESP_STATUS(resp))
> +				complete(xfer->final_xfer->completion);
>  			if (RESP_STATUS(resp))
>  				hci->enqueue_blocked = true;
>  		}
> diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
> index d630400ec945..f07fc627d4d2 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/hci.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
> @@ -104,6 +104,7 @@ struct hci_xfer {
>  		struct {
>  			/* DMA specific */
>  			struct i3c_dma *dma;
> +			struct hci_xfer *final_xfer;
>  			int ring_number;
>  			int ring_entry;
>  		};
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
