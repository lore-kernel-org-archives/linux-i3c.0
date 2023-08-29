Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A6CC71153
	for <linux-i3c@archiver.kernel.org>; Tue, 29 Aug 2023 15:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7SOckNPXF7VPBo0SnyL1Xc3L65DnoQwLXl1Qq/Q3Ty4=; b=Ck2HL3UEa0qUye
	q7FKKwfZVWPM5sVyHRJFZ4XXpJSFy1Eq03aPxWUqvO0OyZ00kmLA6sRfTbiy8fcy6f55He2jVFbXP
	yqVLPloBTxJCYxkRuYLzqsg7LUJkmlNpz5nB973Onr4bMkhdx4JwATRw/2MPF3l8m0fmF3fFjlP1K
	lTrby/2IussOCOaE1ftn6i3s/tngQAEfWYb9ZqIULnt95grvnMXOPlmtkshsIx1u5q+FsUf/ODdes
	nx4X7pbH8VfsKdq+SRUiVzwj825trrDiKWx/W6TNqg+cGxBGZLVJIQDVXA2ZaIeyvqCRNhs9hzqcI
	f8AshFMUmMlzfCl1l56Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qb0cS-00BmqV-2F;
	Tue, 29 Aug 2023 15:27:04 +0000
Received: from mail-db8eur05on20613.outbound.protection.outlook.com ([2a01:111:f400:7e1a::613] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qb0cQ-00BmpK-0D
	for linux-i3c@lists.infradead.org;
	Tue, 29 Aug 2023 15:27:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CxjLwc7wgKFBwvqaqZr0V4AjN9dwyiMCXaZ7bCMuZermV+3EsfeBXJOn33BoUWDMmip7YMvl5+E+QCJmuucvlWeAlGY6TI1kXWXSHaCBtHWSBDVfsT8WcXs22wSUUnMb88T8nb1g+EEIb0t4K3tVnDq4mrM8vKFvbgXKKHlugGEh20OPBU9cVBT5tDOaUE1dx3hdT3SbTBSkBfYBqMZ78uizKAVnCmkUmpJzpxv3tPifDmCQQM2+F/+slib89o4JbfwE5ZA2YpseMslntU79/2jCnEE5xKiWR/HwaNhZoQufnfhfUoFsAMVMSY8QaJtzDSGmVkJ1BAco7Df1lwTtvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/EfGy911g+plsg+QTAf43uL204xHNxe3x+seSi4GJa8=;
 b=gbg2wtTbs48Fsx6g3wz2HIOTHkNK4vI0Ku6I1CSuUbIz+KKfC9Vw0JaJvBF9h4qdFgJ+TfqsrJ0H+D1NjQ0s9hzvIXszxsRdCKfDg7+Pxx7bFVcwjgfr3ePCC7BaM2O9ZGCLxBuzdAcJpWPVP9l0x+5Qceb0txFXcCXv1mw0B2sVL8y5IcwG6wANu5ayH8C0Cs0skqLejHOEtfLQwpGZIefjWIdhjmZPzOXvFEUWDGSBo8iHQ9nDRn5yzQjDToig5wUfjFPWqGC7fPSnm8TAzMw3Lyb5dQAcNs09/gL8tpcug7KCW0+zaVpPWaNz9xgyvXki9cjIgZ3aMmh3+Txh0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/EfGy911g+plsg+QTAf43uL204xHNxe3x+seSi4GJa8=;
 b=gbe4wvcSr50D42nNqA8Lc3lEYKrSfOGqh7r7a8hd56GNlK/yoKgWYIlRbMSDDZrQEx5rMLZzs/invZXvsWPN/MKJyQzPSJEOYpimjY0ySAHtqZq/zluef3l6ETKsX+ZjJgMEsfZDY2FLASCdSA8fkKxqEkrj7LZl8F6HGuPyoUc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by PAXPR04MB9220.eurprd04.prod.outlook.com (2603:10a6:102:228::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Tue, 29 Aug
 2023 15:26:55 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::a680:2943:82d1:6aa8]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::a680:2943:82d1:6aa8%3]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 15:26:55 +0000
