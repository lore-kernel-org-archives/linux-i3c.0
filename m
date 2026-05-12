Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF688CD4F24
	for <linux-i3c@archiver.kernel.org>; Tue, 12 May 2026 16:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dUaMzGEG2kdOK6ogNLvdmyUPgn1bkgDfsnlLHzDIZiY=; b=4+gUYotBV8UjXS
	5giPu0OF4Zwtt5jGZ+m1V9jOUBko8NaYQtqJQNwlh0Arl0uq7S3rnAlYODNCITllTd/OcsMY3jtQw
	qP8rzWAbXym9FL/AfttTZvo96vN3DHKHp4C/+BAnzWrUM2xvoNZomY4D6YxPrbIZ9/GHl4MAphUIQ
	QGZt8ScwEEreag5vzdG80UxGpfI84Fjo/fbARFidndOHUyPmO1HQaVfOuDncsEVp06h5+ghpLkCpX
	5w4asmbOlk9DJUiDeDRacmoqnYrWcUNDPEbNChCRft5z180AspprR18ZmbtvCXafKSJzmYaYEl1Z0
	3StYOyvSwx7qJJOkPI6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMq1A-0000000HN8q-2SpH;
	Tue, 12 May 2026 16:31:37 +0000
Received: from mail-northeuropeazon11010043.outbound.protection.outlook.com ([52.101.84.43] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMq17-0000000HN7P-2kIR
	for linux-i3c@lists.infradead.org;
	Tue, 12 May 2026 16:31:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xSz3+nwKxlud1cMEV5LTVEZx6RygwFsfmxxjYiE+THTOzD/QNyurXGSOA751VnovXf9mvNl97fNDFodbaHmrcALIwB+zZYwsCOKs+0TzoImRTMNWhLwsvZt5TqP44rVLMPfLTFNhao7prcPpLzoQ3KZ4dR/vhGLLeFFlL7SfW6Mpzq6Z3W/PE+FbWLIwToL37cERsCdu8f5SFOPW0Rag5WManiFWK6u0tfKzmGT0Fv7xHWTTATd4MSIzWwLxd5KwF5tl0worVxCvtUsz9cqGZEMG9z0bwdUHDurwZAxBnrEBfvXXSXyvXr+PSAuiAmr61QcxVZUHitJieKg8KXIG0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kN3OctMBxwuA6bB7AexLmH5QiQpW6Cns8hjbTQIf56Y=;
 b=coO+pte81ViosV9bxcxJjXj/ZMRpGk0/zRkAAFy5Aeqtt1nUoVRGSrA/TkkUzU7y13i9pZAb0A2RPIa6FcF4ID2udlRtPrMBWEdnGcI2OdKEFgmyflScKjgAhisGIBPqjwSFa7aVTDuuEH+JnAlP4GWE0cyBQJ4BnHHzsBOWtz9H1xcKgcWT4NG8v1ytmlXM6XS0ucZmxZFfJlQN2NYI2U2NK+jj/IbdoSs6gKkTKwEPeNbr51XaIx2wsbpyM0WjheTHd9xSHVzoM9xHEs0ISvaX3qGU0GCkm/pOvtjrYOgFXi5nSbKqyohTFbVrxhaW7lz2KWqDmrTwO6WBQjGGxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kN3OctMBxwuA6bB7AexLmH5QiQpW6Cns8hjbTQIf56Y=;
 b=ZD6fKieWNWtgdXhQZdjlzZfAP3nMJITfH7139xY0nDh9Vh/7CGg+252IzCjVK3Qt7TcfOyASz7ANQpYydKeG1gztT0lmPdeE2BGDbATzkI5/dcLFZpptzmugvXUk7nYb0wRPXFgGCYX/i5tChHdODz7NnScIcqMvoAwRpZ488HILtfoOU7x8hgHR1dp8YTBWKTIr8xZ+augqMG1BK5HWTS4g3kXI8dEn6nO5iB0eN3y7U5Owr2KNfyzojG8yXRnq9thH2ugKCeKULAAIwHgO9Bpo+TU1tejddE7WesyDu6NIXOGwJzbj34S6boYD7ZyXxs7yqhzkGDh1e16PUOjeHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DBBPR04MB7562.eurprd04.prod.outlook.com (2603:10a6:10:1f6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 16:31:29 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 16:31:29 +0000
Date: Tue, 12 May 2026 12:31:23 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/8] i3c: master: Export i3c_master_enec_disec_locked()
Message-ID: <agNV24RoAugbDU2m@lizhi-Precision-Tower-5810>
References: <20260512121732.406009-1-adrian.hunter@intel.com>
 <20260512121732.406009-8-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260512121732.406009-8-adrian.hunter@intel.com>
X-ClientProxiedBy: SA1PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::7) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DBBPR04MB7562:EE_
X-MS-Office365-Filtering-Correlation-Id: abbcf50c-71cd-436e-cccf-08deb043eb45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|366016|1800799024|19092799006|22082099003|18002099003|38350700014|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info: Q/n4JBzGwWlLGs7IeKMicKxudk53+YWLtF7O1heyHyuDdiKvbEBhJO9XWqHB/e1fJtC3RsqNrpivDoY6UsAwXrZJPA6PdJlcGpZbzs9pOyM+0ZWvb7NzOKWrtLgo8530aW3JZYLZBQvxyL2PE4YEi/mgG8h9JuBAN1L4wPDx2anYS1xbzJhG92fHjgjLxnF5u32yGFsfJzn9YUZbG0+61o4FhOQake26UOwMSirJT3aDwLY+nYFPxC9IGknPY6pZFjU9/n0PRJfFcpVMem2u0TpOOU9Lm18fbOcWBmyrnRZbs32X6xo/lUKhpIFWhC/1kIZiGyb33jQEDjFDx79krgfyVv78ee0at1DOF7c25benp1qC2YrQqxOH2AaL3iSwJDlekl9pUkJsBTzU0IPZNOmuspwcGN3XbVGGWBkBQVZpCmy3ORj/q2oJTtUrMW5kRS0ev1Uf0K/Pp0EbiojOc05Fw34roUFpO7YEfdXgnq0rxtEx6+6Yit3Sda+/0QM/bPY6Hwo6bXfJkD9xfufoXfAMBxgDnoo2MRiLeOm4PitZF1kGKnsVrO0qL+0oBMXDUYQM2syftEtrk/4MhpyqNCxjhOyH015E0BvF711nYG3JA1/peUi3NMb7a3TiQE1UQwfL8UTfXqjiK/uMDwkj2nUyY5sRHoSGIkjvBqun/OE1lDIPqT6Yub26KWOvkarFs91wZwPFxONMGKOFzexujs3FcMt077tY3C4i0CZf/Ej2fkJgD1e3Jps2Pqoozpfj
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(19092799006)(22082099003)(18002099003)(38350700014)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vea3avEcd6rI4Qtnv5pJz63RIgfej3qFVNLSWSu+m8d/udB5eGXUaqV9IWZ/?=
 =?us-ascii?Q?MZK+42drm+40o5DYco2V23l4sxPkznqSPgWEDJNdfvnXKA+beaxEtQMyX5ex?=
 =?us-ascii?Q?407GjNoVv+Or0gpV2v9DZKYjAi3NSOd7Cfx+7X5eH8vvrbzW3PQ17wbXU/fa?=
 =?us-ascii?Q?gBgR8DM53xRNUfp0jrpH+uT5Ebor8+m9wf148cWgaKarhYbVBUiowHxBZt/Z?=
 =?us-ascii?Q?13Xj87iV4nY8ze7/oPVIbycjTHFXOMGaPRnMAvh3qI5FsFjbths+YAw3VS7J?=
 =?us-ascii?Q?tfbnXqOVvYlbqoHeZnS8g7M/fhGFSjBuJc1XlJQnhgP5ky3OVKP3s+FuNzij?=
 =?us-ascii?Q?7ND9/1jy+50ejHHTaD1GbguJrsEgTz3/1Q0VD5sJVdVHwmI4Xr+scB7oL/ri?=
 =?us-ascii?Q?nSVn/YJm7eVKMKuz1C4RFj7QsrWPSpYqFSbDULAtR8K73+fs1cpd3EsjcwBq?=
 =?us-ascii?Q?IWkDzXyLZjaA+pAuoq4leDx2R7NN/ZAqn7ABt9u78jrAbfYgiphm0Dy7iHKj?=
 =?us-ascii?Q?/+7G/LWzfvQaqI1pvujB91iouhoI+a3BNqQdQzFMc8oJiyn3oQUcLXm60TZW?=
 =?us-ascii?Q?K+KFIXPfl6vDe46jHHcpXCGit6QevabOlNxV7TMwZk17JMd870HYQdLHm3dc?=
 =?us-ascii?Q?Z47LmlwAGCzMoM8ICadEnv3W/JfLd/mdtKa+J+60kYXacq7fBkuSc/BxTzIo?=
 =?us-ascii?Q?dVYTGIe8EkG8Yky7m9yvwhjH+5ROdDIFDbMAq/kTdI/0cGu611D4eP966UGG?=
 =?us-ascii?Q?IEZAWbto9gBtgSQYwuOzoQiTwdmpMfoUkVBTx3TmiLlnIG/EqTfbffTagyEV?=
 =?us-ascii?Q?7+B1/HMexkqJcUOQ+BoIZqzCCy7XTW2GPDQdxd/Z3JcROX1ifw7mH9X6BA8+?=
 =?us-ascii?Q?e6D39oqv6TplL2M5+RHjGG5FG0ju2lFPfBwvtr2wa365kD063L/yVFi25TqE?=
 =?us-ascii?Q?HCsk6RiceEewLNDFxVtT0clkh87krvRixi0cMfOCNnQkRWxwizx6e509FtEo?=
 =?us-ascii?Q?U2rybAhsgXHNHegNsfbAyLc06/1SjhE+FwJk1HWs9nGKDxHw86n8iosGW8g2?=
 =?us-ascii?Q?f1pGe/qPbWTK98a3c8NaqG9iwic2GnAq0+iaK94usEN2s2k/frAM98bg5KRh?=
 =?us-ascii?Q?HD6hV8TjbVbNNAIq0NxU3jUja0xr9a9HzPSw5slfQFnZU48o7K/iOR2zjomZ?=
 =?us-ascii?Q?PV4eeS2zJurBGn3nutrjmf06fmD2TMDXtsudPzjUSZBIUGSUpB5eqzOOQV3L?=
 =?us-ascii?Q?jwcn2YHOYg2BPsMqT6MqRukv472RDuSjcMaCcLwywE+P8ruoPGDCMJKwKQFT?=
 =?us-ascii?Q?rixljfH10RgXhC5qGIHhhhbAGOcn5SJuT79kB9IagSn3Qll22Z7fx3qUp++D?=
 =?us-ascii?Q?A30myAByPrOggQfDT2S7GiyBdcR+zvlk6m0wUt+b8+gEnpCwyOo5WHiyHwi2?=
 =?us-ascii?Q?LqvArdxULZ0P8QWcIp1xpPyrcjJ5vlDrz2l8Y3DvlAFjr4xCdZN6HhVCBJHi?=
 =?us-ascii?Q?WflipsOIw9K0QQS2PxcgfAWNT3xU934se8dSd77jenWfv8QEvPP9vW6NNsun?=
 =?us-ascii?Q?ta0MQItiuDSVt5kKBVW6o5g0AA/z6tqCVWvd+QmIitotTwsLw9lD5wNi/R6i?=
 =?us-ascii?Q?0Wc2KKKDqEHp5S6VFcTZnoBqUNyHsz46BUcdXbURRLlIZ5UnBGzxC2i+3g8s?=
 =?us-ascii?Q?X57Hkatku/ZrQ0rGl5eXnRvdORHGg3bxUkY6f/zy3urqv/D1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abbcf50c-71cd-436e-cccf-08deb043eb45
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 16:31:29.2033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Xs9yPCnlctpqw9yhvQ3u2JJVl/UEI7ZirltcrcB3gbaVarBf/yqk2u9U6QdsCl1tnwQZY7tyOmf76v++mbRsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7562
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_093133_701889_F8B22C92 
X-CRM114-Status: GOOD (  26.81  )
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

