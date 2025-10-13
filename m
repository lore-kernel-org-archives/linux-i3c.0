Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16262CCD183
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Oct 2025 22:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vLb4rRAuyCMb/3Cz6rIF0SEFQOJg8pibwG+tuGZsrZo=; b=tsMktEunQin8hM
	Pl0typJtUEZVJ2sayZ2S+3Rb0QMpFXQrKvu69xheYk5ojbpexy95uX5UOvu09E4nVP1b0OSNDROOO
	kVqNVWvREsATzQ9RSVKaLSiKMHYNAFC25AGtUPpa9A3Omkscz1uokhO/Rza7PBY/e17DBU03fW7HT
	G+sxLo+KWdtCG6M+8+DoGbDP3mWGfbUItDDiBsJ0KDOC975il3tjDRbt7RTzxmBX0Zj2+a9Lv/B/M
	3BnD2yBCIkMoGltfaJYD4MTEmzxP7PNU1kG26+aCndEWpYysPVh3iKp9HcYLOtPJhCvp2akKE+rV0
	i+XR4n1HR4BbzFR/taWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Qbr-0000000Eean-3T7y;
	Mon, 13 Oct 2025 22:01:39 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Qbn-0000000EeZ1-3opK
	for linux-i3c@lists.infradead.org;
	Mon, 13 Oct 2025 22:01:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j1zUDvWTNVg8R94cgqCg+BXU8KBEyZJ08GY8OZg07rNYGw9a0nw/nZ1S6Tcy6tFSVj4yRVXwGQjzEQMGj2veD+0EbkklxoABEv2FUVknKn+DUbEFsf0BKcediGWizdPipqYTUygYoz6aCfWiDD5UvdJDzobk0cActX7b8Cw/9o51es81aDycv1DZAf/IUChm68DWnSfhJjKZ12wul5Vad8FZRTLv4iEPXOapSWDoN9Bkf92xlj8zE2nuwQMuseRPJfdlsyh7e0Y/vvOCv6m4KX/9xSOGTI9aF2vidVqIGfzj2vY1s9rAARE0MzsRapCR2rNSbazA8f+wja4cOldh8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/OdiqmvI88y0KZKgE+aTfiGw5EJpEwORlIBxM1A8EKk=;
 b=uEQMRQoxcrPgzanG7kAalfrDbbTsdM13OKT27n65dLInWqEe70dyC0kt2VQ0w9Qgmn3GnOTWJWFBw41W821PpilxdSnrPVj8zvJ3zm7mBvu6x19nhAJDBOU1/7JNS+tM+4Bv/wjaYlGhR459HU456XKhmEoC4gRJyT3jfB9HKzWKTPyqLNEDG3hhECjxbrzmd/k53kChRktDlQtZcthEDlEF585aDqCwEocX53YJGczktXXMZMyHyUpoMVQCU9VTvJsbT5yQZlW4n7IiwcX68PQsEOMFDKl7CU+caI0gtSGPryDQE89jb32ytKfWfK5ArefNuU/RTzK/GGQgggNmAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/OdiqmvI88y0KZKgE+aTfiGw5EJpEwORlIBxM1A8EKk=;
 b=PA6flgcPIeqQOFelRDzVIqCDk4l80xSGwMiDEpxM4QH8H8hQmWz7YEiE64T7FjwDUT1CnBBn1oSBOFX7rMuyzG7Y8gUo6EUW5bkw1IFaDejRWXHspvYss7qU0mf3raB4EpCYsv92gu8sAe4oUDLyLNh1uqfUWuszNanas56cI8RRuUeLdGT6jVxfYkca39rCb0rH3PU4iQT9qdv6D34fzo9Q55N/cLn2KnZWe2WdpOzlamD/wSnFTEOE6yuFx2d/srbNTn3DYYaqr/Q+tQHvrDxunxfWiSYXdKm2dBUV9H/SKydwoi8oN9MS6hZHel7NKmE6S1Tlw+UVYh9DDor6WA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by VI2PR04MB11218.eurprd04.prod.outlook.com (2603:10a6:800:29a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 22:01:26 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 22:01:26 +0000
Date: Mon, 13 Oct 2025 18:01:19 -0400
From: Frank Li <Frank.li@nxp.com>
To: Shuhao Fu <sfual@cse.ust.hk>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: fix refcount inconsistency in i3c_master_register
Message-ID: <aO12r9v4xaJKHUQs@lizhi-Precision-Tower-5810>
References: <aOYSTX5EA_nRoIY_@osx.local>
 <aOfgB6UpBha+pvqa@lizhi-Precision-Tower-5810>
 <aOio4HtjjfXclSW1@osx.local>
 <aO1etATnPSklqdua@lizhi-Precision-Tower-5810>
 <20251013210953.GA2124@DESKTOP-2SPVBES.localdomain>
Content-Disposition: inline
In-Reply-To: <20251013210953.GA2124@DESKTOP-2SPVBES.localdomain>
X-ClientProxiedBy: BYAPR02CA0048.namprd02.prod.outlook.com
 (2603:10b6:a03:54::25) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|VI2PR04MB11218:EE_
X-MS-Office365-Filtering-Correlation-Id: f4965bd0-0d9a-4284-da13-08de0aa40dfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|19092799006|1800799024|366016|376014|7053199007|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6dZx/pxChBY8nViyNLwx/e5hJTGmwdPyg1XS5aJtsZ2mm97DojVduMff5Yko?=
 =?us-ascii?Q?FNUsCmks8wqcl4NyCejKouNYxPZZBuVZqU+Ji0bpKaiVw/+IvrDOSuOLPyYw?=
 =?us-ascii?Q?nXNA/XqowVEJB9+xFlHNjqZrtDFihp6K3PbhRuCGxSGWkM3K6qLxC8RwP1Cl?=
 =?us-ascii?Q?yN4yRPEyTQxLXjgqtLmS/vzwWNenzUhILtkW9ENAE2NjS2vztFXAb4pTaJ2a?=
 =?us-ascii?Q?9L3Zw6XHhbnA1J1M8k1th8iP7zZ7n09ASu6po0WKkNr4cFZhoB/2aydP+3LP?=
 =?us-ascii?Q?KPf9Z57ijeCZGD1R+Ep4L0gvD3IPZH3s9BRP+tYEaLL2QL84rJK9xi0KX302?=
 =?us-ascii?Q?MLVsPTXMTa53v0ai0yH/oITKgV1ZHvADEOSkNcngVlVtX0spLWKMQVIq3k4s?=
 =?us-ascii?Q?8vsjfNk0MAVv5tkaAZs/pF/3RtUTZbioBpC6lRnfhsNHdgx4ZUmY9HwBVbJy?=
 =?us-ascii?Q?xJYarAl+gXz9hA0D4ZmvUXRLW83qdL4ZaSzMFigd/xut+ZIJXFGyzYPoJWun?=
 =?us-ascii?Q?+f6qQiFbqmV9sQA8MTneHYfldfOp6F9GpqoNU8pYaoSTbx8pgJMDwfGY9eOl?=
 =?us-ascii?Q?pVukrZ6KLn79k15zoOnik0nbYc3uHKi6kFG0wmmvU3tKrwdisZY5t4tZTZQu?=
 =?us-ascii?Q?S+q2t0FraNZsYgudg/kLvFhfKCkOZVpXCZroREjU/1TxyeQb8V3gmxCMArbo?=
 =?us-ascii?Q?oEoz/zlkz0znE4a9EskCAOM56BbUQdqJ6c/yQuuEwd7Z8dJA45ngeJHdBOr4?=
 =?us-ascii?Q?+rAVsgot1wLLiJxnuwSAGCDvlgQrkx5a/V5CO4BD1arGENguw1L3MDqwKDe1?=
 =?us-ascii?Q?OteQAuWCUKp8eHs4qNODEuKHC+wQwpZbu7iXgySJRE4ybRTqVpBskXbKIPVx?=
 =?us-ascii?Q?4hqTEC2X0Hm88hdgKWl1Hek5PGj2VRVrihZ9wk8wCC6yOkh9yDpa8N3bl1VG?=
 =?us-ascii?Q?9smadT/m0aONs3xHSzCdiclavcz5HpfBrlXvi6iGrG/jwcrUXbRpO2SGfZzS?=
 =?us-ascii?Q?o0U2OlMJWyKJpQDeFPEYrqoWNFnEjJWTtg5ChkBnVbFQZDiL7JvGzP3iq/cV?=
 =?us-ascii?Q?O4xCJmkB/o8J0mo5JIH1YJTP6w1Jzv5WBJ8VIuK9raz7y3iATqnJ1k8Mke2c?=
 =?us-ascii?Q?cAFdZHsNb2BxBldsXuDVYWWTjxhbZJia//C81RMocEmd0/iKpZUzpEZzPYFx?=
 =?us-ascii?Q?BE42fwrYTmL20P9ejHI+PPI95EBjXJeQ5yk1++hw4QduGr6cG3Nl41HJYU1+?=
 =?us-ascii?Q?xhl7aN5risVRnBTSuMR215YBW+fqXJTEBrzk3uCx7sTzQ/V8UzmmiH4bEPJO?=
 =?us-ascii?Q?WDVLHUHgiOYOviQsxky+eZ0WCCRzOtn7dhdw1Pgn2cuOiDgSb/nq0lH3+0Qp?=
 =?us-ascii?Q?v7g+CkhBPwfsbjwfjWMzwlvlsaUh02zn07fTUdsCSZKNeibOl35lTI9dH5Z7?=
 =?us-ascii?Q?e+vBb13TLuTZu9Vse/zE/bpcSIwzqIe18NSB9+9elKmoaZ0lkbyKAym6Uuak?=
 =?us-ascii?Q?jbClJjb4ooPaPnSGy28lLz5UaqRcASzPPILb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(1800799024)(366016)(376014)(7053199007)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OByIV3QUrFXbpw65QQRIZGZBU2S/afvLqx8muKNpZ51knSadIEO0NrH0xfiG?=
 =?us-ascii?Q?IXcqR3R3c2gNs85KuERPluHREEmWkUKZAPYB+mmy93XagP2z5ue1JOJroF46?=
 =?us-ascii?Q?Yo7Tjybb4gNLFnKymDDxRTBek4zicgbjSELNTa/dkPE+8XF+QbTD6UCbOdAK?=
 =?us-ascii?Q?nymsi6As1YFPl1F2Ms6P6gJ0QmUC7Hc+pa+wJSJgaeZ776LBIEGLK7vWb5BJ?=
 =?us-ascii?Q?hshk+fs2aPtryoW1cpd4ysD71OyVutKNevt2nUZRcpv3l6W2bC3R7hy4utMj?=
 =?us-ascii?Q?6sanHgiCxMTmP4AgmGRNp39Ttg3uenVNLp+LXEogqiacrUUjFUWf0PnS9icm?=
 =?us-ascii?Q?TJkGhlY01TS7qfvHUThd5CynoCqVdwfdQIPQ8l3HxoIxBzivxe5L8ZnfE3mH?=
 =?us-ascii?Q?ukVvZJEgVKdj5pdadudaFImyWVTHGHR1+rE+Cer3DdcP92K7wyN4JCt2RFll?=
 =?us-ascii?Q?wo8iRS1tbphxe9uJPgx8zZ6boxphIMU6yVesg4fHunXCQMzkVoF1AL3VJIX5?=
 =?us-ascii?Q?ACqtGY94FMFLfgYt4l9l5ytwkNd9LkHPBj2hlbKFkngRAO8cfeLO5e3+h/5e?=
 =?us-ascii?Q?ZXd0kr8E6MGD3L5S74fuixPNSjqTM7iblJTsXVNYQdFpkCZx8lTQes+Wg09n?=
 =?us-ascii?Q?Hm/9U6qq1kREYs48EDTaDzUIWlcgRuSXB0LZHXQugPxeqLL10+c5dDuDXsCB?=
 =?us-ascii?Q?4dgwxqQFqv+1a3lBte/8DL2GReu+PLKZInV1qBNIod18fAwUg6AdX0+WTt1l?=
 =?us-ascii?Q?B60fh8xmEefpw0azLY3iti8OhiYwYP2i+hQq0Ttif0l1C6hxmFOC03XRklq9?=
 =?us-ascii?Q?3RxbmGUHyf57p4NvfJ+/xu4zD/pkmNs4JdvoExwsL6LoKNG01yCJ0YMK5nwj?=
 =?us-ascii?Q?A+DtQ+Srxo6rSURW4zEsyeY6F0xIgwqi6RXIIKUVqeldEywFsEbhAlPaqxMg?=
 =?us-ascii?Q?yqN7d2a2XK6S07VRHr6YavSZvG9ucwAGlkH3RgZGP6pu1HZE8ern121ucRdx?=
 =?us-ascii?Q?GDJGGSwubsivlqjtEbPfP7Pv79BCARxmC7E97xtfM24YXDP8tyf2o/foGa9U?=
 =?us-ascii?Q?mMx7VuLvhNK2K0NzacrFrTipq4UJOxrQSlalp9um2pGgwQYmhU2p8t0SwesK?=
 =?us-ascii?Q?m2F3j3tplRJ77QTAWDfOwynrTT4iIV8DvkhYd11cjJl1mIo6uoIVZNdf5qDg?=
 =?us-ascii?Q?oJkZfRYy1IRQBZxAzxvsI5GkMTLxhR/4RNWWvC+/bDAi3nyP8m2fl7Xtb2ar?=
 =?us-ascii?Q?6b6OwvDDw29rSUX4DJ6Rrx+k2Apzt/kH6uqmjXZ+o+FnO3KuZMoDsjX/7AgD?=
 =?us-ascii?Q?C3QyyNqBXK71KOLYdjTizXbxjVJQU0SzEzBQhpHD6MeZkxJmNyJPVRcQ5vR1?=
 =?us-ascii?Q?FgqWVYMjZCXFnSTNjJCNWziwUwOtELdIGrETOE1i626V2TNjHnYwLvjEZRNl?=
 =?us-ascii?Q?0BHKNQ73OHobPtO91dFp1bx4oVsEhN6yVl//zosimHihHWGWabsRx596nSon?=
 =?us-ascii?Q?BUkrxNnvecfaznOIPg3d1Me/NisPvalsdjeZVWwS0IdOteLRI/iDB/wThT2N?=
 =?us-ascii?Q?HCrSMQyYoaF7hggC3/U=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4965bd0-0d9a-4284-da13-08de0aa40dfc
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 22:01:26.0934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lhjDnykO6tl1deaX1y6hw03dbAY8gJxFlPuhsUTwp8EivuLSotxpWTUcEye16YOtk6Arebc6+vg7VmYm2rA7TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11218
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_150136_126912_4A3AB051 
X-CRM114-Status: GOOD (  34.63  )
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

On Tue, Oct 14, 2025 at 05:09:53AM +0800, Shuhao Fu wrote:
> On Mon, Oct 13, 2025 at 04:19:00PM -0400, Frank Li wrote:
> > On Fri, Oct 10, 2025 at 02:34:08PM +0800, Shuhao Fu wrote:
> > > On Thu, Oct 09, 2025 at 12:17:11PM -0400, Frank Li wrote:
> > > > On Wed, Oct 08, 2025 at 03:27:09PM +0800, Shuhao Fu wrote:
> > > > > In `i3c_master_register`, a possible refcount inconsistency has been
> > > > > identified, causing possible resource leak.
> > > > >
> > > > > Function `of_node_get` increases the refcount of `parent->of_node`. If
> > > > > function `i3c_bus_init` fails, the function returns immediately without
> > > > > a corresponding decrease, resulting in an inconsistent refcounter.
> > > > >
> > > > > In this patch, an extra goto label is added to ensure the balance of
> > > > > refcount when `i3c_bus_init` fails.
> > > > >
> > > > > Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
> > > > > Signed-off-by: Shuhao Fu <sfual@cse.ust.hk>
> > > > > ---
> > > > >  drivers/i3c/master.c | 5 ++++-
> > > > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > > > > index d946db75d..9f4fe98d2 100644
> > > > > --- a/drivers/i3c/master.c
> > > > > +++ b/drivers/i3c/master.c
> > > > > @@ -2885,7 +2885,7 @@ int i3c_master_register(struct i3c_master_controller *master,
> > > > >
> > > > >  	ret = i3c_bus_init(i3cbus, master->dev.of_node);
> > > > >  	if (ret)
> > > > > -		return ret;
> > > > > +		goto err_put_of_node;
> > > >
> > > > I think it'd better to set release function for master dev to release
> > > > of_node because of_node_put() also missed at i3c_master_unregister()
> > > >
> > > > you can refer drivers/base/platform.c
> > > >
> > > > Frank
> > >
> > > Do you mean that we should do `of_node_release` in
> > > `platform_device_release`, instead of respecting the refcounting via
> > > `of_node_put`?
> >
> > Sorry, I checked code again.
> >
> > static void i3c_masterdev_release(struct device *dev)
> > {
> >         ...
> >         of_node_put(dev->of_node);
> > }
> >
> > i3c_master_register()
> > {
> > 	...
> > 	master->dev.release = i3c_masterdev_release;
> > 	...
> > };
> >
> > Suppose of_node_put() will be auto called when put_device(&master->dev);
> >
> > Do you really meet the problem or just static anaysis?
> >
> > Frank
>
> Honestly, it's from static analysis.
>
> My apologies for overlooking the release handle. I checked the code once
> again. It still looks suspicious as it would not call `put_device` if it
> fails. I also checked call sites related to `i3c_master_register` and
> they dont seem to do the clean-up if register fails.


@@ -2814,10 +2816,6 @@ int i3c_master_register(struct i3c_master_controller *master,
        INIT_LIST_HEAD(&master->boardinfo.i2c);
        INIT_LIST_HEAD(&master->boardinfo.i3c);

-       ret = i3c_bus_init(i3cbus, master->dev.of_node);
-       if (ret)
-               return ret;
-
        device_initialize(&master->dev);
        dev_set_name(&master->dev, "i3c-%d", i3cbus->id);

@@ -2825,6 +2823,10 @@ int i3c_master_register(struct i3c_master_controller *master,
        master->dev.coherent_dma_mask = parent->coherent_dma_mask;
        master->dev.dma_parms = parent->dma_parms;

+       ret = i3c_bus_init(i3cbus, master->dev.of_node);
+        if (ret)
+                goto err_put_dev;
+

I inject at error at i3c_bus_init(), above code can trigger i3c_masterdev_release,
which call of_node_put().

Frank

>
> Shuhao
> > >
> > > >
> > > > >
> > > > >  	device_initialize(&master->dev);
> > > > >  	dev_set_name(&master->dev, "i3c-%d", i3cbus->id);
> > > > > @@ -2973,6 +2973,9 @@ int i3c_master_register(struct i3c_master_controller *master,
> > > > >  err_put_dev:
> > > > >  	put_device(&master->dev);
> > > > >
> > > > > +err_put_of_node:
> > > > > +	of_node_put(master->dev.of_node);
> > > > > +
> > > > >  	return ret;
> > > > >  }
> > > > >  EXPORT_SYMBOL_GPL(i3c_master_register);
> > > > > --
> > > > > 2.39.5 (Apple Git-154)
> > > > >
> > > > >
> > > > > --
> > > > > linux-i3c mailing list
> > > > > linux-i3c@lists.infradead.org
> > > > > http://lists.infradead.org/mailman/listinfo/linux-i3c
> > >
> > > --
> > > linux-i3c mailing list
> > > linux-i3c@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
