Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E552FCAC5A5
	for <linux-i3c@archiver.kernel.org>; Thu, 25 Sep 2025 04:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ls74a0UI5NJDKhTRMfJPl1GecOnAk0OLEwRUaZtrbFY=; b=rOfBYWXWbJO3Ux
	GrIWNEEB/8ptq2CbPyVXNC0dy4vZuW8gxccrmDhkOrgGoe1xIPwFUrc+wQx66R7Mo2/tXMKSKPIZv
	x0uX0MIXD3tSboUzVXCiOn8KoSuRSeY0Aro/y7KZCqz5fuN4ZNXRXXgzgvOTO7hh4N2Fv8XWF/ZXy
	tnUGAXSnlH4N8y9+AOsOcfeXfvo2c4TFrzEcsvVlDab767qiLiiTr8MNTV1HkEPoaLQSezvB6dsO5
	11GAiBuOaU140yInpzgcHCfVPKKQp7rhoq4z+h+cAAiLYeka57uaoze6otvmEYwsQTptm00HZ5FaT
	G2JcJVT32SJMh6ACrFnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1dBg-00000005S1q-2qll;
	Thu, 25 Sep 2025 04:02:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1dBf-00000005S1W-2Ggw
	for linux-i3c@bombadil.infradead.org;
	Thu, 25 Sep 2025 04:02:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lWKMSMi2C7SwB3cLSFeRDU4G0mtyR/n/EI1UbQStJm0=; b=KImScadHWaseJN6yl7kh338opN
	rNlIhQu7kCjvtFiW62SBdneEInULnywG/A9a69smbeVkm+noCy1ehz2Td6X8hb1HxZs7040Xr0mWW
	3gtdrBs2nZ9tudu9R8E7xti/EZeT+3mb72IUKBOtgYcVNegzJ47rWYlPc0LB6RxhqLbt2S662g1hC
	xVeEQQ5kHXSvze89G6UJ22OK1KK1blCiNORDaaxrhoYKHLmH+4hcauiLGd1JfwuqIGKhNeiehX+sn
	GK1vFeKl68yWo9UAaPb/yjCmQw7dBZU0zogrpRsYD8fqxA2QoSHs0HO6N2T28LU6s+HjtJML4Xkl2
	CB+qAcqg==;
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1dBC-00000008uV4-0bpM
	for linux-i3c@lists.infradead.org;
	Thu, 25 Sep 2025 04:02:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HzLbxL/SNvXCIgAmA82DPPXgS7SvNl2Xntf0DdZ4HuSN3TpeEK+oJJyWtE7LwC9a/+e/yUaCh6G5kFgi2n1X36zzEtBFFH555MMJKeZmKVfBUQk0nENBYb/38Bf9iFaYsHHnngKQ8bJppz9pRsLsv+oZ6IAQjYN1yr4Dz7AJ/+CYlw+MEXSlxmIhdmwvxnf9+3gISkgv61QRffS0UjjbjjSvls+6AIoEiqj9FkhLvdj6+ScadeLRqDp7JsJzn9eG+16mT7arz0TDK0qGjQByfnpi8OWnAr5OTemKs0oIlzNQLnrJwSFrVRnV4l+VEwaM9e5wc74cR5rbuHFQnlsQYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lWKMSMi2C7SwB3cLSFeRDU4G0mtyR/n/EI1UbQStJm0=;
 b=GuUo3gidNyiBdHIgmvPApb9iqnY631rFWAIgounqE/YiYV7YvlNnYoVdOZvFQnSTFUcDF5qMbf1MDsF9+dm+BbsG/qm6MtCBsIJ1P9dhn4UHn2gtpSnh9wSvDtpnv2iwIJTg4ZgwUvJYWAeP72EgBbj9UIZoTowwR424/kYF9o1nZ+JRbyI+Qy4aMgE/iwkrc8ZF33B285ft9QRZtkzIz0RfPflRAymF/dY8lC2R46q8U4zNr0zFRrMqcIhZShpWDGZcgh9mFLCTEpA3Pl802qaeYGe7mJik3wItJf3di0rbNpFw0V0oIaSgCykauNNTAwcIvJe0Fgk9DnpmuuYQDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lWKMSMi2C7SwB3cLSFeRDU4G0mtyR/n/EI1UbQStJm0=;
 b=T3vtPJdiN7wusZb39LPC7+uXosKbivDVorc9bd5p1aHbtiW19iH1HxN9bUwkr6u4mv3eqLDEp5nWXkEvb8jnt/JM/y9NzBkkRSvc6Dm/7n+KVswVxk8Wt9Z5wN6aJAIAaETU5q4y5kdIucJLZRRDeIsM0msEYRiurdH3oPFbb8Fg9EuM/wIbn8zWc2tfSGXxaHWPxJJfDCeaVzpedSAdgNz/U2YysHfaZFa7aj6FKV7mVNt7NYDlZzeFUCN2Qkf2nUGUJH1U5y/xDi2xJFvZnUgVDaWLwhtmUeOQrzuy+h5mtKkQTh7E+lOoneLYJ0HfbAyEScKpBtdSFCw9uzG2dA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by AM8PR04MB7267.eurprd04.prod.outlook.com (2603:10a6:20b:1df::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 04:01:50 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 04:01:50 +0000
Date: Thu, 25 Sep 2025 00:01:44 -0400
From: Frank Li <Frank.li@nxp.com>
To: alexandre.belloni@bootlin.com
Cc: Jorge Marques <jorge.marques@analog.com>,
	kernel test robot <lkp@intel.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: master: adi: fix number of bytes written to fifo
Message-ID: <aNS+qF9+DkTHrt8r@lizhi-Precision-Tower-5810>
References: <20250924195600.122142-1-alexandre.belloni@bootlin.com>
Content-Disposition: inline
In-Reply-To: <20250924195600.122142-1-alexandre.belloni@bootlin.com>
X-ClientProxiedBy: PH0PR07CA0007.namprd07.prod.outlook.com
 (2603:10b6:510:5::12) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|AM8PR04MB7267:EE_
X-MS-Office365-Filtering-Correlation-Id: 45107c2b-69f7-4e33-8375-08ddfbe84125
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|52116014|366016|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vgM8qaHVX8QSxdtzttqNmPZjGQSfNtMVwImsoZVi869brENCohohDeEMe/B1?=
 =?us-ascii?Q?Ykqn9IqIRxwFznsBc75aaZx5x7cFXcBTTqIo7Bqd29+riFlPszPn/CWSdtnE?=
 =?us-ascii?Q?9dr4TDzX4G8qbhfzSOZv/XIfr7ij3V43GLVI7jsnqtZ6GjkhpcD78NG934CP?=
 =?us-ascii?Q?8Eu95UEdFwn2MLXwH9nttaBcivQGrbBzBLgeDjQnj6ahoZcS8FTFUsmcNeNW?=
 =?us-ascii?Q?GUriW+c5SQTPDogWVtj7tanNSaE02xPH3Fo3OwLQSDYWugq2/Eu57fKV/dBy?=
 =?us-ascii?Q?aE7ZD2kWgDAEMknEAMErsD2Jx8dM0q7v4lAIcBfgdEQCkY5ROJ/Q6LAuklj3?=
 =?us-ascii?Q?OGym4+FXMGlBymct4fWnnvlexiS1YoOKkpGu6KVEHYvZhXDglLs4MdLx3Hlt?=
 =?us-ascii?Q?N4+SULmFPntvPPIQkGwnvgzEZeRUqtUxQHb/8AqtzOp3QRXXQXkygXnUMZKA?=
 =?us-ascii?Q?/Epn2cBMWjwVzjvloEty1LSKF/H3mwh2t0iYPZQu/lKs5Cg29kJvoUrRiNka?=
 =?us-ascii?Q?E4qtzQnxWH5fI2gWRF1RKqFbxD7PCHKemepDHNd1OLSLwhMXiPfDEnxUt853?=
 =?us-ascii?Q?wgRnWH5fJA5r6eKoT9kNsY2EZcXt+QmwfqonX+g2cl76yrqJP98W+hMWkOnD?=
 =?us-ascii?Q?969QMUg+zLdMLl6rYnC/oi+qBOdJoLrfDqvysv23kyZcLBa32mZ+RSEEyn6O?=
 =?us-ascii?Q?t1n0BrhJVe/PQpZlyTi0XsQsQXVmMnvO6HLNtG3wUQ2V5utQfN0eW5ToUG1H?=
 =?us-ascii?Q?Wa6m6L9QOj/5J+mByPKnGwNdHt/ykdqQsVo5Wf8HumyhkYmWqJk5ZjlUhxYs?=
 =?us-ascii?Q?c6KMaGOINN2GYqSG45Lz9BBr0gtcZSexPokYlz6W9E0ycAeYjPeL36XUgCjS?=
 =?us-ascii?Q?QKBwNa5ca1OE91Z4qYSfkV+OGXb1O2jqRAVkFnfKQ6xLeC+BkWkKxF2ZrMgd?=
 =?us-ascii?Q?H/O9Ek1T4kkTV0mpO6FsU1upi7CLovUl3HGXY2hyzhHTvf2Scw9V3d//Q+Ps?=
 =?us-ascii?Q?OpMXPTjb/uEU4dkuFh1UdBvO76fbQs9mF/fQuUkrO3QGX4Ba1c4DIxetOkgo?=
 =?us-ascii?Q?Fcd6+/7ke1ctIvmAYiX2OxFD633iEUpaTitunN7ThJBO3/nQFqz3W2WLFAs9?=
 =?us-ascii?Q?jfqerctvvhDLWqNXmPknOrVukp+R+BxuUSSOuqrmSpJCGtQ8NvNZaEcRw9+v?=
 =?us-ascii?Q?XXcGWydglzX0vx+fNgh/dSyxxL+tP3uRQYRgwfjqt0kUtWdCZ3Q/OzAuMThD?=
 =?us-ascii?Q?yQA8nF3SGQ4QagWu3O5r159quc3nAoFr9efNhnae+8qdW89Ms8G28p0oxj4A?=
 =?us-ascii?Q?rzv3k1CBRlytkQpFmpfet9DzAIL0h3gVH9Q26FF066W9JN+PQLFoY33hkxef?=
 =?us-ascii?Q?uUyWYKVgm5U38wvtpE5Db1x5yD/xtHvWTlXgUvj6t45P2pDaFlMu0V/Y/iXH?=
 =?us-ascii?Q?tnX4GQAClcPm1w2pTGUEyEdVkjoz3g5XCbY3ddUAInvT81u8UUNh5209tZxN?=
 =?us-ascii?Q?oke4e6oyEDjdxmErBtdmVdlVzLKPF4d4Ikdk/FzMWKQtQTZhPswe9EzBJGDF?=
 =?us-ascii?Q?B+cNoFIuGroxLYCTNKSt1iku+6SAYU6WkcLRYT/nU2qhhKFJAAkPlNuHHlgf?=
 =?us-ascii?Q?hIwIp4coEF4eCiP2PJnCTEiCY6sUQnsc5l39V5dCHRtTFpCraRCDoXsu335T?=
 =?us-ascii?Q?WRQ1C45vG9JFbVkQS1i3CAooL0OdU3Maus+KG2uVLYXjXigS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LZHdjOKdAR2rb+3l2YZCIxVopz4pkpSJNFitdzDiu1V2Nuymdr5A5temx3z/?=
 =?us-ascii?Q?pck6F6iFOYM0MJ/QO/ha1riN+GL/Hku8GERpyReIw/OASEbqFl4fZjlfr99J?=
 =?us-ascii?Q?41shGOs4Yxwt5XomJ2z0uuB8ARuMYcQs5fzxdAupkbzWSr8ajVL4bL4hl+uP?=
 =?us-ascii?Q?GSrL3lrD5oeaC2PP+L1wW+LD12Ov3g76OnUcM/SnJeKaDmgyDoVMrOmUGmdQ?=
 =?us-ascii?Q?JhgGsoivcgQ20Z4WR0q23nFEdaUVsACkU4fC7ft+VTRLrxtCYxPkUpY8S5hj?=
 =?us-ascii?Q?xbe4D1dm+5A+vCaudXXYToS8fMvnP0CulGcTi3LRJ+ZkjiZ/c/qjrqVhdkGO?=
 =?us-ascii?Q?RjR+hGHeUhqMwDaOy1RywSkb8GZRe835iSd9GJllsYRXDCVgsDnt6IQzJV30?=
 =?us-ascii?Q?aujXqmiSP8ys1mCpc2rnmvV4hazFMidS3J8auF6XmtL52oK+AlGNuyFqNR2E?=
 =?us-ascii?Q?FbCxZEUf4r9nJEwDPO60SwY+4ZHl+dXCvFkplnT5s/2tgUMe+YY+QWbeIoWS?=
 =?us-ascii?Q?J3O504/ARA6ii7t6Vy2jmXlRrlc3AkZdLMfzcfv0Szf5SEEKrgbSsxomNjR8?=
 =?us-ascii?Q?QvxS3WQ+e0ytSyEO33Z+8A6mkfRn/Oh5cEs111LycV3hbjQOM4AY1MmkWFU0?=
 =?us-ascii?Q?bnWquXBh4JtUZgStrKHMucmdWUmjRSeQLjpyVdcb14yOaFTAgfXD/hgQgzGx?=
 =?us-ascii?Q?01A3JglIHC6WxX/TGjh7VsBqSUxW6usuwHEkgmllflGBvGzC9oGnVY5qmj/P?=
 =?us-ascii?Q?BdDK9H7WVcjlNIeJpIPMpirupWaltJaQaHTNdOfGHyUelk5T8HwZkxJDZouW?=
 =?us-ascii?Q?yjKdtL7kRL7QP/JmjMQ0JB2JPm85zn48xLwBMOdStGmbvCWd1Ntq50Uu9ig2?=
 =?us-ascii?Q?+VOoSNXtAmPxj81c5WWh8Dwxs1CCABHrAR7Q9KU0WhhzzGgFdWp1VjqGi8FW?=
 =?us-ascii?Q?wKMsFMAQTVP1rV+TT7V3Db8sSAxjJqZH+OfBKxIVJJEBCeWogcqrol7z1FQP?=
 =?us-ascii?Q?/j9fXmMcH1Zh+v68nzOg9Ptiami9zJ7m8PcILSzAuSJelkN0V1KyIQ4rN7xK?=
 =?us-ascii?Q?W7EATCGzE0KNxrHmP3BRoyWeVaM9mPpUGx1d/pM8xvKyjfWcmtNwMvLf5khF?=
 =?us-ascii?Q?zUKad0rS/r8dfNe/ogV1hfWPQrkK4ZI4jathqs9e40zGYTZj80uTsemfKMQp?=
 =?us-ascii?Q?OG7ZdNSQ3KzCx7RrpT2qssaSrWSeM8pEeFLAa11opY7XZ8gyx3tUPQ6akW+U?=
 =?us-ascii?Q?fML/9uu2tjm0BkXid2EmbC/hFxsmpS1QSApoGRXYJdCb4QkuT76R+N5ucW5p?=
 =?us-ascii?Q?Cs2nERh3sDet5d1Tnt5YusIdPyYtLbRc2/sl8GMKNGV+vhEVDh+J2yZ2BUGL?=
 =?us-ascii?Q?FgiblxppJrJXp8H338r3RamENkW8orwwf24fudkffAXhSgwP0MH8c3kMtIoR?=
 =?us-ascii?Q?6MmRxo4orhGO1MiOD29LubO/eiqsAIyqSbb+/m7KWp2IP0dZF78LgrUPbD9b?=
 =?us-ascii?Q?vvX/4f4GnYcocBmoRw71fjKTQE01mFqoNrKw2cNmFAQgEBM6rzkKmmYBOJq+?=
 =?us-ascii?Q?LJ9Iy8He/WFz9328E78sbfeRr7IHTKLXxPV8gss9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45107c2b-69f7-4e33-8375-08ddfbe84125
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 04:01:50.2442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JV7aGo7AOCQFnpkij3wTlF7rb5lrGa5Y4RQMU0z/YXUMim1nW1+XQ7dHNaCOIOSu0RjQu+R11VVW9N2ZTU5DtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7267
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_050210_085356_D88CBB9C 
X-CRM114-Status: GOOD (  16.34  )
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

On Wed, Sep 24, 2025 at 09:56:00PM +0200, alexandre.belloni@bootlin.com wrote:
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
>
> adi_i3c_master_wr_to_tx_fifo computes the maximum number of bytes that can be
> sent to the fifo but never makes use of it, actually limit the number of bytes
> sent.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202509190505.fKGvEJRa-lkp@intel.com/
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/adi-i3c-master.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master/adi-i3c-master.c b/drivers/i3c/master/adi-i3c-master.c
> index 18597ba1f1c3..82ac0b3d057a 100644
> --- a/drivers/i3c/master/adi-i3c-master.c
> +++ b/drivers/i3c/master/adi-i3c-master.c
> @@ -135,7 +135,7 @@ static void adi_i3c_master_wr_to_tx_fifo(struct adi_i3c_master *master,
>
>  	n = readl(master->regs + REG_SDO_FIFO_ROOM);
>  	m = min(n, nbytes);
> -	i3c_writel_fifo(master->regs + REG_SDO_FIFO, buf, nbytes);
> +	i3c_writel_fifo(master->regs + REG_SDO_FIFO, buf, m);
>  }
>
>  static void adi_i3c_master_rd_from_rx_fifo(struct adi_i3c_master *master,
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