On Tue, May 12, 2026 at 03:17:31PM +0300, Adrian Hunter wrote:
> The existing i3c_master_enec_locked() wrapper always treats a NACKed
> ENEC CCC as a failure (M2 error).  However, broadcasting ENEC to enable
> Hot-Join is legitimately useful even when no I3C devices are currently
> present on the bus, in which case the broadcast will be NACKed and
> should not be reported as an error.
>
> The underlying helper i3c_master_enec_disec_locked() already accepts a
> suppress_m2 flag that lets callers ignore such NACKs.  Expose it so that
> a subsequent patch enabling Hot-Join events can issue ENEC with M2
> suppression.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master.c       | 27 ++++++++++++++++++++++++---
>  include/linux/i3c/master.h |  2 ++
>  2 files changed, 26 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 1eb157c8091d..db46cc12c7db 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1121,9 +1121,29 @@ int i3c_master_entdaa_locked(struct i3c_master_controller *master)
>  }
>  EXPORT_SYMBOL_GPL(i3c_master_entdaa_locked);
>
> -static int i3c_master_enec_disec_locked(struct i3c_master_controller *master,
> -					u8 addr, bool enable, u8 evts,
> -					bool suppress_m2)
> +/**
> + * i3c_master_enec_disec_locked() - send an ENEC or DISEC CCC command
> + * @master: master used to send frames on the bus
> + * @addr: a valid I3C slave address or %I3C_BROADCAST_ADDR
> + * @enable: true to send ENEC, false to send DISEC
> + * @evts: events to enable or disable
> + * @suppress_m2: if true, treat an M2 (NACK) error from the CCC as success
> + *
> + * Send an ENEC or DISEC CCC command to enable or disable some or all events
> + * coming from a specific slave, or all devices if @addr is
> + * %I3C_BROADCAST_ADDR.
> + *
> + * When @suppress_m2 is true, a NACK of the broadcast (which can happen when
> + * no devices are present on the bus) is not reported as an error. This is
> + * useful for callers that want to configure event reporting unconditionally,
> + * regardless of whether any devices are currently on the bus.
> + *
> + * This function must be called with the bus lock held in write mode.
> + *
> + * Return: 0 in case of success, or a negative error code otherwise.
> + */
> +int i3c_master_enec_disec_locked(struct i3c_master_controller *master, u8 addr,
> +				 bool enable, u8 evts, bool suppress_m2)
>  {
>  	struct i3c_ccc_events *events;
>  	struct i3c_ccc_cmd_dest dest;
> @@ -1148,6 +1168,7 @@ static int i3c_master_enec_disec_locked(struct i3c_master_controller *master,
>
>  	return ret;
>  }
> +EXPORT_SYMBOL_GPL(i3c_master_enec_disec_locked);
>
>  /**
>   * i3c_master_disec_locked() - send a DISEC CCC command
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index 8cdd7be505d3..e2c831fb5354 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -607,6 +607,8 @@ int i3c_master_disec_locked(struct i3c_master_controller *master, u8 addr,
>  			    u8 evts);
>  int i3c_master_enec_locked(struct i3c_master_controller *master, u8 addr,
>  			   u8 evts);
> +int i3c_master_enec_disec_locked(struct i3c_master_controller *master, u8 addr,
> +				 bool enable, u8 evts, bool suppress_m2);
>  int i3c_master_entdaa_locked(struct i3c_master_controller *master);
>  int i3c_master_defslvs_locked(struct i3c_master_controller *master);
>
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
