Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80ABECD4F24
	for <linux-i3c@archiver.kernel.org>; Wed, 13 May 2026 10:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u+Xth8uSfJ/i+m8EwFeCYuZnj89TEdm62UF+waHT3gU=; b=bSOnqmj1F4Vbw0yxYYYT1AyIPD
	efDtjTzCkKS7jk81Ev6Uz144FGL5cojbwp5xresjob9i7HecwvpdrNKx86Q5jtTuEJ9ORIYczu9/+
	0FyEFr9tcJRPbQHy0VdHJFpcUUEj/OU/eQri5Ak3wKYs+9hNn8olbXwZewxT+aikOqzp3rGb80AZL
	d9RmCjMnVd6xMi5WNIYFC8boP73xxD1QFAmmsrgKod12unPUy/S5bQ7+lQbfiVfvtMe2oiqygAJ1Q
	7OvyEDVTVep51D1bOzPe3U5WESyhDJyLAuXfpWWBExEgRFtU+jhCwC84BevY4CYkcugFXDg6UNEx1
	bhug417g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6hQ-000000029E6-1BqH;
	Wed, 13 May 2026 10:20:20 +0000
Received: from mail-northeuropeazon11011000.outbound.protection.outlook.com ([52.101.65.0] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6hN-000000029D3-3qV0
	for linux-i3c@lists.infradead.org;
	Wed, 13 May 2026 10:20:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kTYNAcNvfd11+YIfbG8nzBtmKJCO7zOXtku6xIQe2+OpfiJlaMwlbWQdxzUY8/K/2zEHJ3k76sjl0wufOudB0loN4a3AcQYqUG6CMzlUV1P/9IBiL8zbHY2RQ+kwx2uQSuakybYcgTRpbuQN2bCRbpC7iKuTf+kXYR/mbVKIQl18rzhMvmCUjnXTrYwM8NTMik13s7D6YTVIEznHee/rdClNrmHiEsYN9lTkeNg1cIOVKY103GmmsNAZk8+Q9UbHkdPL12ODIB6bIMKzPD23oU8o5gHBYbA0qSZ34bqiawDThJnp1j69uXWcpjVGbPbxMjF3eGMsGU13RAW7MnyQHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LLg6doLDl3jl+Sx0Xakhjb7ZTBuymu7FME6p7U16zYk=;
 b=wWzVbTmTW438imOh9+9be/n1GDVi8N56FyXUwYClL0AytnjOpiKtmv46oz2cuAA67ONJits9mFSV04D+KYe8XgMupa9qzIYavfDRyEvHT6Ay4tu3wJE5K8yvR7JxcAiP5YfASkjscD+ty9jMqjc8FO0I51gHEmyolF6tdfK82CDllfl9MMO5t98Ox9o5WMQR03XfciA9nkHyEk/DeJfZWfKByux9njNPd68OS+BHriHG7oCRbGayclmVAJRLw4qrQU644lua3M5E4ctoOunp6ujYgIiX/Vff6eQh52Fahf4aiFHMnMze4/g1Lq2sLvaIuW6WbDyIlAlvNXkPph94OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LLg6doLDl3jl+Sx0Xakhjb7ZTBuymu7FME6p7U16zYk=;
 b=lxmTn2clRbSUf+Whf3Rxo/6ilNRUkSB00ktMhwSgVnNWbcjUjhneErti9MbyEulufDXavl0lmGKAITtQw/u3HjG7RWHSAenV7Zt9EPGS655E8LYfl9zbHlMJrfot8ytEbuld9rqW74FsHqsZ0e+kMZ3Amf1xm9OhZzym9UZ0mxb1wJMsw+HRWZZQGgdpKieJkhtQ31ZQ4B3qk6OzxWvgXGnes9fqkB5p6UvE3xpJDsLwftG2ICRJgKik0TWVo4zG6+nuNaa76PMvdkJlvqFE5EUcJ1GMlDfV6VHOU2GhD+St+A1SXwqXRlC7zHHNI56pcrkLQqKEfg/XdxRlTXFrvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from BESP189MB3241.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:f3::19)
 by PA1P189MB3601.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4ff::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Wed, 13 May
 2026 10:20:13 +0000
