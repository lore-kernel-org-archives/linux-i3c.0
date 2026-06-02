Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 883A6CD5BD1
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Jun 2026 16:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GesCGM8E9hoHyCzgycJzQso2A2KWm+JPJhupsCl+aC8=; b=rymYjD3AA9lXw8
	A/zVCjGPvMVT7VBQvx9zW0HU9B445pyo4gJhKr877Ab+EEuE8DbJ26pVEerPuidmlewJJdCjpkAJr
	VRwe3E0isVCJi/HJESZs1YbYI9lu345URggrOUw8kdd7QVFue3rVyLMvp+QKqH9s0QzZaBBBm1lE9
	oE0KZC17MrCTD5kOpKW4HvZUp+zz/qcq0sYJzjlm2kWsKi+k5gZMzOWxBBgfBWtyV+wKFzhSR0r7m
	dBccE7PbIqHra+xKRUA/2UFbmERb/oKwToLq0GFRIsPMstH9UkN2X9a8a1UEC7G6Z2UmBmlnciTX8
	k9RrXyZJEDn1Q3hZaA0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSJZ-0000000DUa9-15l2;
	Tue, 02 Jun 2026 16:50:05 +0000
Received: from mail-westeuropeazon11013030.outbound.protection.outlook.com ([52.101.72.30] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSJW-0000000DUZC-3jHh
	for linux-i3c@lists.infradead.org;
	Tue, 02 Jun 2026 16:50:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cG3Sgrqb9FBBORLQ0FzfPcNk+7fX/EQgxa1s0x3ufuU1CvB5/6kbFp9oDdgn59O+ZWsx7qrTnjnNT1Td1VEVGXrBQ7opcxRHZNTQPB8hxVKhR2WCTFRyQiy5rIQEpc4RWBnXRQmKkHJ1XlBFeC629Pwf9V/xiu20AlUuXoeoEg294PGEjoIQA3Akv2TU2zmJ4aP1TMRkbGv0tLyx65qVKvtidftAJAVDPF9QSxL0AwIZjCRtb+qj5LheDKhkOyg/LzWr0dfL/sujZZRNBbH5u9YJQ7DSuGchTcOW7OGLrDAEe4mvu8G1tbvw0AYD0dG8VEpJ1vMjGlbnPgFarG2Z4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WVbmWWGzwoYicFIp3czAzFUYJ0JkJ59wj9ya5M7CU1c=;
 b=cdXr/xFPOU74WLzdCgU2Z+CxIOQxYerdFQrf5ZrpeBn0bo9A0hPck9g25e7qqkH0PIaVGTcilUBZaKsrWb9PUJ0Glp+mOLpvPTAo2NU9luDaNGuF1/3Alm8ZJCCEoncGzXMn0dLdGoo9zRolwxFO3zSV3r9ikMfcM2CFi7IFzBKOYl84FTT8Am4z5+I2pCQezCZbkhW5d+pa0Ybw9VMP+KF6QPzToQCeSlMJunBUZZWxOA9ojJuFByWQuB2EmA9o5P5LmnlAzpmtlBkL06NeHuflbT3zfSf/u2zNhuExQFC5cUgJJI7jvY85g+8ss/APb2NMOvJcZ+1YOQbamZ3xeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WVbmWWGzwoYicFIp3czAzFUYJ0JkJ59wj9ya5M7CU1c=;
 b=MDjv2R/w6JxMsM5YjYQJjjS2KKixwWrOwgGoxlZ6q0bK/mllOIkuV+Bf087nzbiZuoQtu1cBdvo+pgC+zevfcRkZs2bx0HWDZRsVMNC+QxhUZbZKoE5ZKE4Co+N3d0iRCnoA2uTY5uMjM1HHsQlBSLL0OBMM1zt/zUXb8liFryoNlUYHZtFTzA/KaXLKwhGDXfDJ27vYVwrTyQwh2bTVvvXXACqpB51OQMn8pqIom9Pf2O4ynoDr6WreLqrhfRKmGOH8IOaLdf9nytXKUd0kMz70S7icK/Sg62neRmHz1YseIz4ds/z0NFZBnSnm/QyCMi0aBYOkuVGPadhpXUiYfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV4PR04MB11751.eurprd04.prod.outlook.com (2603:10a6:150:2d8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Tue, 2 Jun 2026
 16:49:58 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 16:49:58 +0000
Date: Tue, 2 Jun 2026 12:49:52 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 16/17] i3c: mipi-i3c-hci: Consolidate DMA ring
 allocation
Message-ID: <ah8JsHRiZxlQoB4b@lizhi-Precision-Tower-5810>
References: <20260515162621.57719-1-adrian.hunter@intel.com>
 <20260515162621.57719-17-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260515162621.57719-17-adrian.hunter@intel.com>
X-ClientProxiedBy: PH1PEPF00013312.namprd07.prod.outlook.com
 (2603:10b6:518:1::d) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV4PR04MB11751:EE_
X-MS-Office365-Filtering-Correlation-Id: cf015e64-e9de-47ee-95a8-08dec0c6fb33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|366016|1800799024|19092799006|11063799006|56012099006|18002099003|22082099003|4143699003|38350700014;
X-Microsoft-Antispam-Message-Info: lRzohcmz5egTyZqSPDIJcAaI1gmTyHeFEmMOt+ghOpBJhzXPXH9qF9jiYFRoVj0/uZbWH4LVZj7f2b1ek0gNWQ3VhyR8r4MhkH1Mw1Qr5QBNLoSWlamQ86dmnfilMVajzBEjYglJT1opDgQgDtvQwhurx7cqS0KDqHmsk+6MmyTe0JuTKHsRU0fpCMEBBXj76pUVfU32Xe72J6lbACVn4xGh5lSFWWldjSCvpXOTORJHDWreYg8PxOdDq5WOfKxnlBOqmJ21LfnMO7RGjdQNe70PpznZtC6WlkibzqfrDbM3BihRMoOyR694bAlDMHNXfmr4bBSKrd7B47IZbtMvfZ34942x4nYvMoNyI67B0Pq8nIhgNCJ9QUP8P35QSw8hmUwTDvTECk7hEfB9XChl2cTaw09j3S8kHQgqoJ+vFZ46+ITJC897gKQbLafLUn1W6nCLREyLG9oXXhVJreAj/1NxpwtaMFpwfv8kT5DDB741ggg/dj5L9J9uuD+O9xYmGvlT+6l8Tw3p8syDuNnrgMKOoryYowoeL7CimRmrP4BUEJ7bpUrBZG+HYidEOIZbgFnTCl9dbKL64nUc2LHpCjV2NYw4nPaPYfJSrEEv2htavSq/GyXBozfjFy/iYbDzh80APg5bEpB2x5yRI0ykgInGpjQl/EowH1S5r49Co5n9dI6H+dUZYPmw+wSv2b7b+3W1xKKobreQsxBTKEstbwx6c7pY3Ise+hkyDkGQJT2xpz3nfv4jiMLlblh68TPx
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(19092799006)(11063799006)(56012099006)(18002099003)(22082099003)(4143699003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UccRAMJOFdb/iv7GuYaOO9YjfusaqpReJobUy7UDIwEHC5vSPzxZPMyafddw?=
 =?us-ascii?Q?7nmDoFyzunty+IqtNgGWOBllFHeWow0M7rAubjpQrmW8rBO/5h8PdJWMmy/G?=
 =?us-ascii?Q?FV5arTu1TGFFIAIXJKA/2IBXTHLfHd7QVkr7U4/dUb0HlhhEUXSrNJG0SCtC?=
 =?us-ascii?Q?M4Zp5bRM8luNoioWSMDYwvxuzPuh7lr5U3jxzTN6wSgspKP6cJmIB3w7/okb?=
 =?us-ascii?Q?vqZXXORcidYFjhjdPKjMF15/rdP8JILdmQWpVyQ+USFz8IW5qohzieWADfS5?=
 =?us-ascii?Q?sqHE15RAFw3qB2eiwFutfj+lXKspE7RV3acws0+FAIRS+VVju4+oQzZfK4no?=
 =?us-ascii?Q?t8Jlc5Y/VbMgz82MRXo2iSyO7LKoOXNXKBIA6ZgpOaFop0KQ50t4O+nCdo68?=
 =?us-ascii?Q?v3rj+m9cL3372EKCKyA3qK1dqu7i4JwdO5JzerZjd19Q7sFv18ov1twBapr7?=
 =?us-ascii?Q?V4ymU+ovpAx9gskTzFoHmlaCeVs4HXtvA2W5AQBn7qealnzc2lT5wjmBcHS1?=
 =?us-ascii?Q?626YnWJ48kz6QA03NTz8BZNqtGz9Pu6KJ0dePhYhNW8h+0aXy1zUuBBhoL6y?=
 =?us-ascii?Q?5uCPvO9Qso9oGwt86Yv6FFLuuTNjjmrzycv4h49YEm+elKwQ4d6faGn9QGF3?=
 =?us-ascii?Q?rh9S5hjf0stUZqaLMJezMoD9FrLYch6dg7EtPYzFiRljDXvJIQGPme2utx7e?=
 =?us-ascii?Q?uJQ0DK1e2b7pymR7pNQnnZX8EDWv3c8MTJH6JAYlB2Z4rBM2twt0d52Nd1aq?=
 =?us-ascii?Q?c+8O3aaMUXO5PtIkhth9yrv3jOSgHQDFO1TleaVgPsb8cvEzMrOz0mH4HEqo?=
 =?us-ascii?Q?bi5JQiuxvPCsEGSeB3oSbR6BtfMRXMQmWr0LBTei2qWgDN4YOPy1fbFiwOcN?=
 =?us-ascii?Q?xcHjFV/T5akMOq9Su8u6r+AWWiUa0zGBoQ371USE156mwy67HXQfXJEsdq1/?=
 =?us-ascii?Q?P0R4t34rI/RT++mSzQGghyDfHtsy5k1vl0Pm0Oi6Jbiz8EwNtq5cdkr5Jo1s?=
 =?us-ascii?Q?odm0rc2euJ+m6oWMjfAEQBUhSMQN0S3ktH1T+hMAoyKCW0JevQn0UvzkFTPG?=
 =?us-ascii?Q?7Nqg7H1tUikH2GUKzfGa/KFmAwvW0Qs23VrxCL+4ZhJICwbaSAc491234PPY?=
 =?us-ascii?Q?yGnZrpJwVRxMDHSr3Av2rnociQA92dPb1BihHC+TYdyepU1z8UrC9WTqVhnF?=
 =?us-ascii?Q?P0ruB8+JtsHlmL1USavFspc2vSctOsOA84mqkP4ktTmKErvYnZeWsifbmE4T?=
 =?us-ascii?Q?9A/RomYgTogq9HGvl7uH54F4llff+MigvwSKWpyWaUlFH27Evtd97GNtq/sV?=
 =?us-ascii?Q?aA8E3M/FNgMh5JNqXuhDq5RH/lIiqx4I7OiG+HlpJEI+/1vmbnmsPV83xj5q?=
 =?us-ascii?Q?fqOnUYtjIptG//AG7V1J+X46lX9RZNtfQujoLvX9SXu3MIqIz0CsIYnl98Zg?=
 =?us-ascii?Q?QSKvfxARscFr9znuaF6nOYXz6OccDo4JlVj9V/5BSsO3R2zZ4mQXHfBUd1Ed?=
 =?us-ascii?Q?DK5v3CLlZ8kU8ey1L9Lm8xud4rQU3zf0iqDA8ka3iXdop3Qo1mdL1qDAXag+?=
 =?us-ascii?Q?JqXU4hTqz4Sxc4Ck4+0MIFsW6mu4Mljm/nzyLzuAZ7ig+JjjyaYKP8i3Kp0U?=
 =?us-ascii?Q?dT2W/F51mWwBrn1OiKrKnaxVfHr6jf1+M5V5W5auO0JUSc3oQOTaIrJ7Z8OB?=
 =?us-ascii?Q?nX4a+iCea8BLQztYckzUWLcl/eYFPArEzsdCB3ROoh9ERiRWf7PHuizfQLMV?=
 =?us-ascii?Q?XnIg6jxsWg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf015e64-e9de-47ee-95a8-08dec0c6fb33
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 16:49:58.4937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SAJh480HITKOkzwHoKDhKYfvgFKoZvFBDFd2bymPngLDQR+caZ1Z2y2s7XP9CnAIkg58WoXWjP5Bc/7nzcmW+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11751
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_095002_933917_A425622A 
X-CRM114-Status: GOOD (  19.66  )
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

On Fri, May 15, 2026 at 07:26:20PM +0300, Adrian Hunter wrote:
> dma_alloc_coherent() allocates memory in whole pages, which can waste
> space when command and response queues are allocated separately.
>
> Allocate the DMA command and response queues from a single coherent
> allocation instead, while preserving the required 4-byte alignment.
>
> This reduces memory overhead without changing behavior.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V4:
>
> 	Cache allocation size in rh->xfer_alloc_sz to avoid recomputing in
> 	hci_dma_free()
>
> Changes in V3:
>
> 	None
>
> Changes in V2:
>
> 	Check for failed allocation before assignments to avoid doing
> 	arithmetic with NULL pointers
>
>
>  drivers/i3c/master/mipi-i3c-hci/dma.c | 21 ++++++++-------------
>  1 file changed, 8 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index 9a01c740760f..0136f3064ada 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -130,7 +130,7 @@ struct hci_rh_data {
>  	dma_addr_t xfer_dma, resp_dma, ibi_status_dma, ibi_data_dma;
>  	unsigned int xfer_entries, ibi_status_entries, ibi_chunks_total;
>  	unsigned int xfer_struct_sz, resp_struct_sz, ibi_status_sz, ibi_chunk_sz;
> -	unsigned int done_ptr, ibi_chunk_ptr, xfer_space;
> +	unsigned int xfer_alloc_sz, done_ptr, ibi_chunk_ptr, xfer_space;
>  	struct hci_xfer **src_xfers;
>  	struct completion op_done;
>  };
> @@ -187,13 +187,7 @@ static void hci_dma_free(void *data)
>  		rh = &rings->headers[i];
>
>  		if (rh->xfer)
> -			dma_free_coherent(rings->sysdev,
> -					  rh->xfer_struct_sz * rh->xfer_entries,
> -					  rh->xfer, rh->xfer_dma);
> -		if (rh->resp)
> -			dma_free_coherent(rings->sysdev,
> -					  rh->resp_struct_sz * rh->xfer_entries,
> -					  rh->resp, rh->resp_dma);
> +			dma_free_coherent(rings->sysdev, rh->xfer_alloc_sz, rh->xfer, rh->xfer_dma);
>  		kfree(rh->src_xfers);
>  		if (rh->ibi_status)
>  			dma_free_coherent(rings->sysdev,
> @@ -359,18 +353,19 @@ static int hci_dma_init(struct i3c_hci *hci)
>  		dev_dbg(&hci->master.dev,
>  			"xfer_struct_sz = %d, resp_struct_sz = %d",
>  			rh->xfer_struct_sz, rh->resp_struct_sz);
> -		xfers_sz = rh->xfer_struct_sz * rh->xfer_entries;
> +		xfers_sz = round_up(rh->xfer_struct_sz * rh->xfer_entries, 4);
>  		resps_sz = rh->resp_struct_sz * rh->xfer_entries;
> +		rh->xfer_alloc_sz = xfers_sz + resps_sz;
>
> -		rh->xfer = dma_alloc_coherent(rings->sysdev, xfers_sz,
> +		rh->xfer = dma_alloc_coherent(rings->sysdev, rh->xfer_alloc_sz,
>  					      &rh->xfer_dma, GFP_KERNEL);
> -		rh->resp = dma_alloc_coherent(rings->sysdev, resps_sz,
> -					      &rh->resp_dma, GFP_KERNEL);
>  		rh->src_xfers =
>  			kzalloc_objs(*rh->src_xfers, rh->xfer_entries);
>  		ret = -ENOMEM;
> -		if (!rh->xfer || !rh->resp || !rh->src_xfers)
> +		if (!rh->xfer || !rh->src_xfers)
>  			goto err_out;
> +		rh->resp = rh->xfer + xfers_sz;
> +		rh->resp_dma = rh->xfer_dma + xfers_sz;
>
>  		/* IBIs */
>
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
