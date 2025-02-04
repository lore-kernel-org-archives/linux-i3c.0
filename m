Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31407C0219B
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Feb 2025 15:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bAxb+O6Qom2q7et64plqwiDdm0F1iYr+l6hV2rQuk80=; b=S1QAOBz1FiXwGW
	7t6FbY3w4V2i6a4opNmheNhQ8E3m8Dsjl1V7lPztlgdCWMLmAu7AAs6SOuNrwA641FckUpcZdBf6M
	+PD2LQA3BQqYOKv+CRv5RdCSdcuPAZFUWJodAgfdUL45qyRmpJ+b4fPTThtE2mgSxEp1rYB50hO7A
	IqNiVan7TySby9TpjO0wBmoWfV+iTcRLM6T/8495TWEELx9gvZG4uxRGFjm0+mBK8oTxPkq1OSWan
	EIlJZ0+MS/z8l7wfHndgC8doWu6ad5pmmsXtlX7g617RJD6rdg0PufL3RXDFkO/sasfZoSIMFD/K2
	8QwznsxY8RKhczyeO4oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfLCF-00000000sXA-3WyP;
	Tue, 04 Feb 2025 15:50:43 +0000
Received: from mail-am6eur05on20623.outbound.protection.outlook.com ([2a01:111:f403:2612::623] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfL12-00000000qth-1xtx
	for linux-i3c@lists.infradead.org;
	Tue, 04 Feb 2025 15:39:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lNh1WfAEw7QlfrBqmsCAWc8SmRzef3X+1OeFDZnRcJ5STiaY6WZt+N+yi9LsljOoei+DOF+lDjQCxREiiAhJBgekJiL1FbSc7uKQ9ga90Dmx6w8PXmL0VOWmV7cNYcfJ+9i2p21UGxbAfs8L37qSC9na0JM38GUtFWYeA9mSmAnR/36m9WDOZC5uu4lzZ4zVm6HktIRtcYo7f+O93WygIiRHxUpoqRmkV/D0fajehHZ1Wva+UT5Y73TK9XkMvmcayd2HE6bzXQnpVHc1MFkirg8jVI9PDFaR/q96jsd9kOlcq7PbaxXisLXrkhvaTxwvHsJu8nxpHt0LzjBJrHh+5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=23gBdr8WA5TSFJwAXR6g2TEFQzsVB6y/pPiCMiC/4so=;
 b=eIezQHtQEpsRAmGOIYWp1XZycYibAqowXcj0LjOI3L6E5JeNU/PEqTEzxlg9IhUB/k20QxNQ795rlDRkVLb1aI3eFyJ7sY1t07YXRsnoXge49ZKQRS3jCXrrPyWvGs4PN5EVkJhPHqgwMJodZKf48ZZ4TOMzIt0TuBQS6IhspSkoIT08VOfgn8W8rRc66+qDHCkkkPnz3NDY8mVzHTe2Zgc3mhQpHX86lPAdI7/Ca8+h9VfnbjAYwV9Q0z2npH6FZSQfmgdfKG/Dy08Bphv2Jg4bLgDgFaIdHhWhcQwQOJoY5gEzMjd5Yq/Z+HZmQXBQVeJ2oLHRG1b0NXS2OsJjpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=23gBdr8WA5TSFJwAXR6g2TEFQzsVB6y/pPiCMiC/4so=;
 b=mWAYivb2NDU3tU00iwEA4GctHI72dMPvqfdodH/B8IRcU3CDFy/m5xGLJsUe1ti2+02HFkGr26fwmntatdggyT7ZD+Q7UbCncnWmCvekW9lSlIoLy8j2IiYiblqSkHW71LVmZEmDFUh/yRmarYw/ROhSXAdrXTfA/1q28XPCfsz2LRq+ESaL8ppCMXcYzj5Cs58TQwaupS6OYJIXV/LHUDzhMLw9gnUSL6ERSi0VoCeLWVZiV41arR2tKqfPuxdAOaxNic+PeVtDyZDyOhKXAa4TDGfse4KHT1/9luVH6/W2OK74d0EZ3ak5/yhD4ssx6NYmLauLI/H3KP4ixYQ7Vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA2PR04MB10239.eurprd04.prod.outlook.com (2603:10a6:102:409::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Tue, 4 Feb
 2025 15:39:04 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 15:39:04 +0000
Date: Tue, 4 Feb 2025 10:38:57 -0500
From: Frank Li <Frank.li@nxp.com>
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Culhane <conor.culhane@silvaco.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH 1/2] i3c: Add basic HDR support
Message-ID: <Z6I0kSaNIHvRh60Y@lizhi-Precision-Tower-5810>
References: <20250129-i3c_ddr-v1-0-028a7a5d4324@nxp.com>
 <20250129-i3c_ddr-v1-1-028a7a5d4324@nxp.com>
 <e09b50b8-dd65-4636-aa35-42efc86bba16@quicinc.com>
 <e28bda63-bd6f-41db-8c24-43f21cccb386@starfivetech.com>
 <Z6DmUIKn5usytjl3@lizhi-Precision-Tower-5810>
 <928b69ef-e5fa-46ea-9075-2b12d7fd9372@starfivetech.com>
Content-Disposition: inline
In-Reply-To: <928b69ef-e5fa-46ea-9075-2b12d7fd9372@starfivetech.com>
X-ClientProxiedBy: SJ0PR03CA0153.namprd03.prod.outlook.com
 (2603:10b6:a03:338::8) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA2PR04MB10239:EE_
X-MS-Office365-Filtering-Correlation-Id: 7733e030-aaa0-4b94-661c-08dd45320db7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?X8jK2DHLtR9vruqGGz9eY0hyAZABHHxp0w1zzMXjdCLfWMO/khpAvwz1CE?=
 =?iso-8859-1?Q?q7MgwsWNmfRC6UYDgjqU4JB8ANM4xcVZ5Eh0yFU+fe44WTfR5gyiEcO42H?=
 =?iso-8859-1?Q?0uEIhh2qjMScS9UH4eLmOYh0wbWwx8kT0pv8nKSU77pie1x16wspyMpAi1?=
 =?iso-8859-1?Q?9pdKsvMC46rCMIFtys3tznI6XZ+ZcUWAdFU8+NvkDvX7yuJajV5Goj82+7?=
 =?iso-8859-1?Q?VjMjXd2LRbIuGMyGb4ncQBhb4pidnFYRgAcnsyv1k/RAoLG28aa+4cKCiw?=
 =?iso-8859-1?Q?Pe73vjEwJWkSWrpfQe87SnCjq0HMm1llzeNAAjAXspenafZlgWew0FNkbU?=
 =?iso-8859-1?Q?suuOsU95rdYcISEZ78CG7/h6Ij/w7Ute/9Za+7sMHcRbxP5UDGwAttZQCB?=
 =?iso-8859-1?Q?YzUBMA8M5OpKJLSnjoQpeJytQyr2BChGAHoQTOfdXZvX4y0gs6EVJL3UN2?=
 =?iso-8859-1?Q?Fn1KZMuZe+nKrfVSEpjnfZIL6QUcAGwT8WikcpU808GQpBQCjB/pjdBMoU?=
 =?iso-8859-1?Q?LiOc6Kuf4tIkhq1RSKPMhMmsRDR/jm1kfiE6Lgqi97V+7Nd4ojGz8I+ISB?=
 =?iso-8859-1?Q?MqI8/FHAU0HJTp2Tu6L+MlxOI7HCDAYzy3yfke2iW+Eg9OkV+g0rucHNNF?=
 =?iso-8859-1?Q?dt+P7HiLqsPcG5ZzVz3GEDc5GaskSYcrxHYOTEPsi6XPapofzpe+QABuz4?=
 =?iso-8859-1?Q?ChPVu/8NwvhOpMW8C3ggCVKPRcwIwUQQyZ9eQpSuNc1LfvK/0WBvj0IhUl?=
 =?iso-8859-1?Q?pzS7VR8or6/K0whtKlfXBW++SzjeXvGxuZeUUC0TIeMk7UP/FKtDOXqs/7?=
 =?iso-8859-1?Q?ZWGD1bMeuEOKlnIzJXyDE7ypkUB9uokVpI8rLP36Yle0JNtfV+gpUX4SIh?=
 =?iso-8859-1?Q?6olB5AMDm1bJxjy5AbbgYyW+uFxArpHiVOR3CpeFaNJzctHaMMlNxXTjIp?=
 =?iso-8859-1?Q?w2QJOCLxpkzhzGCJ23+YiJRnRBaCwXq6zBeLjkTMXyCvBs2Ey92o+tXjg8?=
 =?iso-8859-1?Q?uVccb+z8DasXsFJz0yUeAQJ2bzG8OzdLiRZJTPvC7TgFDWKKspNMY8xqxU?=
 =?iso-8859-1?Q?krQbXLAb67l+QWsy9h0Fm806w+2INjbz1jV2qFH94QgEvZo/i7bq4MtTyT?=
 =?iso-8859-1?Q?GBu+QUe2yRyTPcv8l3AVANWjtHzZUyDa9dMV38o+gTj2jPlN/Va/rU4SPI?=
 =?iso-8859-1?Q?TdrpACfS2laz4iMT9fTBrNBunxkr66GfAUcrW3TDHa3i/wKsEk5uz3dR8J?=
 =?iso-8859-1?Q?foT+ZpY6NltsLuYNWIFRdkMcRRre3olwOwp/CE7oW42DSk32thxCc3m1Lm?=
 =?iso-8859-1?Q?zqp/ZsoCmqyTt4NRifbbErppZh0VGH1znTc2AU0EPiqYglM7JUx17M1hKi?=
 =?iso-8859-1?Q?rVB5w0KMVIE/Gn8gn+a/6l31OLILQ6T/HJzpzebd/sD07ZghIU5FxkMgvJ?=
 =?iso-8859-1?Q?Q4d+7TgA01kSENL1HibHBK6/TZuR1uBAmoU5DTqXp2o4L6fKBWY1/nU1Gx?=
 =?iso-8859-1?Q?8kzq89JdxJJKnHIGT82gFj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1tzrxHOYX6WJoTbJksLhOq9OW4h+72tO2/CtbIZhoJ0DPJoUVs6JJo4bWX?=
 =?iso-8859-1?Q?5PT83eycY+pok///J/lbOKZkN66XSV6BXDVEnzJOa0OvFCWCbrBQH0/lrK?=
 =?iso-8859-1?Q?QfWazs+CLaoKXqHv7vG9kVVpWOdf60VTYfZoJqtu7ss7HmeV18OP1vNJJE?=
 =?iso-8859-1?Q?4BDChLNRNIufcSE54aAG+st8uI1+bTiyHeyCk9GyD5OBopbvXBcwcCbb2i?=
 =?iso-8859-1?Q?t1HVjaEQNEMcVDXALn8K6BZHF84Xx0hLBjjmF4VnF0RFM3As9noQuTKkrm?=
 =?iso-8859-1?Q?vBoUXRF6k0BnGyjpZfxp9I1pmggCr4l9j8N5nvnUHZr+zdyd32aOUlJ92E?=
 =?iso-8859-1?Q?4SPs8W+Km5g0k8p1z1tESqjlMbmpmoVEyvaFbzgLxjYMtvRGt+6uC6T5BX?=
 =?iso-8859-1?Q?taTcm5C02TOtsIYRQNETUAAAJuJ0TRa/h4v21yjeAdimbYfR9HUewVQZSs?=
 =?iso-8859-1?Q?ZwlgLNvuh1Ho5Ihm4h19LNLtOVJXNttgm53wiIX8g3dz1Ge+kwQSdNUKc3?=
 =?iso-8859-1?Q?tZlPd1xtumG18sxu6ypsSGv+f2MAxwMa+zvQ8BLohL1YkJqe+Huqi9nrow?=
 =?iso-8859-1?Q?dTHcxD2c/mW4i6/O42GxBdUtmxSBcT0o8OKE7GJVRSwqPTJfloXAaYYzMB?=
 =?iso-8859-1?Q?Hmxw9gAFXkH3PSjckD4Ey4CcxenjXvPQVOoVHiTfpuM+n0dTTij/Yigbp9?=
 =?iso-8859-1?Q?QzJz41zDCGir7m+nhFB5ElJee9StPWpYHAIKaIDZeXmSGRNqxfudDF3TFI?=
 =?iso-8859-1?Q?KrU9WIOsCkCf0gSwkjaLl/uJs1vzIJ5Ex2foq+/ShT85RwDV9rI9MjeL1q?=
 =?iso-8859-1?Q?M9oPDdf2fbFc3R3gDLqS2AWOCnfxPKkXEZP2RIF9P2bVysq8Rrr/91c/pP?=
 =?iso-8859-1?Q?Vo4USc5JsxjsGDlkLIeGSWqgGa+IPSHBgWgt+gcrIz+UyfnHQyggmQp/Sq?=
 =?iso-8859-1?Q?87kT+zlCuNiV5Yvloe6cL+l5f1rJvFUyts7N3bbXwdu3V2YVOKdcdlSkBa?=
 =?iso-8859-1?Q?TUX5loDK8qFdJqtACYGS2PQoi6u37t3aAWx/PDnxCbM8uiL+t4/6DujeGq?=
 =?iso-8859-1?Q?G34kvNf47AGKA3p/SaKfkbXOjGFgmEC+PLkxs71+LGVE/iVzHk6aAPT80B?=
 =?iso-8859-1?Q?l6mcWlNJqNk54QBZ1BLUh+veb1uktFycql9zzunyY8QG4zJVOavMlf10Db?=
 =?iso-8859-1?Q?0zPgZwYvfvnZWujwnuuBOWK50XghVPbICiyNK7S+eu2z4F4e2iVXxU7Atm?=
 =?iso-8859-1?Q?hD7fq5RPT3HvvcizaaLkFprtcIgKhXQfeqtz2S1gwvjI7JqhBwce140dlh?=
 =?iso-8859-1?Q?nAJwUn5pgKx12cZeqkGlHCWpmoNSypIuCMcS2P+iEkpVk+ybLJBQxjauFE?=
 =?iso-8859-1?Q?agd5/s8JxeaEYpvAnoUvOW+yx/x9REDKWYVwF6LdgyDEo4eAcE2QJJ/vQR?=
 =?iso-8859-1?Q?rjvl0bfI/5nOE/FtDAJnD4AbI1idrsgGlOHxxycCMWIpwrZ2C4VsaDB6yw?=
 =?iso-8859-1?Q?dl1dFW40k4rzBbCYI34Z5r8R7twtiJR1E47f4Kfz1LbI6US/2ONzqTGaxO?=
 =?iso-8859-1?Q?GzlTWyByv2YWVDqD0AAXMGn1Z+Yq6j63IOJ/Q80hoqjI6mdwWxu9B9xsWH?=
 =?iso-8859-1?Q?SEu135ZnvInVk=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7733e030-aaa0-4b94-661c-08dd45320db7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 15:39:04.0045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VlYJMJQOHGjcrwxxCyqnQApZRXiYPQjKWP3IjMqiMGT47gDS+iu42Ehq0D9IobkdVqTTW612psy9hmuMv2LaxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10239
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_073908_664912_072AC449 
X-CRM114-Status: GOOD (  40.41  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Tue, Feb 04, 2025 at 03:17:36AM +0000, Joshua Yeong wrote:
> Hi Frank,
>
> On 03-Feb-2025 11:52 PM, Frank Li wrote:
> > On Mon, Feb 03, 2025 at 02:32:51AM +0000, Joshua Yeong wrote:
> >> Hi Mukesh and Frank,
> >>
> >> On 02-Feb-2025 1:54 AM, Mukesh Kumar Savaliya wrote:
> >>> Hi Frank,
> >>>
> >>> On 1/30/2025 1:35 AM, Frank Li wrote:
> >>>> I3C HDR requires enter/exit patterns during each I3C transfer. Add a=
 new
> >>>> API i3c_device_do_priv_xfers_mode(). The existing
> >>>> i3c_device_do_priv_xfers() now calls i3c_device_do_priv_xfers_mode(I=
3C_SDR)
> >>>> to maintain backward compatibility.
> >>>>
> >>>> Introduce a 'cmd' field in 'struct i3c_priv_xfer', using an anonymou=
s union
> >>>> with 'rnw' since HDR mode relies on read/write commands instead of t=
he
> >>>> 'rnw' bit in the address as in SDR mode.
> >>>>
> >>>> Add a priv_xfers_mode callback for I3C master drivers. If priv_xfers=
_mode
> >>>> is not implemented, fallback to SDR mode using the existing priv_xfe=
rs
> >>>> callback.
> >>>>
> >>>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> >>>> ---
> >>>> Why not add hdr mode in struct i3c_priv_xfer because mode can't be m=
ixed in
> >>>> one i3c transfer. for example, can't send a HDR follow one SDR betwe=
en
> >>>> START and STOP.
> >>>>
> >>> Is it wise to add two function inside main funcion and separate SDR v=
s HDR ? so we don't need to change current function arguments.
> >
> > I am not sure if understand your means. HDR have difference mode, anyway
> > need add new argument.
> >
> >>
> >> I think the 'private transfers' are limited to SDR communications,
> >> would it be better if we have a different interface/naming for hdr tra=
nsfers?
> >
> > The key is what's difference between hdr and private transfers. So far =
only
> > command vs rnw, any other differences I missed?
>
> I guess mainly the terminology. The specification differentiate HDR from =
private transfer.
> We can have the hdr interface to have length indicating for u16 rather th=
an u8 in private trasnfer.

It should be equivalence with check length is even.

The key is how client driver will easy to use HDR if they already have SDR
support.

suppose client:

struct i3c_priv_xfer xfer[2] =3D {{ .rnw =3D 0, buf=3Dp1, size =3D 4, addr=
=3D0xb },
				{ .rnw =3D 1, buf=3Dp2, size =3D 4, addr=3D0xb }}

priv_xfer(..., xfer, 2};

if support HDR

if (hdr) {
	xfer[0].cmd =3D 0x80;
	xfer[1].cmd =3D 0x;
	priv_xfer(..., xfer, 2, HDR);
} else {
	priv_xfer(..., xfer, 2, SDR);
}

client driver needn't distingiush if buff is u8* or u16*.

> I think the framework should check if device whether it supports HDR comm=
and before sending it.
> I have code here that do some handling on that.

Yes, I can add such check. The key point is API design.

Frank
>
> >
> >>
> >>>> i3c_priv_xfer should be treat as whole i3c transactions. If user wan=
t send
> >>>> HDR follow SDR, should be call i3c_device_do_priv_xfers_mode() twice,
> >>>> instead put into a big i3c_priv_xfer[n].
> >>>> ---
> >>>> =A0 drivers/i3c/device.c=A0=A0=A0=A0=A0=A0 | 19 +++++++++++++------
> >>>> =A0 drivers/i3c/internals.h=A0=A0=A0 |=A0 2 +-
> >>>> =A0 drivers/i3c/master.c=A0=A0=A0=A0=A0=A0 |=A0 8 +++++++-
> >>>> =A0 include/linux/i3c/device.h | 12 +++++++++++-
> >>>> =A0 include/linux/i3c/master.h |=A0 3 +++
> >>>> =A0 5 files changed, 35 insertions(+), 9 deletions(-)
> >>>>
> >>>> diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
> >>>> index e80e487569146..e3db3a6a9e4f6 100644
> >>>> --- a/drivers/i3c/device.c
> >>>> +++ b/drivers/i3c/device.c
> >>>> @@ -15,12 +15,13 @@
> >>>> =A0 #include "internals.h"
> >>>> =A0 =A0 /**
> >>>> - * i3c_device_do_priv_xfers() - do I3C SDR private transfers direct=
ed to a
> >>>> - *=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 specific device
> >>>> + * i3c_device_do_priv_xfers_mode() - do I3C SDR private transfers d=
irected to a
> >>>> + *=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 spec=
ific device
> >>>> =A0=A0 *
> >>>> =A0=A0 * @dev: device with which the transfers should be done
> >>>> =A0=A0 * @xfers: array of transfers
> >>>> =A0=A0 * @nxfers: number of transfers
> >>>> + * @mode: transfer mode
> >>>> =A0=A0 *
> >>>> =A0=A0 * Initiate one or several private SDR transfers with @dev.
> >>>> =A0=A0 *
> >>>> @@ -32,9 +33,9 @@
> >>>> =A0=A0 *=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 driver needs to resend the=
 'xfers' some time later.
> >>>> =A0=A0 *=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 See I3C spec ver 1.1.1 09-=
Jun-2021. Section: 5.1.2.2.3.
> >>>> =A0=A0 */
> >>>> -int i3c_device_do_priv_xfers(struct i3c_device *dev,
> >>>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct i3c_priv_xf=
er *xfers,
> >>>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int nxfers)
> >>>> +int i3c_device_do_priv_xfers_mode(struct i3c_device *dev,
> >>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct i3c_priv=
_xfer *xfers,
> >>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int nxfers, enu=
m i3c_hdr_mode mode)
> >>> why can't we pass mode as another structure member inside struct i3c_=
priv_xfer ? Adding function agrument parameter impacts existing drivers.
> >
> > If that, it will be possible, xfers[0] is sdr, xfers[1] is hdr. Actuall=
y,
> > I3C can't do that.  we assume finish whole xfers between one whole trac=
tion
> > (between START and STOP).
> >
> > Frank
>
> Yes, I think it is better if we split xfer transfer interface for SDR and=
 HDR.
> The interface should assume respective driver to decide how to handle ENT=
HDR CCC + Exit Pattern.
> Else we will need additional 2 interface for start and stop for HDR.
>
> Joshua
>
>
> >>>> =A0 {
> >>>> =A0=A0=A0=A0=A0 int ret, i;
> >>>> =A0 @@ -47,11 +48,17 @@ int i3c_device_do_priv_xfers(struct i3c_devi=
ce *dev,
> >>>> =A0=A0=A0=A0=A0 }
> >>>> =A0 =A0=A0=A0=A0=A0 i3c_bus_normaluse_lock(dev->bus);
> >>>> -=A0=A0=A0 ret =3D i3c_dev_do_priv_xfers_locked(dev->desc, xfers, nx=
fers);
> >>>> +=A0=A0=A0 ret =3D i3c_dev_do_priv_xfers_locked(dev->desc, xfers, nx=
fers, mode);
> >>>> =A0=A0=A0=A0=A0 i3c_bus_normaluse_unlock(dev->bus);
> >>>> =A0 =A0=A0=A0=A0=A0 return ret;
> >>>> =A0 }
> >>>> +EXPORT_SYMBOL_GPL(i3c_device_do_priv_xfers_mode);
> >>>> +
> >>>> +int i3c_device_do_priv_xfers(struct i3c_device *dev, struct i3c_pri=
v_xfer *xfers, int nxfers)
> >>>> +{
> >>>> +=A0=A0=A0 return i3c_device_do_priv_xfers_mode(dev, xfers, nxfers, =
I3C_SDR);
> >>>> +}
> >>>> =A0 EXPORT_SYMBOL_GPL(i3c_device_do_priv_xfers);
> >>>> =A0 =A0 /**
> >>>> diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
> >>>> index 433f6088b7cec..553edc9846ac0 100644
> >>>> --- a/drivers/i3c/internals.h
> >>>> +++ b/drivers/i3c/internals.h
> >>>> @@ -16,7 +16,7 @@ void i3c_bus_normaluse_unlock(struct i3c_bus *bus);
> >>>> =A0 int i3c_dev_setdasa_locked(struct i3c_dev_desc *dev);
> >>>> =A0 int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
> >>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct i3c_pr=
iv_xfer *xfers,
> >>>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int nxfers);
> >>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int nxfers, enum i=
3c_hdr_mode mode);
> >>>> =A0 int i3c_dev_disable_ibi_locked(struct i3c_dev_desc *dev);
> >>>> =A0 int i3c_dev_enable_ibi_locked(struct i3c_dev_desc *dev);
> >>>> =A0 int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
> >>>> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> >>>> index d5dc4180afbcf..67aaba0a38db2 100644
> >>>> --- a/drivers/i3c/master.c
> >>>> +++ b/drivers/i3c/master.c
> >>>> @@ -2945,7 +2945,7 @@ int i3c_dev_setdasa_locked(struct i3c_dev_desc=
 *dev)
> >>>> =A0 =A0 int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
> >>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct i3c_pr=
iv_xfer *xfers,
> >>>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int nxfers)
> >>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int nxfers, enum i=
3c_hdr_mode mode)
> >>>> =A0 {
> >>>> =A0=A0=A0=A0=A0 struct i3c_master_controller *master;
> >>>> =A0 @@ -2956,9 +2956,15 @@ int i3c_dev_do_priv_xfers_locked(struct i=
3c_dev_desc *dev,
> >>>> =A0=A0=A0=A0=A0 if (!master || !xfers)
> >>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;
> >>>> =A0 +=A0=A0=A0 if (master->ops->priv_xfers_mode)
> >>>> +=A0=A0=A0=A0=A0=A0=A0 return master->ops->priv_xfers_mode(dev, xfer=
s, nxfers, mode);
> >>>> +
> >>>> =A0=A0=A0=A0=A0 if (!master->ops->priv_xfers)
> >>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 return -ENOTSUPP;
> >>>> =A0 +=A0=A0=A0 if (mode !=3D I3C_SDR)
> >>>> +=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;
> >>>> +
> >>>> =A0=A0=A0=A0=A0 return master->ops->priv_xfers(dev, xfers, nxfers);
> >>>> =A0 }
> >>>> =A0 diff --git a/include/linux/i3c/device.h b/include/linux/i3c/devi=
ce.h
> >>>> index b674f64d0822e..7ce70d0967e27 100644
> >>>> --- a/include/linux/i3c/device.h
> >>>> +++ b/include/linux/i3c/device.h
> >>>> @@ -40,11 +40,13 @@ enum i3c_error_code {
> >>>> =A0 =A0 /**
> >>>> =A0=A0 * enum i3c_hdr_mode - HDR mode ids
> >>>> + * @I3C_SDR: SDR mode (NOT HDR mode)
> >>>> =A0=A0 * @I3C_HDR_DDR: DDR mode
> >>>> =A0=A0 * @I3C_HDR_TSP: TSP mode
> >>>> =A0=A0 * @I3C_HDR_TSL: TSL mode
> >>>> =A0=A0 */
> >>>> =A0 enum i3c_hdr_mode {
> >>>> +=A0=A0=A0 I3C_SDR,
> >>>> =A0=A0=A0=A0=A0 I3C_HDR_DDR,
> >>>> =A0=A0=A0=A0=A0 I3C_HDR_TSP,
> >>>> =A0=A0=A0=A0=A0 I3C_HDR_TSL,
> >>>> @@ -53,6 +55,7 @@ enum i3c_hdr_mode {
> >>>> =A0 /**
> >>>> =A0=A0 * struct i3c_priv_xfer - I3C SDR private transfer
> >>>> =A0=A0 * @rnw: encodes the transfer direction. true for a read, fals=
e for a write
> >>>> + * @cmd: Read/Write command in HDR mode, read: 0x80 - 0xff, write: =
0x00 - 0x7f
> >>>> =A0=A0 * @len: transfer length in bytes of the transfer
> >>>> =A0=A0 * @actual_len: actual length in bytes are transferred by the =
controller
> >>>> =A0=A0 * @data: input/output buffer
> >>>> @@ -61,7 +64,10 @@ enum i3c_hdr_mode {
> >>>> =A0=A0 * @err: I3C error code
> >>>> =A0=A0 */
> >>>> =A0 struct i3c_priv_xfer {
> >>>> -=A0=A0=A0 u8 rnw;
> >>>> +=A0=A0=A0 union {
> >>>> +=A0=A0=A0=A0=A0=A0=A0 u8 rnw;
> >>>> +=A0=A0=A0=A0=A0=A0=A0 u8 cmd;
> >>>> +=A0=A0=A0 };
> >>>> =A0=A0=A0=A0=A0 u16 len;
> >>>> =A0=A0=A0=A0=A0 u16 actual_len;
> >>>> =A0=A0=A0=A0=A0 union {
> >>>> @@ -301,6 +307,10 @@ int i3c_device_do_priv_xfers(struct i3c_device =
*dev,
> >>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct i3c_pr=
iv_xfer *xfers,
> >>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int nxfers);
> >>>> =A0 +int i3c_device_do_priv_xfers_mode(struct i3c_device *dev,
> >>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct i3c_priv=
_xfer *xfers,
> >>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int nxfers, enu=
m i3c_hdr_mode mode);
> >>>> +
> >>>> =A0 int i3c_device_do_setdasa(struct i3c_device *dev);
> >>>> =A0 =A0 void i3c_device_get_info(const struct i3c_device *dev, struc=
t i3c_device_info *info);
> >>>> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> >>>> index 12d532b012c5a..352bd41139569 100644
> >>>> --- a/include/linux/i3c/master.h
> >>>> +++ b/include/linux/i3c/master.h
> >>>> @@ -472,6 +472,9 @@ struct i3c_master_controller_ops {
> >>>> =A0=A0=A0=A0=A0 int (*priv_xfers)(struct i3c_dev_desc *dev,
> >>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct i3c_priv_xfer *=
xfers,
> >>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int nxfers);
> >>>> +=A0=A0=A0 int (*priv_xfers_mode)(struct i3c_dev_desc *dev,
> >>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct i3c_p=
riv_xfer *xfers,
> >>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int nxfers, =
enum i3c_hdr_mode mode);
> >>>> =A0=A0=A0=A0=A0 int (*attach_i2c_dev)(struct i2c_dev_desc *dev);
> >>>> =A0=A0=A0=A0=A0 void (*detach_i2c_dev)(struct i2c_dev_desc *dev);
> >>>> =A0=A0=A0=A0=A0 int (*i2c_xfers)(struct i2c_dev_desc *dev,
> >>>>
> >>>
> >>>
> >>
>

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