Received: from BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 ([fe80::49f:4bc1:672f:45c8]) by BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 ([fe80::49f:4bc1:672f:45c8%5]) with mapi id 15.21.0025.012; Wed, 13 May 2026
 10:20:13 +0000
Date: Wed, 13 May 2026 12:20:09 +0200 (CEST)
From: =?ISO-8859-15?Q?David_Nystr=F6m?= <david.nystrom@est.tech>
To: Adrian Hunter <adrian.hunter@intel.com>
cc: Frank Li <Frank.li@nxp.com>, alexandre.belloni@bootlin.com, 
    linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/8] i3c: master: Defer new-device registration out of
 DAA caller context
In-Reply-To: <01df8e0e-9041-401b-ab73-634701c4acdc@intel.com>
Message-ID: <c179bea5-0efd-0691-92d4-66bcf50f9d8c@est.tech>
References: <20260512121732.406009-1-adrian.hunter@intel.com> <20260512121732.406009-7-adrian.hunter@intel.com> <agNXuQDsj_bHSA7s@lizhi-Precision-Tower-5810> <01df8e0e-9041-401b-ab73-634701c4acdc@intel.com>
X-ClientProxiedBy: DUZPR01CA0065.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::8) To BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:b10:f3::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BESP189MB3241:EE_|PA1P189MB3601:EE_
X-MS-Office365-Filtering-Correlation-Id: b32fe9a5-a072-40e6-4ec7-08deb0d937fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|11063799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: dbphw4lrUACvGPWVteLrOeUcnb4YzUJCNJ9Prmn90uttMiqlwqEuiIa4Atb7YbnNnY+QmHA2lqWa/OJQHKAW3NoyP2f5MgH9S/X3Uzi+XsALYf62WvRoQ/9A9adWbKx+joXsJY4Dlgz2cxWddPPJvV35BHTQCwZYx0GG3mFb45dTw//ua60xaJpbRpX2G/mwnENebW3YugIASwxcLK3CsK+TPMhCSOhAj05wjdBVF5jiMI4F9dR2pPZ/WlJev2MynlLFLiqsvfOHCI45HuXrwLv+GNHxo4yu2AB8okgIqAVOcnlwGAGi5SUSbOq/2C4DEJl4n8O45Szn8hHNa+XoQtXuT0girOb909aDD3Aiq6Nxt1pOlCqnIrJzR4xM8JiZCJ+l3TxSaQcKV+2uPgpk3TLymkZzK2/PCwA7pqZbnSVCcqtsiUkDVtra31jzrBUkromNlCQbjhr6LCfCJfKpweg6qWbtGrTRbmofpGIHVowKVH9jIty6Vxafpx8nUb6ljmK/urtUGiqfnsDzC87fwS/uaIKbHrUHAU0rFSpswo3waU6q85JtCZ41cx+4NtmMl/B4hZGY9SXmrtigMdIv3BpYq7Q6O5H3KzYCX5H/f5cv+1m+b+TAlX8SBy/GY/6gwUxIpnX4iMxDMfZWFZvKKdWMGZ1FqxvvqfKgMJGRslkYkZGVHG22znb7RP3qsYq9KsBp/itlcz7mF5CsuvEqRA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BESP189MB3241.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(11063799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JEqTx3+f3PbyvrIrWeedqkEw3Kx3bMPUV79ixN/K29BvjhIxZzo+h1+eiEgy?=
 =?us-ascii?Q?mE82F9v4/vKfVP5OgRNH81uiJ9LR6p2Hz9frcdFnjjDq0ap9MyPGTh0LnqG9?=
 =?us-ascii?Q?HAOLauFL0zTAILUUneLm9zlsbpATA2IApJpsm/I4y+Kds1Rkq2ErnFWKaB47?=
 =?us-ascii?Q?TIrUlhZeiopxqB/b1reKAjYXRgBD2OfeXaTZs19V7nMMddJs1uDk+XRqGqKp?=
 =?us-ascii?Q?/+LZoxQcMk26V9g7U/rIBlbqS21/fWzpU0CBni5lYpJq9ogIqWzXig86rl9S?=
 =?us-ascii?Q?H1hf9ZaPq0T4rbJfpf6dcwM/OkOlaJ3jERqoPk+tM4E1TkvH73QCZJvi0Nv0?=
 =?us-ascii?Q?wX/PRJjUfehsWGGhSXTs5INA/GqKCe+JNvBgr/5T8/BTSj7pyeJLBEc2BiYo?=
 =?us-ascii?Q?HxkPT5wa4TxrY/UC5aR08y43LlBENgpA+N2AMpgJByBbaUyI2zthQNSTdn2Q?=
 =?us-ascii?Q?pKj3xoxpK9xTcqZ5jK/O+J4geWAVVA1JrZhEupjPeJRp4n0tA0Bd/IG6OHRg?=
 =?us-ascii?Q?bxQFyhx7WXWVdrsg4vHy4mhk45WSFsLsssUn47I1AA/l2ms6kkLOQSpZpiWx?=
 =?us-ascii?Q?LFi/tunZmfpD4TXqJaaNhxYCrU4I/Fa0XO+H99gZzkLqfPiDP3L45LktimFA?=
 =?us-ascii?Q?dnpY56wWlm7ak2/nunb+Asr9alGYrjufRLPsgEqZw5wfesclvV6X5J2joqJG?=
 =?us-ascii?Q?EONUVcJF7wvXD5TYmNVkGh/uZbXF+mdpTXQyg4UZGqDCnUV792kIK03z0Bfa?=
 =?us-ascii?Q?rviFe6P4hmqHkyZ0oAeAWYYN2cgUx+nI9NogK2aYVMa3wI2nj/n9GQ9VI+8X?=
 =?us-ascii?Q?mqibRhclsrysLvO8D2u4HnGQRYXotPvKjti6e4iwKdH0BhroIsFWBftv5XuB?=
 =?us-ascii?Q?x9vRSvbSTHF++TXLcRcdVvuR737nEfa7IIjt6xO2CK7IkdcRPuu2MvIdo8bV?=
 =?us-ascii?Q?IcteKzCDEzETlQO2szBIQGUqtjHcsW1vaHA8CL7BzwW/hfTXF1MDkJtyj9S8?=
 =?us-ascii?Q?Y0JgxhGd8K4KtZrkleFs69UpcrglKwa3tqR1+RDoqLDtTFPeNNWdK3DBGRiE?=
 =?us-ascii?Q?EorqyvHsaChoi1pTwqCnX1/dWKv/7PptW5rqxTuF7Xc1KzMu91QjBc3+GrTH?=
 =?us-ascii?Q?5N4Ed3iiUVO6pqBp4tUabRUl6EwFRSGvJwVZPqPMV3iTwMmyoWqbyxnz8OjY?=
 =?us-ascii?Q?QpoKL5m0a8qzSX2nEW1/veNHYZLdYBrZR7rLBvVvEkVGIeguj7T+na/tC5PP?=
 =?us-ascii?Q?JwQcJMmDNRYMi+vQB+vC5AzG+fYpwNeKaD9WClTz2vGsLElQ4AFGAssWAWLl?=
 =?us-ascii?Q?eYI5p2Qp85a0GL7MtusgDfiQtAQeRRzbjxGFmKqFVcNEZ+Mjp1yZxTKK6KyE?=
 =?us-ascii?Q?ZECQb5ji1FzeyD2xZ+UvB7/OFJr3ighoeNuhF6sQ8dwR3TrPFz8Y0djbNqjA?=
 =?us-ascii?Q?UJbRs9ZyE8sBcp73clZGuIs8Xk+vH61inu5tKCsIwDNR3vBgm3JHVh0O6IWI?=
 =?us-ascii?Q?hj03lcHJ6hBV3IC2n8cIe1N5zo5GnCmkcO11FryyKK7WLheR90ifBWTYSKSB?=
 =?us-ascii?Q?kym4JfvRUEuaNsC7P+YRC3a0OFHv6EK2nybrhTW0Cxcve77ReHaGNzQqdZQ4?=
 =?us-ascii?Q?uRSDqM3bNt8gKae0gvn2eWMcVRArMorL+ti7smnVmW6WH1jeNR7hGiC11Cfy?=
 =?us-ascii?Q?W6oPUSPORpRfRsNgMPeTDWMy28qKzABqACICJoxPAFE0BY40nPBORggfCEMF?=
 =?us-ascii?Q?rnqcjQMwkQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b32fe9a5-a072-40e6-4ec7-08deb0d937fe
