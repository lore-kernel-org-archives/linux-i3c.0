Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 937F4F5A8DA
	for <linux-i3c@archiver.kernel.org>; Tue, 21 Apr 2026 03:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nZklhJSsg0QUYWxft3p34FQVJnpZOm2igeihEDmoYg4=; b=pjJFqUS4i6F+yF
	AFZBdYBu+UUk8lSzvidAXl/BeO+ox6jBxXt3RWUD18HPAeaZM+b6uirUDUDn1Es4LdzPyEShbmxtP
	7q+t2Us+5R546ggKJdIM0tA/OxYieVD98R+dfrgIVB+1YlzuWXD+0LmVyiqLRgWC7Spmq1pouZosq
	zbRUX/Wpe6oUlhjGuivP8ZyT4Yn6Cmsl3kacv/gqyq1XUqjkGTaEebgutfvTTOE7AepM6yBUGxPZ+
	vv1s+WMKurOl7TwEdPI8pJEPUYyEm7plNo0wFFCdtm7pfT82xYefAJzmBSGAxvPtWB5gMrxIEKczX
	rImdonDsLUYujuXt3SaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF1P8-00000007yQk-3kHa;
	Tue, 21 Apr 2026 03:04:02 +0000
Received: from mail-northeuropeazon11012011.outbound.protection.outlook.com ([52.101.66.11] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF1P6-00000007yPr-0PT0
	for linux-i3c@lists.infradead.org;
	Tue, 21 Apr 2026 03:04:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r6N8AeiG5fVH4yU/7Z7+AbNgV3cJFzjOre207ufmmM49gCAw0kOMcWgRGXpYVobwR4JXtS+6f/gaDseFUC6VohuFGy8yK5ywMFBaW99kH2nVp+wMPh4sVm21oT/qd3Ryl4JGLcR4laMDADu5z6vz9OhQ3rO15kwA0/2Qdvx0T0BXJG45JFTf41pTV6YZiCRWiexJLQhyaviJ/9EyH//P/XLq8h33mzR8OH+XOQeyj2W6LRDWkayqLynLs/+MeTFR8bdRk1a2TumE/IDe46ngkRsKlL3mgiB2482LNAENKhUwsroOaz5pSmrDS6MDtQZF0sEDMYvWuNwbO5I7q6S9Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aT7yMTuht72WSw8opy9EvUwvUfCDtzumsidhSqwybEk=;
 b=aHOhqqmMe13Ee96molSs3eA2FDBOfaLgtELmnRkFPwR3uN51MjY3TSplOOrE/fb9a+hw/gJmBbN64KVnyoyrXT78nWEKXvcJq2siWC3Kh/RPIc0S7C5nh+8RxKZylinYo9mIIhE0WMhXY/JzemEhytqLG8L9Ust7FPFurT8YbSgqYbHcc4Wp5uGC99dV4+y2V1OEx7fG20bNP3KGoiEK0Z5bkkUuuOWFUEHA6Hx3sRDGiKxE2fS4TeEJIJQ2Ue6yLAU+1XRUOnF3LOrdTvp2Ipi7e6eQgodHw7oMZtdWaLMDykGy5xb68aBaLNinYl9ueRTPq9zUqEM7HKk2q8gavA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aT7yMTuht72WSw8opy9EvUwvUfCDtzumsidhSqwybEk=;
 b=CcctxXoHj8x1QPq8LiC+JSzMkNam4inorfFjFrg4r29Sc0sUOAjDFVowNZEuzEWZZ23XCv6sEZyK3iP+k9LdZW7mVLLkgfgDEPzRlvsMS7kR4q9CcADNxUsKX17Vj7WB8o8DMKZe0vAHiBVuSH2t/DxHGsFms33EUbYRPNPaDbqz2gU3nh6OBOhRP3HouWS/gspXsaC26IcHq9XJOJHhEIPl60oFInd/o0SlLdFVeXqWMnNNbiXvJFbaLQ1UY57CvbZNdILwmorrDBKpJolJBAGNhz9W++BVEAjvH0cuUzM+Ir7xXAXjMT1maSRBvmd306uBxBzm/nMma+uEQKxvYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV2PR04MB11589.eurprd04.prod.outlook.com (2603:10a6:150:2b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Tue, 21 Apr
 2026 03:03:54 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 03:03:54 +0000
Date: Mon, 20 Apr 2026 23:03:44 -0400
From: Frank Li <Frank.li@nxp.com>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	lee@kernel.org, lgirdwood@gmail.com, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, aman.kumarpandey@nxp.com
Subject: Re: [PATCH v9 1/7] i3c: master: Expose the APIs to support I3C hub
Message-ID: <aebpEO42bb4Ud2VK@lizhi-Precision-Tower-5810>
References: <20260420105222.1562243-1-lakshay.piplani@nxp.com>
 <20260420105222.1562243-2-lakshay.piplani@nxp.com>
Content-Disposition: inline
In-Reply-To: <20260420105222.1562243-2-lakshay.piplani@nxp.com>
X-ClientProxiedBy: SJ0PR13CA0230.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::25) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV2PR04MB11589:EE_
X-MS-Office365-Filtering-Correlation-Id: 89ee554c-e451-48cd-0b74-08de9f529f0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|1800799024|376014|7416014|366016|19092799006|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: kyIHqj5eepWH8JVMTfw4A+y3NfzWpqBGznuZTlD8vjer2XMiEGx9wJ8CJqMY4EMUw4FY6S1QWuzCQDCSw9ntaojZ0Y/M98BofSwYNOktUGj+i7am866Fc7nmbFb0XGAw/2yPNZUFuEmwbdSBBugHrcQwMeEsP0fiQquUKOupo/HBqQyWvJrRg/Vam6I7NlG7EMn/GmJ1+xWJW8ml0rSMfBcWkKz3vDIacS2uH7B4ySa1n6RkVnL9mpKTSMqnA3Tij4qIXQNByjqa9IKpW9b8zS08Km7DytyruCsfM1GNOjw4jAqZvHTHl7pAbN0jhZTRJZEjr9Me6PAl7ThqcoM034XssP+CN99xsvsM+K6R9M2I7Ye2hiZBSpEFC94g3c1Qg0MB4YZAuj/Ezlc3haaq1Vm36X4ooNznMoxsxMr++2uppPE0ju9GMUg3jKQtKuBPIw22koOVq77wsKmLhNINIPlYQssJGjxm7LomPmDXt7Ed7oPIn0XJqMc6lqabzC5mIgUlKs+u3gXxJVOK4VJLjPYr36p2z4TjcBRPB9008z5Lf2SPBNlUvUVbvugImBdhgwAijo9FHjR++RoNwG4EmTMH92gIyrJgj/zH/NIkZp73KEh+M6aPPxlGQj5lq5lKelT9WEe3LFlFn3cNmJNFbhG8SAdQscec9FpRzepNdhtNkPeE+gy089U/z3JM80B/RJFUl9uBxw13eeMoLGg1t9tAut2qHemGRWwehODJd5/q17CRfZLl7XCJ3tBlS9HWMKvHN+LP4fUfTp/MGGg+bPQL68C+RGVUaY9xUAW/bWI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(7416014)(366016)(19092799006)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ufAx3AEET6DhHhphZ7ZCkzzk/NHEyfARUG359xWuZyQjEnrIXty5i+ie5Cfd?=
 =?us-ascii?Q?rlcLrBW9WI5E8ynfefXz8KljGa3p94sjL8dk1TZuPbLnE83hBAt9xSMKYYsA?=
 =?us-ascii?Q?Gv2ntepKu/EmvPsLjYQJhGvnxQjt3rcrkIXwr2RbAUhcMluNo8IGOk8Vrjpv?=
 =?us-ascii?Q?IQloi3b2ON1PVV7vg/RoFS28H4erySnSMv9T+pI4VVGHz9e5e4trhSkK9eds?=
 =?us-ascii?Q?xqL8ReBDg3aA49r//x02m4wFICjEbGXivooxvkQGwaD4McIqQ4I2dG1CJG0X?=
 =?us-ascii?Q?uNWARRyD234jmdhkaTZDIhbK99ob+9msrHIhxg1oe6Gu1E5M/mUeizOakdDe?=
 =?us-ascii?Q?RVqzFYzAUiU4KmJsgd7Oqq6VYf9kCj4c0nllHbNkpHKOC6BfuI1w/DId1tKt?=
 =?us-ascii?Q?CTZeXzh0UiiQvJ4iOFw/lxzFPh8GFWRkZSfK1RhnmuTpXQhMIGdwSWyJs5Qd?=
 =?us-ascii?Q?l++/ziUi5BcRtAu1vYSVmHu1znnhy6jJVjFZnzzSbIoZs4PVuhfbkuQSCsKZ?=
 =?us-ascii?Q?fivZSwthHVxgx4GZNdo0XQc7Kj0nJUahUUUHY4kNNK+jyfaum8FK8HRxz2ve?=
 =?us-ascii?Q?F0yC6DFQHgF8CUHSSodDmixSCS5uYbof1z2iEd1yxw/IdKw2NegFwst3n7ul?=
 =?us-ascii?Q?dDdoeV/XoIv+FK/jJK77x4ul7sziSdIoHz1vp9fnztwlP9mWUfCz9WNUPwzm?=
 =?us-ascii?Q?UVNmERxIl5m+bwXY9VcUL8MCfSRojbQ3rx2uNQyigXi/FNzg//STRWT6gHJU?=
 =?us-ascii?Q?Rtx2KeO6ddFWjZFsd1DjZ7IOBr+DkEkrmspqjST49kGbwMUuXfBGvXPA0G0u?=
 =?us-ascii?Q?GS7doeBm/Izj0sJ7OP6m7l3FXAIKfaife+jEnIU4S9pSKGhrxpgncN5CPPQa?=
 =?us-ascii?Q?iIVSKDx2X2fRmGEAwFV5mblwPNsSTUVa2G3yaQh/ngK2qi85QzdnuV6/Pnyo?=
 =?us-ascii?Q?JUE0OhLLqjNJvN6sCwU3Zi1Ss948VhZyyItZV5YyTcZhT2gqpnMTBap52hwb?=
 =?us-ascii?Q?j9tHeq3Doli1G05btFL1LP2zNOVXCrMzX8SfDZpm3yVC2H8Yu4SVGJhmHDVX?=
 =?us-ascii?Q?g0ne8CjS8Bhw1HQ/LHVVjZxjwpd1MtZHr+nMuQSpglX0NVP635P627VfkW3G?=
 =?us-ascii?Q?4lICvm2A1OSajKscW6NB60P+fylcuZHA253aHOuLiO7Nwl0jYJqJau0tKhBk?=
 =?us-ascii?Q?YknNyF8vQsZwOQI7qj5Y6bKu/LMjBJG6qLIuo95iSvuBBmHLBG+JVo2+0j+e?=
 =?us-ascii?Q?cWksOXV48HFdAN8zK44QJwCZWDNfQmfhlA8UvMZjKXFTgA2s4ZgqguChJ+Vc?=
 =?us-ascii?Q?uycD1UcBUZoEFbxBSTMt0uOLGLySjLImIL0ncQCoK1o17rzFem/SWpF6Xhnn?=
 =?us-ascii?Q?fHS33qu919LbjHKk1SPCAeExf/tVgFlWk6eqk+JYNpSt1bfRJ4AKlWr875tM?=
 =?us-ascii?Q?skvpQol12HvOTO2g5REEMBmOlVOaCI9E+Ul5Q5hlJTHr21bxSnt8vtWxDjVC?=
 =?us-ascii?Q?p3X3rqbSH204mhe+ide7onr3mkqxexTJGTZW1ZEA8idOM1LhB0S8U6F4MMt+?=
 =?us-ascii?Q?208XANsvmxBzCmb8ylaALRnbem6+lVmqOKCVx52TOUkmF/9vTaNVaFm5F4ju?=
 =?us-ascii?Q?Xv8Q/RcjLVNq+1zX+8cHdlPNUXWaDiqNMbP6pxK/EGev2KQ5/hG9YnZEzmj5?=
 =?us-ascii?Q?xMYZiF3Tq2bljA5J8EBMIO+4yE2VUKqJ6CPrqdyqJ7B188ZZ0Pd3Ut4k0eiy?=
 =?us-ascii?Q?OVrrzUYa6g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89ee554c-e451-48cd-0b74-08de9f529f0d
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 03:03:54.2646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VRRkavxBfTVjPdkSs/WJXq9CvJtX4kyv4AprzqSO8QuKwWXb7PUAad3sh/JnN8CojtJ0JfFnJH4kRNKwc9C6rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11589
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_200400_183190_916FED62 
X-CRM114-Status: GOOD (  13.85  )
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

On Mon, Apr 20, 2026 at 04:22:16PM +0530, Lakshay Piplani wrote:
> From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
>
> The following APIs were already declared in i3c_internals.h but were
> missing EXPORT_SYMBOL_GPL() in their implementation, making them
> inaccessible to modular drivers such as the I3C hub driver:
>
> 1) i3c_dev_enable_ibi_locked()
> 2) i3c_dev_disable_ibi_locked()
> 3) i3c_dev_request_ibi_locked()
> 4) i3c_dev_free_ibi_locked()
>
> i3c_master_reattach_i3c_dev() is declared in include/linux/i3c/master.h
> and exported via EXPORT_SYMBOL_GPL() to make it accessible to the I3C
> hub driver.
>
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
>
> ---
...
> -static int i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
> -				       u8 old_dyn_addr)
> +/**
> + * i3c_master_reattach_i3c_dev() - reattach an I3C device with a new address
> + * @dev: I3C device descriptor to reattach
> + * @old_dyn_addr: previous dynamic address of the device
> + *
> + * This function reattaches an existing I3C device to the bus when its dynamic
> + * address has changed. It updates the bus address slot status accordingly:
> + * - Marks the new dynamic address as occupied by an I3C device.
> + * - Frees the old dynamic address slot if applicable.
> + *
> + * This function must be called with the bus lock held in write mode.

If this function required lock, please add new patch before this one to
rename to i3c_master_reattach_i3c_dev_lock() to keep consistent with
others.

Frank

>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
