Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2450DCDB474
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Oct 2023 15:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MZ8ClTQIftECogV1Y+GS4Z2PC90O4kSDYI4OY/dGogs=; b=0VKJT5LQl50q7M
	xHB7Q4Lp1/3qebB4l8cm0G3YKye8IfLrNZSDH83v9nYji/Uv0aQUA+MeJoSswDgs0npSHlwYCCg5U
	ay1YwzuBWDfx3707Dn7YQ9/GD7y8Uf/RDb4eP+UAFwu/Xc4xCx4XHoC+QZ6XTYXqGGEgcVLXNr2aV
	twe/1S3DaTmc6LVc4JF+S66pyD5EAPKLP3tMrVQlYrUHkzz0NHIn+glwSErpFM78zmfNsemu3y4lv
	kIKCtG02lnOb+24N12G9wzbjZupe/eGoe+dc+vt4w2FQPHvivmW58QJCLuRROdNsAIPXw2o3rBnwj
	aUIP1ef6DpN+mI8tuEIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsliu-00CiHh-1x;
	Tue, 17 Oct 2023 15:11:08 +0000
Received: from mail-am0eur02on2062e.outbound.protection.outlook.com ([2a01:111:f400:fe13::62e] helo=EUR02-AM0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qslir-00CiGp-0F
	for linux-i3c@lists.infradead.org;
	Tue, 17 Oct 2023 15:11:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cS3OriZu4gB6Ryuw5i1iXMWV4Xi7SmvkP6krVBsbU061AtYKGxkKg1VyGgxI559Ma75QXHjCF5dlij+gj2uLdKVePzFrFoYhrg3/E4pAHSzKVLVcdWiiKJm8nZrIjq8i4wAPBEgf5l8h0k6aUvqBC/vYSOxHFS0kvTnMdd26p2uSzWF0AbGx0Ir1lvUPN0dP/nnDzBq0IBAAfWxOVGSZZvuEvApOXcaRJQAup9BLhE5sghD+0AxIX09xkqhlTT9OxqaQpNffY9OgCZy0JaJ72/AlmzaAaTPYPXUYpObMLgebXNjKmKZsbsFKDx65FPQ+K9YMDn+hhOo7jtNYpONANA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=piKg8P1cqGsz8vKhYAEFSbUCMUjyG/TB04WPd4cPQm0=;
 b=AetAj5wbZxlKn6Ih6GTl59ziXYlnhMSVMAFFFI/iv315VcBCo5BDso1DOv24KWFBOwBDU/1W3L4wG6tPpIbmyvYrHQiZMhgbSmK08MDjMZJsEeZocPM6WuJbTHdhDzJHCWnoUROuczYgz3xPt4QbfopFUn21eGR9BbVTV+O6AZTiW3bs30r/ZkMWyBXA0x7AV5V0WiDKS8cZXSE4UxcRfL7IyLxyf7vRHU3HxHhP7zEem9bHFNjSJBDII9cc36DmwFYyjRk8T4qzW7GE9AkPM9FNgkmxrGk9XuuJkcRvMJCssfgH/20yRA6Cl1nVt833HXtBk8McRoAS7z7OJPUs1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=piKg8P1cqGsz8vKhYAEFSbUCMUjyG/TB04WPd4cPQm0=;
 b=rc4li0lsvc8yHRklhFLq93cwwL/XvkblnIUBfElLU1Eku5AfpckvaZIgxrc1dyGQ7Jcu1RGK4uqTNO5IOCfHRlWsGjiL8GSyDsRqJ+0APhX4iA9/NNJ9t+HNQchA6AZjdQaBmLSl98hXFZNQmgzBdARcavtfeDkbTfiXoOJIr78=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by AM0PR04MB6804.eurprd04.prod.outlook.com (2603:10a6:208:189::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Tue, 17 Oct
 2023 15:11:00 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2%4]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 15:11:00 +0000
Date: Tue, 17 Oct 2023 11:10:54 -0400
From: Frank Li <Frank.li@nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: conor.culhane@silvaco.com, alexandre.belloni@bootlin.com,
	joe@perches.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/6] i3c: master: svc: fix race condition in ibi work
 thread
Message-ID: <ZS6j/tpqEppFADk1@lizhi-Precision-Tower-5810>
References: <20231016153232.2851095-1-Frank.Li@nxp.com>
 <20231016153232.2851095-2-Frank.Li@nxp.com>
 <20231017161658.2de6d9f3@xps-13>
 <ZS6cRULPrwWjCL02@lizhi-Precision-Tower-5810>
 <20231017164946.623abd0d@xps-13>