X-MS-Exchange-CrossTenant-AuthSource: BESP189MB3241.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 10:20:13.0721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8HNDnJJy+W3D77yKtw3sidsNjWPKCI2hwwCnji/QLwtWkgTdXtJA+HbkygY8GghKtoSVjf9SFlrFR+4lFKzVeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3601
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_032017_987497_94E67803 
X-CRM114-Status: GOOD (  15.09  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org



On Wed, 13 May 2026, Adrian Hunter wrote:

> On 12/05/2026 19:39, Frank Li wrote:
>> On Tue, May 12, 2026 at 03:17:30PM +0300, Adrian Hunter wrote:
>>> Master drivers may invoke i3c_master_do_daa_ext() during resume to
>>> re-run Dynamic Address Assignment.  As well as assigning addresses to
>>> any newly arrived devices, this restores the dynamic address of devices
>>> that lost it across system suspend, so it has to run as part of the
>>> controller's resume path.
>>>
>>> A side effect of i3c_master_do_daa_ext() today is that it also
>>> registers any newly discovered I3C devices with the driver model
>>> inline, via i3c_master_register_new_i3c_devs().  Doing that from the
>>> resume path is problematic: a hot-join-capable device may join the bus
>>> during this same DAA, and registering it immediately would push driver
>>> model work (probing, sysfs, etc.) into the controller's resume context,
>>> where the rest of the system is not yet fully resumed and the
>>> controller driver is still partway through its own resume sequence.
>>>
>>> Decouple discovery from registration: add a reg_work work item to
>>> struct i3c_master_controller and have i3c_master_do_daa_ext() queue it
>>> on master->wq (the freezable workqueue) instead of calling
>>> i3c_master_register_new_i3c_devs() directly.  The worker performs the
>>> registration only when the controller is not shutting_down, and is
>>> cancelled alongside hj_work in i3c_master_shutdown().  Because wq is
>>> freezable, any newly observed devices end up being registered after
>>> the system has finished resuming.
>>>
>>> i3c_master_register() also routes its initial post-bus-init registration
>>> through reg_work, using flush_work() to keep probe-time behavior
>>> synchronous.  This keeps a single registration code path and ensures the
>>> worker is the only writer of desc->dev.
>>
>> why not direct use hj_work?
>
> i3c_master_register_new_i3c_devs() use of desc->dev is racy, so
> i3c_master_register_new_i3c_devs() must not be allowed to race
> with itself.  Having it only ever run via reg_work achieves that.

This race was introduced in
3a379bbcea0a ("i3c: Add core I3C infrastructure")

But since this path was exposed via sysfs in latest 7.1-rc via:
8ea0b60bc00d ("i3c: master: Add sysfs option to rescan bus via entdaa")

I would argue that we should revert the sysfs addition from 7.1-rc until 
this fix is in place.

>
> -- 
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
