Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6312ACDB474
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Oct 2023 20:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VE8l9eQBkv2Ug1jCpqv+RrTB2lilNjKxcaqOk+OL2b4=; b=qx+iVvo9RavVXU
	T4ozw69mCZ4/sB/YFcVVlefaL1KkbPNJJBXBMFkN4wBis/e95R0pIBBjvXywCy6DXHMW0/9rEK96k
	VDTMNmIHRBXinBGSz7eA6lFm+oI45W11KnaGDyZs+IoMPMkm0AKdxvRd18hTBoIx8vhlKG+K0qonI
	3LrdKhFyCAPGJhIcpbQXF8g7sv/h9tkBWoFbByr6hTC+Hvv6toiW/GlQBs9IG0DdDY3VTX8GMpw3p
	kIqNXwjXzYAm3zPq7IWpZNfm9wXs3FTJS2vOyPdawUzPUoSexRa/6eXtC5LWUnNeC16sXUs9vT0Nn
	8a9LCOOQCr9YGl1paDSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsr6d-00DG5I-2C;
	Tue, 17 Oct 2023 20:55:59 +0000
Received: from mail-db8eur05on20611.outbound.protection.outlook.com ([2a01:111:f400:7e1a::611] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsr6a-00DG3O-06
	for linux-i3c@lists.infradead.org;
	Tue, 17 Oct 2023 20:55:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=naFjdPhkgTLj3jQU9GL/PelINkzKqxmDSmHFkVK1yzWpfBJ42+E5yUFZv7TRDUkf7KNGuwixshSMIcoBVWn/S1RTbNaN6o/G0rxc/8zIkX55BaLul3NQ06rITyHvcQ2AnJ2kFGkpXjcjIPsnWQ+l7ku6YN7UplHZAzEAyMJs3SKllL/yrYtE7Tezpu2NyyVab7UngpNvv3v0ZWo9tVXKZf8xouDFjlFEgAPSkwuHbuf9OsM997pIjTvTefFUMeNKwu/gHWCv3kUF81g56yJU9TVWG71DKzEsvx0NYK0mZBYxeO6canYjSsBg59Ases6ZO+LFp0+2MJ2ehPGk5B6y+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xqtPZFBVAW5w4x3xf/vrxs2OoU7nbjTEldo2yiYLgjY=;
 b=FVEQGGoSrEL3894ez3qTqtfr0MC8mhXV3lHrC+FXIwcAw9RryJl1bN5yJBg+W55FVl1oB0VV+02kkIRiFTJncreDM/yWBIDOGKT9X46rlNgeKlgYNWFcLoQCMo/2EzGGnE4eu/JqQKF04z/+/XW5yVU4P5GjD1P2Pxvsy8siT9g7hd2hv7fwUmao5RBw/r6wVahs5H4P50Ouh10W03lCJcgNkUO+2xUruOzWrf95ntNwzinzBc+R5QMQmJnKk/a8/muObp005fptyA0Zyav/dxrEYJMzQLXdig0DeddT2m7Oy2Z9rm+2uCOW4SkeSfchU87PtniuXlgeCTITp1G6SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xqtPZFBVAW5w4x3xf/vrxs2OoU7nbjTEldo2yiYLgjY=;
 b=Jrazv7sVkfcMXS/iE44lMs228dCv3L5/x4HQOzv9tHP0aQME+3lAlVdLQEbEc2DfHWhb3Jg/r7a6UaYGHzr+iyJzAfUfRxYg3631/3onSzlNYcSCYuWKXYNz6sjk2vrjv8YiYkKkUj9TC8VFP2mO1vffImQpJct0+AcUVH5Ys20=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by AM9PR04MB8488.eurprd04.prod.outlook.com (2603:10a6:20b:41b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Tue, 17 Oct
 2023 20:55:48 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2%4]) with mapi id 15.20.6907.021; Tue, 17 Oct 2023
 20:55:48 +0000
Date: Tue, 17 Oct 2023 16:55:41 -0400
From: Frank Li <Frank.li@nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: conor.culhane@silvaco.com, alexandre.belloni@bootlin.com,
	joe@perches.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 3/6] i3c: master: svc: fix ibi may not return mandatory
 data byte
Message-ID: <ZS70zTwcGOjxB6MS@lizhi-Precision-Tower-5810>
References: <20231016153232.2851095-1-Frank.Li@nxp.com>
 <20231016153232.2851095-4-Frank.Li@nxp.com>
 <20231017162707.187bebcf@xps-13>