Content-Disposition: inline
In-Reply-To: <20231017164946.623abd0d@xps-13>
X-ClientProxiedBy: BYAPR08CA0009.namprd08.prod.outlook.com
 (2603:10b6:a03:100::22) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|AM0PR04MB6804:EE_
X-MS-Office365-Filtering-Correlation-Id: 56354582-4140-48d8-26da-08dbcf2345d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3tWjC/d+tqlhx8lv0yYVSq5fOEkkoS5DgbM1OdaFWoLvriLYRvnCTfKKjJNvkoPNSjaSSHATt+6KASktwpQzqmmrZLZ4UjV7O+Hn3BTR/BDyBJxwZ/9cIrHcB7TvbxalhAuNQQ30sqJiszQWG3F/GXwPb+BGLqI6+xxViGWEetvCvH2wUyWTd3qcMPb/Rp7EkXwqW9u7ixAYiQFqbg65mrmdY8BJAMU9nZCKja99c+YwNBVMENG9wvInFFFB1Rv/GAQT9p1Ul6L8anQ12Muq6cLOGQF4gCZztUY30EEowKpCtAQE2x772NTFxZeteC9mc0noOETx96Y4OGies4mDl30S0ylR8epBnEU2K4Hmq95eqcXKnoECpn2lBCDGRns5M3ed0IgrXRN1zbSGj/ZxYNY2+ORnlOXv/O7yTjZF+9Na7ay0mEriTzN056s6A+FyaKJCIuhxQM6vWVm5iiEZMg2ca56/PNl2XcSpm9vrpTTAlIJeG/Y4vcl8E/Won8F7GN+1DfkYPIkO95qSdAgCPLL7pFbWQY2g+LdpoNgoY6/w6KiyFkR0Dk/8jZENWpZvzmYQxGReEmStV0OpoETBojB2u++IKkYmLnIJw1qxdvtBrCVBdsJw2sYjZo0Y91e6
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(39860400002)(346002)(136003)(366004)(376002)(396003)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(6666004)(6506007)(52116002)(38100700002)(6512007)(9686003)(26005)(6486002)(478600001)(38350700005)(66476007)(66946007)(66556008)(316002)(8936002)(6916009)(41300700001)(8676002)(4326008)(2906002)(86362001)(33716001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?CzgMOC2IxS8QRWk22jrGGtp0G85nGsV7Qgl4QG6WI1UxY/7OWQtTD+d4uN?=
 =?iso-8859-1?Q?kQZ3DqIh2uR5P4ywNjt/SsL/Q9Z+3gNUEbqVOin8iqi+cbhah8NpyqUCSr?=
 =?iso-8859-1?Q?PqKJc4xO4slPb2xiswrmL4aHE7ncQX14eRwaYE6u7xUu6vx4eTQU0KvDsr?=
 =?iso-8859-1?Q?UqBoHuJ8ZCTjyeEiN3G52zxR2XQvHJeMhrDPafeYM7iJwadzOtzgJhFVAC?=
 =?iso-8859-1?Q?jq/qwqWS4PwutuLBQ7j7U77Wbtzeh8EkfCi8/tTVeotOVvmCibu2DdKEq7?=
 =?iso-8859-1?Q?vv77x6xjxD7UiS3hfxXOLUiptSl8N/c8hgqmnsMCtxQ1Oaizm6vcvtI+sk?=
 =?iso-8859-1?Q?jLkkEBJ+v/SWFEJJP6sdMO6oafAJJGl9Uvfu+qkRkv1V28SNFZQAxu+4dH?=
 =?iso-8859-1?Q?nBwgj5XOxdenjOWaTPQX4mNO5DQGS6+lmYxlbqfelAssb0eWnvWXQxLT4u?=
 =?iso-8859-1?Q?v9Siy5dsxv058yGuVv8p+jtpIIofa8d1JFbVBamgNNfPxFc7NJsZfYMCLt?=
 =?iso-8859-1?Q?U5WCcY0u1lg0h4/MPA0Yy34oJ3k2SjeHK8qZ6UDbT5GbaNgUA52qOWZdAw?=
 =?iso-8859-1?Q?9404ekct2G0Vm3ySn0B7QL11OVmAtFhNK4BQaW9gZqjfvKkxDwHepwJk9N?=
 =?iso-8859-1?Q?VcxEOTEdr+DGhCDHmutBUK4fH2wq85ZCQSwhczHIBVsYi0/4RNUClAy4Km?=
 =?iso-8859-1?Q?iByhr+jHoohiiC5UlsdhsJzzVb/IrioLiRcQGz4VrgEllfXpUg7Qmwd3ye?=
 =?iso-8859-1?Q?JYuAncqcicYrO6Abxg98BRgKlQE8V42y2KKVwY5i8pYOwrGGOFw9DtKuXp?=
 =?iso-8859-1?Q?+i3dDZlOUu4lBEo3mWd4xnqQo6oNmEaTlBg8NPPqEzrsTG72poWCY2m9Jm?=
 =?iso-8859-1?Q?ceoM+02O31E5ylW03gHhXU883Fi18Ap8fgjyuCL5aILBk2H5xqwXfolncx?=
 =?iso-8859-1?Q?BFn6TkZJDShj4xbVkI4xrCkWIjhgXgmB8KHYLY2wEG2QgAkMqFZ9QN6S2t?=
 =?iso-8859-1?Q?tBXbB7OxYEljatkhmv+FKd3CNFWxEIy5mFVv/iTFBFyQP/YJBtrTXW7Wl9?=
 =?iso-8859-1?Q?BqWVPe9TotL/dQHc4rJiZm0BmIXja8KJKKy+ghryZbasWyJpgTS6TypYJ+?=
 =?iso-8859-1?Q?2BxfvFw9RfttJTUoEWE75+67nHqhUPnzEJesDpOreZDLUQYtEVcyQnHuwT?=
 =?iso-8859-1?Q?R+ywtO35lIQ4H4kTpMc/lpdaCSa4rRelv9ROQhMD7/TZfVqH2q48Uv8A8F?=
 =?iso-8859-1?Q?VD1tFjj7I3ECE3AT4bf1g8+87XeTZLxiJgB/DQy4v2IAK8fdapSAmii+P/?=
 =?iso-8859-1?Q?Ane/Z6/IcKC+h1pjAwgPYb3ChzxK68rp8Y0pCPHkHs+eeqrY3hpmx43SVS?=
 =?iso-8859-1?Q?q7M2m6u5k1m28nzW9NbQH3aZyfTl3naOOcO5eG0X1z2B1JIO09yAhZeVjM?=
 =?iso-8859-1?Q?vOi7IYNguzqws/VCbX52fsNY+UguPolfSG6AOrXoNl1rICBk0herDH8o6F?=
 =?iso-8859-1?Q?u+TBXUPnsitJ4ao00GL3ElADWbKrvYQXsb4Ukadt2XYfXymYzuRZJtM3Qo?=
 =?iso-8859-1?Q?ixYiv+sbULGu9FFLRr5bcOXjAbUWHJi+2WxcFKK/3/3FvrxsGz4DkA5a3z?=
 =?iso-8859-1?Q?yJizp50DIaHRpnzdHlqeMwgQ70T2zHcKSX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56354582-4140-48d8-26da-08dbcf2345d2
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 15:11:00.8065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: meJmqZIlgL8JkFF23qDSoAGQQPx5NACQKTg+ZJXK2ei0TfLXqQx40Gg1bKyEIF9mRFLJQNt+UscM8kDx0if0Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6804
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_081105_117538_6053D653 
X-CRM114-Status: GOOD (  19.71  )
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

On Tue, Oct 17, 2023 at 04:49:46PM +0200, Miquel Raynal wrote:
> Hi Frank,
> =

> Frank.li@nxp.com wrote on Tue, 17 Oct 2023 10:37:57 -0400:
> =

> > On Tue, Oct 17, 2023 at 04:16:58PM +0200, Miquel Raynal wrote:
> > > Hi Frank,
> > > =

> > > Frank.Li@nxp.com wrote on Mon, 16 Oct 2023 11:32:27 -0400:
> > >   =

> > > > The ibi work thread operates asynchronously with other transfers, s=
uch as
> > > > svc_i3c_master_priv_xfers(). Introduces mutex protection to ensure =
the  =

> > > =

> > > Introduce
> > >   =

> > > > completion of the entire i3c/i2c transaction.  =

> > > =

> > > Did you experience faulty conditions or was it reported thanks to
> > > static analysis?  =

> > =

> > Yes, I met. But it needs my slave part patches, which will be ready sent
> > out review soon.
> =

> I believe several of the "fixes" in this series are related to newer
> uses (typically your i3c slave support) which were not in the scope of
> the original submission. As these new features are not supposed to be
> backported in stable kernels and because these are new corner cases,you
> may drop the CC:/Fixes tags to avoid useless backports.

I don't think so. The issue exists. Just difficult to find it. If there are
i3c device that use IBI frequently. The problem should be trigger. My case
just make it easy to trigger the problem.

In previous existed code, IBI is supported.

I think it is typical case, which need CC/Fixes.

Frank

> =

> Some of them however are real fixes for situations we may happen with
> the current level of support, please keep the tags in these, and move
> them all to the beginning of your series.
> =

> Thanks,
> Miqu=E8l

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