Date: Tue, 29 Aug 2023 11:26:42 -0400
From: Frank Li <Frank.li@nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Conor Culhane <conor.culhane@silvaco.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"moderated list:SILVACO I3C DUAL-ROLE MASTER" <linux-i3c@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 2/2] i3c: master: svc: fix probe failure when no i3c
 device exist
Message-ID: <ZO4OMnPNCYecYImQ@lizhi-Precision-Tower-5810>
References: <20230828192502.3525418-1-Frank.Li@nxp.com>
 <20230828192502.3525418-2-Frank.Li@nxp.com>
 <20230829111611.12f91348@xps-13>
Content-Disposition: inline
In-Reply-To: <20230829111611.12f91348@xps-13>
X-ClientProxiedBy: SJ0PR03CA0183.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::8) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|PAXPR04MB9220:EE_
X-MS-Office365-Filtering-Correlation-Id: d7abd5e3-8237-4aee-d5ca-08dba8a460b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ny8mwKV7a3ZZWL5sj/+HeJWTzkZfkLt8i+q+8/m1nD3z4LGfdK2B61WEVZYG+PhFENVW/sVeEY58CPU4WL/Ti7mN7ySn3I4O7B6Ys7mFwLlC2QrUVBAWRSq6xkVXvdBVrT+PajRQZLjtNHnRZGMprk4L50go/1iOOTWr00T58QEt6ZHibjFXJXU7lfB3Ipi9HXQQTmso8CQQM8GPPKK5H4U2HBVpLEBwrwu8Cv3YOJ4ymr3paF3cnsiUFwlgYN7iOr8jbqyhyJyBLDRFwbRGNgVipCDr4eVCr0JuWYwUAMklUpEzdagYpRa9kS5I0NNEGcASbcG7vPEWb6lPfqzQ231+y1/wX7OCtAPXICDDPchyGNsYHFMP4f9W3z0vX3sMfnf5WlRhDpa3m2aDF5Lik/PZP7FpCLnel3BpfC20Tw7g6DrCCSpq66dFb24qiFGoCZwLU1rLz34DDDA4TMXF2JIIoB2iiEu4WsKoKzwU0NrKekSr6v2k7cR00mVVma15QzozNtKpY9D0nAN04ycC7itdCHtuL2koLtKq+NxjPtNlZapTPe2FnO7ko2NZ+gPquNeKT7F/jgjt8WbW6EptSc9qsEBMPjJ/6I6AglM1dekOOJx2cAT0uCp8LA84lfVGVDdXH7IxBRzXdiJsHuGDTQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(346002)(366004)(376002)(39860400002)(136003)(1800799009)(451199024)(186009)(478600001)(83380400001)(26005)(66574015)(6486002)(9686003)(52116002)(6506007)(6512007)(6666004)(2906002)(66476007)(38100700002)(6916009)(8676002)(38350700002)(4326008)(5660300002)(33716001)(316002)(41300700001)(66556008)(54906003)(8936002)(66946007)(86362001)(42413004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?o4qj0OF0W8UmIwdoLx8VYe0PIdu5aY+HxTRN3msPBGdlsYLZ/qzU31Y3J8?=
 =?iso-8859-1?Q?nNYcSrNyy8KxIw0aSpEwnlX3mQoXdz5Fv+ZgfBWeRmqLYJCDvhA/SvTy+q?=
 =?iso-8859-1?Q?YyN7x0upiBrNyGfPi0aiELn3ivc/J6obi1Xv+lfSgDjE4kCzJELy8GW2n/?=
 =?iso-8859-1?Q?xq6pWPQyPNCBeBg0hxNiX5I3V0UDAzQd0MXpr7cuMBhAKizSDZH+2kk+uL?=
 =?iso-8859-1?Q?MRbcjaI9VAdGtnZZK9fOefYLk5R1ftuJqG11ghrXxfVMUySdqarhsVi0Sh?=
 =?iso-8859-1?Q?fjJlMOuNtQVtfWD/GJoAw9jdmq0S4h1ne3QHahd0MtAR9oBsxupzVakTVV?=
 =?iso-8859-1?Q?43KxCxJXCad6sDg2N1OjbBTeTKHUE3L2GqSxX9xH6vvcHGVs4eAx0bEuLP?=
 =?iso-8859-1?Q?tDicQqJnrSx6EnNv540ytbI+A2RTgB0wFSGHo4AXx5ZkrhmDh8MXi3Rb2j?=
 =?iso-8859-1?Q?asxxFx/dNi3fBJ+LmILJ7MQ8nfFpaEF4RnIw9zYknyiCetBuTqx4+LuGIv?=
 =?iso-8859-1?Q?UjlvyytkQb3fw8eD0nyysxHbyZiBy1xdJyJno7gwUwBBKv0jYG92+yRDuv?=
 =?iso-8859-1?Q?y+bTno6sLBlIAQFs8wpBahiABdGannaGBUeaNgXaPyLYzaMens+IPXO+f7?=
 =?iso-8859-1?Q?BZ40ACpf9wAVTdwuJTcExCCCw63plagONTeOqOnZZkX3hauJnBUXr11cwz?=
 =?iso-8859-1?Q?Hjftl0AofGcHdrpRwxVrzoUKNvr1jJ9q9FHuP40PLOpjNk8n42Y/bBU6Ob?=
 =?iso-8859-1?Q?lb4CNS+/7yDEQOprFDGO+H/oUVpGwbXelo3gvZ0NcCtAog7DGLH+JMDl4g?=
 =?iso-8859-1?Q?RR9/5nQ19IFcARntyMqrOkbR6BqzmNvMJZQpu7y3guQHPNgJ/aYQqeH2eK?=
 =?iso-8859-1?Q?uC3RLcV+VVHAJ18xgh77sM5WPVdq/gfvhO3jzK1pjg7S/Ks47X1EQDhA6L?=
 =?iso-8859-1?Q?/H3ymC7FB5QewzTWji/id5MqyHh3jhNjddfGqscfmHrqJ8TG1OrElX0OYY?=
 =?iso-8859-1?Q?AvzpSjuc6/29YoebSjGdtjMWDGA+SLVuFoOcR4qJgb/qyt0r+vBAn7WUPq?=
 =?iso-8859-1?Q?4JAAu4w+EmsTiVvemDBtQ+LTQ3cCDMK0MKG2SgZUWeJVKSCH6EvYNx+B5S?=
 =?iso-8859-1?Q?GhXSRDIMU9RSElVrnMPWK29ITgKxmQTU5BsJ8ggLub90fTGKUqheKq/3YV?=
 =?iso-8859-1?Q?y/4ZIzK7gY0BtPmZuEZ3aKbAZVWy921U/vMm4cxmwuG/5Y7gGozc0s1ItA?=
 =?iso-8859-1?Q?pQLIyIXrd1sdMquZ00Y/nRjB1JfPrRjOq3ETUfWyMTI761IdBG/Dd+1Mpm?=
 =?iso-8859-1?Q?A9lanElFzYTewNbc212OYQSyom+DUEUIe7owZlCNc4slR3hrix+7zzs04X?=
 =?iso-8859-1?Q?+rveuJb6efJQwMwUFSqYawl5QrD4kSqRO9DWP4N7lEWeRbsNmi78wMB7hb?=
 =?iso-8859-1?Q?hExTVzFgaxMMk9yptmDf5Wmb/oRZbCryHhQBj33cZBjDCmrBgcxBdiK7I5?=
 =?iso-8859-1?Q?mQ5aQS8+jCBmvd2Wyf/2hUI27H8CAQtiiklpdYHgKWwhe7hT/o4xNm5PQP?=
 =?iso-8859-1?Q?8a+oVnyXSWbXQ1xQ38E3pt7t0U9ykq4NnInknNBss3wH28oUeFKkj1HBZS?=
 =?iso-8859-1?Q?KLE6+rf6LH6eBfH7VbyNADGB3stzcGhU7k?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7abd5e3-8237-4aee-d5ca-08dba8a460b2
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 15:26:55.6851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NsYy2NiGaQkS7ssJLUdd4A3iEBnjhQlF19FxzmQaHfa2eKtnpJSfPrqXOrM5UOnAVpG2rYG+DHCHCF27jRf6Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9220
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_082702_110149_664CA03F 
X-CRM114-Status: GOOD (  28.37  )
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

On Tue, Aug 29, 2023 at 11:16:11AM +0200, Miquel Raynal wrote:
> Hi Frank,
> =

> Frank.Li@nxp.com wrote on Mon, 28 Aug 2023 15:25:02 -0400:
> =

> > If there are not i3c device, all ccc command will get NACK. Set
> =

> 		no					NACKed?
> =

> > i3c_ccc_cmd::err as I3C_ERROR_M2.
> =

> This sentence should come last and be slightly more explicit.
> =

> > Return success when no i3c device found at svc_i3c_master_do_daa_locked=
().
> =

> Please explain why this is important/useful.

If return failure, driver will probe failure when there are no any i3c
devices. I3C master supposed support hot join. The probe failure don't
make sense if no i3c devices found when master driver probe.

How about rewrite commit log as

"I3C master supports device hot join, it doesn't make sense master driver
probe failure when there are no I3C devices.

When there are no I3C devices attached, all CCC commands are NACKed. So
SVC I3C master fails to probe.

Set i3c_cc_cmd:err as I3C_ERROR_M2. So I3C master framework
i3c_master_rstdaa_locked() can return expected ERROR code and continue
driver probe process.

Return success at svc_i3c_master_do_daa_locked() if no i3c devices found.
So SVC master driver can probe successfully even if no I3C devices are
attached"

> =

> > Fixes: dd3c52846d59 ("i3c: master: svc: Add Silvaco I3C master driver")
> =

> Shall we consider a backport into stable kernels?

Yes, I can add stable tag at next version.
> =

> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  drivers/i3c/master/svc-i3c-master.c | 13 +++++++++++--
> >  1 file changed, 11 insertions(+), 2 deletions(-)
> > =

> > diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/s=
vc-i3c-master.c
> > index 770b40e28015e..a5620103acb73 100644
> > --- a/drivers/i3c/master/svc-i3c-master.c
> > +++ b/drivers/i3c/master/svc-i3c-master.c
> > @@ -789,6 +789,9 @@ static int svc_i3c_master_do_daa_locked(struct svc_=
i3c_master *master,
> >  				 */
> >  				break;
> >  			} else if (SVC_I3C_MSTATUS_NACKED(reg)) {
> > +				/* No I3C devices attached */
> > +				if (dev_nb =3D=3D 0)
> > +					break;
> =

> \n ?
> =

> >  				/*
> >  				 * A slave device nacked the address, this is
> >  				 * allowed only once, DAA will be stopped and
> > @@ -1263,11 +1266,17 @@ static int svc_i3c_master_send_ccc_cmd(struct i=
3c_master_controller *m,
> >  {
> >  	struct svc_i3c_master *master =3D to_svc_i3c_master(m);
> >  	bool broadcast =3D cmd->id < 0x80;
> > +	int ret;
> >  =

> >  	if (broadcast)
> > -		return svc_i3c_master_send_bdcast_ccc_cmd(master, cmd);
> > +		ret =3D svc_i3c_master_send_bdcast_ccc_cmd(master, cmd);
> >  	else
> > -		return svc_i3c_master_send_direct_ccc_cmd(master, cmd);
> > +		ret =3D svc_i3c_master_send_direct_ccc_cmd(master, cmd);
> > +
> > +	if (ret)
> > +		cmd->err =3D I3C_ERROR_M2;
> > +
> > +	return ret;
> >  }
> >  =

> >  static int svc_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
> =

> =

> Thanks,
> Miqu=E8l

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