Content-Disposition: inline
In-Reply-To: <20231017162707.187bebcf@xps-13>
X-ClientProxiedBy: SJ0PR13CA0049.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::24) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|AM9PR04MB8488:EE_
X-MS-Office365-Filtering-Correlation-Id: 1523c1cb-54dc-4c06-e0d0-08dbcf53707f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gbN2heGux2fpid/LJWxRDZt+HAg+TN3wC2+z+zylXyA2ncFH48fxww7NCyNDvMhNCGZygy8wEoIn9bXl5PZXLu/q0GT1AoU4YjcTAPzdkHE8joC/4Y13CS0EbrzLmLB4tb9ttOrsl4gm3FzoHmeS0ayqqcv9QgGbNmslLqwkGiA6M6AP0g47KH0ZvNs9aqrkqdDaP9b8dlWR+rEixzTG2fF/JYQdPMGAjBOKkUOHrlR+AIfF8gTtXH4nPmAsbTaDgSCC8hiNBey46Wq9dvbbkkQUHrgiuHsYZ7WAQQ+XkzbhU7gUe8v1KqFjpEfREdnv7VhCW0AHcfG2LEqBL/35Hw5V35iMh+DF8EGNmmBx9G4zb7b3OkzYoxoMSjX5Cm18my1P3jji2wiU9kq9uriBofuefTF3ywEsNh1Fu5fTSM47MMqu+Amh+wcjjx7/0ko/oaomL7E0yJTaYXQEjutJx0xdD58kuGCejGTxRL55as/oF9ZS+URiHuORck+c8VnBJgX6elUdzU1XTYtAlMuPx+M2lrDDrzIydkpcxEYLJpBRvTFddynZEqD6XW7gkbg3/l3YYRscj4Z++ZiCJahgR7ldsR5fpOw98zzm2DtP82ubf6npGw2t/TPp0rd7Limn
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(136003)(376002)(366004)(39860400002)(346002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(6666004)(33716001)(38350700005)(9686003)(6506007)(52116002)(6486002)(478600001)(6512007)(6916009)(66946007)(316002)(66476007)(26005)(83380400001)(66556008)(41300700001)(38100700002)(5660300002)(4326008)(8676002)(8936002)(2906002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?EfkhRvv/kz20xjJxegxX1sS1r80WmlqFQ23NcAipckv867zkEqXy8Riydl?=
 =?iso-8859-1?Q?Doi6XWL2MvxHa3Q6osFQYBuYwGnKr5dktaF9vu/mldbIo8n6NkaehIp/V9?=
 =?iso-8859-1?Q?mKcNWx0l4imAT8MzlwuEWKmoRV905LXe4rUFewZh0xQC/VDtm1gfmj+bZw?=
 =?iso-8859-1?Q?ekPuFmM3PsXehNv6g8ylJcXHeBlDXOv3TXvA3dVzUcB0tvzN92+klqIJ8a?=
 =?iso-8859-1?Q?kpBztTTnRqWrNq9MWXjkR4TEDiGIbWo9oKTXvqDqvSUAdeR/agQADX1RCC?=
 =?iso-8859-1?Q?Czdubp644eS4rF/yA5MmexQStV7X1DdTqlTX+FJi6s5TPjHq4j+chiYXdJ?=
 =?iso-8859-1?Q?grlRErJwW5sSdD9F1dkePRSWwrlJ8gulBrLDAi2d8fXcGtMLad9HOtKF4f?=
 =?iso-8859-1?Q?U/Nn3aJR4R+FAjBn4mGL+wuwNf/eNfx54w9zHAQ4MDeyAqa6+eZXQImI1h?=
 =?iso-8859-1?Q?Y8WoA1LF/HfeKKykAUAy7kCpTQRT4+zD7XS9KR3jLtV94bPp+QFZ+CxHQ0?=
 =?iso-8859-1?Q?JzY3mX8JYdDTt1Xw9fAAMiPZ4rrCvRj92DVS44Sc1cOADM35Vzw9quHcgj?=
 =?iso-8859-1?Q?6J1cOGw2k4JWjoZE/8iUvWawqK4PjNHxp3SEzdks1yDv4mcj1BUsde8TVw?=
 =?iso-8859-1?Q?7CCM4fcyYsFeEN5hMjxi9FTT2WxT8h8UvbKpmiwItUaTUrcTK6eS5Y+qUl?=
 =?iso-8859-1?Q?UoyaJNPF4voI1ClbwyuUZRLaFMKWlSchLgpngel7NKybdCWqaKapsmFLky?=
 =?iso-8859-1?Q?xYxPej4nzGEqxPcMg/+weU4kgyPhBd00sPaSN8nUnsZqgxmw9HiNupQhWG?=
 =?iso-8859-1?Q?jr6vlWpfEq3U8lGsmZb4Af7PGyHxYOHw6EV1Ecbf+p1hXUvd7szIdeMfx6?=
 =?iso-8859-1?Q?YsgzfWEBBKR3fkKkgBytR3WIXVTER7TqXRpp2KporaDzE9y+1BliSivTAK?=
 =?iso-8859-1?Q?QgbtfXQAF4HVYZaRIr+qzLrg3LXnhDvsFE0+poT7xIoWan06l5w6qGgwpf?=
 =?iso-8859-1?Q?SoDI+OYXrRbkXmwiYZahGX6/u4Q3b5A0vzoPO5eWGQH5EOOFzJ9GhY+k/D?=
 =?iso-8859-1?Q?p6AckbyUcll0pUr0Q+thAtMOHIgjNIZXoQ+3TZlAIDb1dEm3xecVPAbSat?=
 =?iso-8859-1?Q?V2RLPiINdYrjC28FIIeEdwypnj/A071r2prR0TiqLnWJjhidPYzvye4BrO?=
 =?iso-8859-1?Q?liQnKy3wtmJpE/yLB/IR0/omzimLXC7n9lSIuvTox6XyBE0Cde8WGGZ9sN?=
 =?iso-8859-1?Q?6NycQoNy93mvKdFffoje1O4RKset2l6s/KzRP/IPtUpiMKJfOgCqNqXymV?=
 =?iso-8859-1?Q?eVBPmJANcmL6HFr6Who1kswiTVTnZ5vnBQopaUrSGK4IVAulcsEC/cj43z?=
 =?iso-8859-1?Q?U5ONQ1tPWSeynB4xOWXIiF4zK3IvBDTzK+BEB1jzp86t0mFWRLXv1dul02?=
 =?iso-8859-1?Q?5YDoeP0pdgAsElA4GyWqHEFxS2okudeGLy4tnCQ8iECHxWoi+mwKaTp8J+?=
 =?iso-8859-1?Q?Ysy26lUHoK9Yf06F2WHWhCwETceR3KQpRLEsl3/DilDBeqV4qM5groskq+?=
 =?iso-8859-1?Q?/TOfR9fABKKZubN0QEt9r7efDa02MnRdoZRewC6mgg1b58cZWY9MITyeBN?=
 =?iso-8859-1?Q?bewAJqb9ga/0tQC/N8CYB/vEO50bE3ipbf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1523c1cb-54dc-4c06-e0d0-08dbcf53707f
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 20:55:48.0622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QS2pILYuPmOKgjoIH/+TDyITNhW5EWw2tjU5b/zFwFG2GwJCeyGwo9T01ze++kIYXY3Vy2ZDclpSZTZee1EbWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8488
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_135556_072369_9E4810BF 
X-CRM114-Status: GOOD (  24.85  )
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

On Tue, Oct 17, 2023 at 04:27:07PM +0200, Miquel Raynal wrote:
> Hi Frank,
> =

> Frank.Li@nxp.com wrote on Mon, 16 Oct 2023 11:32:29 -0400:
> =

> > MSTATUS[RXPEND] is only updated after the data transfer cycle started. =
This
> > creates an issue when the I3C clock is slow, and the CPU is running fast
> > enough that MSTATUS[RXPEND] may not be updated when the code reach chec=
king
> > point. As a result, mandatory data are being missed.
> =

> 					can be missed.
> =

> > Add a wait for MSTATUS[COMPLETE] to ensure that all mandatory data alre=
ady
> > in FIFO.
> =

> is already in the FIFO
> =

> > =

> > Fixes: dd3c52846d59 ("i3c: master: svc: Add Silvaco I3C master driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  drivers/i3c/master/svc-i3c-master.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > =

> > diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/s=
vc-i3c-master.c
> > index 0f57a5f75e39..c252446b2bc5 100644
> > --- a/drivers/i3c/master/svc-i3c-master.c
> > +++ b/drivers/i3c/master/svc-i3c-master.c
> > @@ -331,6 +331,7 @@ static int svc_i3c_master_handle_ibi(struct svc_i3c=
_master *master,
> >  	struct i3c_ibi_slot *slot;
> >  	unsigned int count;
> >  	u32 mdatactrl;
> > +	int ret, val;
> >  	u8 *buf;
> >  =

> >  	slot =3D i3c_generic_ibi_get_free_slot(data->ibi_pool);
> > @@ -340,6 +341,13 @@ static int svc_i3c_master_handle_ibi(struct svc_i3=
c_master *master,
> >  	slot->len =3D 0;
> >  	buf =3D slot->data;
> >  =

> > +	ret =3D readl_relaxed_poll_timeout(master->regs + SVC_I3C_MSTATUS, va=
l,
> > +						SVC_I3C_MSTATUS_COMPLETE(val), 0, 1000);
> =

> Are you sure !MSTATUS_COMPLETE(val) is never a valid condition?
> Especially with non-mandatory bytes?
> =

> Also, are you sure of the indentation here?

If no-mandatory data, it is equal RDTERAM is 0. It takes some times to
change my slave code to create such test case.

Frank Li

> =

> > +	if (ret) {
> > +		dev_err(master->dev, "Timeout when polling for COMPLETE\n");
> > +		return ret;
> > +	}
> > +
> >  	while (SVC_I3C_MSTATUS_RXPEND(readl(master->regs + SVC_I3C_MSTATUS)) =
 &&
> >  	       slot->len < SVC_I3C_FIFO_SIZE) {
> >  		mdatactrl =3D readl(master->regs + SVC_I3C_MDATACTRL);
> =

> =

> Thanks,
> Miqu=E8l

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
