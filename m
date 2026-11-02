Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A573F606EE99
	for <linux-i3c@archiver.kernel.org>; Mon,  2 Nov 2026 21:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zKEqk5gF;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=pVptDHEy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZMQc6RDZIr0SkVt5lufq6r34naZ25wZRe0KUalFDYlE=; b=zKEqk5gF3CkirYwpsTX7XMyH2W
	h1Ryq7hyln7xtuvayFnaDFG0EgC8lQnMDzMJwZUmJbxiJNhAOxIBxXAdsGNrALzkBbk/5jBZ8epqq
	KFHZouWUmnLxkISjjltUE4S8zP9ba7fgkKTOH0aN3bJfhwLWijyR2TSKWBN85dwCaHMoSbq3pI7FD
	K57O1tOF6u0exY6D0A2CtWklD0ZBXZ53rtEaQSw6FQzce0nRf5EG3ptN+yuQh9m/bQJ56UhmJVb9n
	ls6foViTBZpBgJvspPghsgLTzpw/OZUFoBwsFwl8V4Wdr4wbsL2PoMS0dCSGxVVRqtzTHNQTOqwld
	pFMWBUOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNziP-00000000UbG-1jGo;
	Mon, 02 Nov 2026 21:37:17 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNziN-00000000Uai-0xaH
	for linux-i3c@lists.infradead.org;
	Mon, 02 Nov 2026 21:37:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sDBYkZq7EbxGPiPetzFh4xb0uqhE9YO8C1VvJzri1Yqt0xNWn74Kh00Tgevmesep15xSA7TdABFSOi4v+bcCAouNOZesrFaSsqf+9iJwmmbdSYogOehBC6/0ueCQd8MxgMu/jY/juj48NEUGmkapvqsp4E/NqcbCSGy4g75nzy3GHkH1X1MyPYJ3bBKcLW+hWG5VFglglLphUueNzhbcMPIJdpvw9IS45IGL1km1iMme9To3HXevV8M5JxBbpitHRNUBvx9YC/kETD1uuuQNhpLW3kRpPTS2R5MshJxqjGfjZgOSA0MWtUHNJ1yng3x84PwXs/y48SJa1tD2SP8pWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qeKBGWOyaRTRQEhEarWaXB9aD7rkACG4OWZ8QZoljVM=;
 b=qpOgP6Tf82sdVN8OFTLKuU5w16bh/av740AMN+NM0OvgTBH57uoImCG6YLDg99EdWY2P330Wg3G6dnGfqbhQng4mOEH+2uEH5wDmskPjJQY7ot8/KVlb2gcmEgqlsI43Gyr7Jkv16Cw9EQh9ZkDucJOs38PXYO+QhhXokt/7eBufxwu12Xy+kPpqvZFv08CesjP+Fhc1Gh2+BL1XFLoXDsQcuAgQvGaLNct+AMAE4fp9cDrXQqLHnEkHGTX6GfHF4eyloBcQEAQTfOigMh8i6QDtXnk7FUrtYn5DY9qdYKqExWkETU/z/YtfxfeYnrIErR+NTvUGypmXvEAwcVDJlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qeKBGWOyaRTRQEhEarWaXB9aD7rkACG4OWZ8QZoljVM=;
 b=pVptDHEyL9/+KetwOlhFpm9IIv2IiRFduw+ITirLcvpZKuSdZIFemTH5zUAxxUnLJoXDp8ytlSbMmq2rhIMC/kNOxhDeKCxVElBos2DSdR3U6EHbrL2ZQOvnj2TADFqdvoY/vfKpeBUu/LL+7sUezIgQOr+SEro8biYnYwn0m7ejWEx/NcEYFUhtg6f5ZhjGQI5Efbhl1v8Mvpu8OSD62W8X1hiYdi8uk+dgwlQADL4bwG3S8hx9arLp1s61eW5yz2zTMiHPZ94yqEHAiJ/0HLsSArJBvcO0+5yv+eE2YP/AXsnfTGK4xqoJLDI7XKr/pQOAZAt2pAuOaV4nb0YH8w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM9PR04MB8555.eurprd04.prod.outlook.com (2603:10a6:20b:436::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 21:37:10 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 21:37:10 +0000
Date: Mon, 2 Nov 2026 16:37:03 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Dineshkumar Parameswaran <Dineshkumar.Parameswaran@synopsys.com>
Cc: Frank.Li@nxp.com, alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i3c: master: dw-i3c-master: Add HDR-DDR support to
 Designware Controller.
Message-ID: <aukCf1reB8LWbuzq@lizhi-Precision-Tower-5810>
References: <20261013073126.5948-1-parame@synopsys.com>
 <20261101005243.4739-1-parame@synopsys.com>
Content-Disposition: inline
In-Reply-To: <20261101005243.4739-1-parame@synopsys.com>
X-ClientProxiedBy: PH8PR21CA0005.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::21) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM9PR04MB8555:EE_
X-MS-Office365-Filtering-Correlation-Id: c2ac96d4-fc5e-4a59-f8ec-08df39297354
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|19092799006|376014|366016|1800799024|261021123027099003|261026121527099003|261021121427099003|10067099003|4143699003|11063799006|261009220027099003|261009223327099003|261009223027099003|261009221227099003|261009221727099003|3023799007|6133799003|261102123227099003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: M/QQ7ywNOF9p6K8NeeE/CryVvIOVQyv92VWz0Db6vnWoddxA75kdAfzqMWTx0kYuH2ajRxjrDZoNHD7HQZyZ2sw2m8a7PeSmWjgzNIE4wRIKk2V61J9a3aBsP6c0uDGzAAJq1ahkUfeHQcvXnJhDbqdG/AUZqufWEstQqI12Z2oJBtqU2aNrCYaP1Q+aTGvsfa5Axl6MIVE6eHC+0xMdO1aJLap2PgPiSXIfrBuFT54/xCckgG3tzMrj0ZClfuyKRbpCIbNyGF657Avy7NQ8dTOfuqS++Fu71W7mGTqBrPQQlP0xkrZksSlb4eRER2H15lGGM9So/qtAyCdi0TaXS8EbozSGfn0pvn4KnbR8HxASvGJy4W0hrw4O50s8nw+fkCrJOmbDScTJNn+BlouyYqy1Xy8RtLCil6xtcfJtyieGi7khV1YpySmrbjZ4jAA1NTFfzkL9UWFHct8f325py/vEr4ZMWzw1aTgU+94h0iUOTMxTxhqiABTKlpeKYlaSlP15p1SXb397oSHkkqoA3qeLD9krtdiq+9jS8YEKBnNQV5Vji2JwkJsuWRF5ou+Y3nV1cXdBrY9MGYcxuAhWbTx94tZCqfBZR8xQ979T+YmjwlPBClintQolwceL8hh7UiMzEqWnsmrYxQWEKsoaV2sjaxeYzfGkcm8iyUHswuo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(376014)(366016)(1800799024)(261021123027099003)(261026121527099003)(261021121427099003)(10067099003)(4143699003)(11063799006)(261009220027099003)(261009223327099003)(261009223027099003)(261009221227099003)(261009221727099003)(3023799007)(6133799003)(261102123227099003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ttoY/sZ8NHrv6kEV8uHddhMDmrW23566twvP1/DAqe9lsoniJk2Fk/T2dZGr?=
 =?us-ascii?Q?qPMoFQcEg4ea6oT297xhT9Rx5jWtQvl2pplmBwkmxGxjdEdp7ioKgLIYro5S?=
 =?us-ascii?Q?6qnpFxtLYVtjnPDMBS7SRGj6D9Pa81X+IasBe/NuPRrT65UbuVz6vwKxlHKg?=
 =?us-ascii?Q?BdE8s7w49C/ltQmlEhbgxDUAcz1SLKBJeVW0xOIu83EYeh10bP1jiRL5/GPZ?=
 =?us-ascii?Q?mHIvGffu8USowJWluL/+ZQ64fwP4GQCIlpiWaEC41hNvxjN4HttWyDVxW5X8?=
 =?us-ascii?Q?2axe9ezl44MBz8SPzR12VRT4xRgVGkihNQpnDUEZ4PD7XSTMTmETZsKpM5Dt?=
 =?us-ascii?Q?kS+gH7cke/vHMpTakJc9S/K5uu3l0oddFzJLBn1qpwQAsNvTy2cWk2VthhD0?=
 =?us-ascii?Q?iLqNSWRM4dR5hzSRi6oj58Ka1uL+PUN4TN/0PRItT39GB0x0lFrJb2/bjnEm?=
 =?us-ascii?Q?RyPlOuzBZ6i9mcyNYfxg0pPg++H5Ir8sGJDapw5QAs1u4On0pkuIprGs5/Vi?=
 =?us-ascii?Q?g4bGjPdCvlXBQ7OlVFjNzpu5wkbsB/zppaCPohWg1IPcnljmTcXrqCYX0REf?=
 =?us-ascii?Q?hIsNsklRGf1Dp70xvZttEcsL2Lq6NDts/3D9n3VflKa/GnH5iO36VS0HvUKq?=
 =?us-ascii?Q?I84dV1nNRzdLdnOAWesqejcGI7TcXoJibhNUaZMdE9I0Ds/IrxLwya2sFhUW?=
 =?us-ascii?Q?9Sd3pONXbIwNZ0w33Ahvb1raJlouREo7zJHKwqaigRegdfbMrDgUuS5t/dGc?=
 =?us-ascii?Q?96rCfM5hokgYbVpcVYKZlYetH9PPNfa51wsIx5QEqdpHRH5VEl8hKkQHxmcb?=
 =?us-ascii?Q?ieEAvgJJYfWRrdsqeQkGRBAM7vXEecopDI14qpG258ppSUZemmVsY/P2k74u?=
 =?us-ascii?Q?O8TrXxy4In1CPgRJsNZljIGsSsP3DjlDnE6jnyRoLp3eeaJ+rHDCR+ij+VUN?=
 =?us-ascii?Q?mQ34eM0TZBqVSIejcRhqoUpts4P1NA2yKUBwGO+99MRsoMLN0RVowfJpybEj?=
 =?us-ascii?Q?rfYqhKCNrwkDRdoAZBPOHxyj81GA8cJg7DzvPbZDn7bOYlzw5NX13/QOEXRy?=
 =?us-ascii?Q?PElS9LdPm/yriCSVu2QfTPvmpsk/6KisH0Gl6AvEoppHjH50FafNtSZN71+d?=
 =?us-ascii?Q?8f5Bz7tQvduq6rhP0Ov+T3N7EDWec9FPfcQUFJpxk/r3ApSrgbvqNZNNZJZn?=
 =?us-ascii?Q?r9yt0mdWX7nO2SX6bHOB+JdPRuqmfCwLvhb2av8sLIO43WBNofoOSmEqlxbS?=
 =?us-ascii?Q?oqNZ0FAetqoNuXbrED1ysQEsvgs06hpNymiSoNwyreiTlq5Z4l6oQwhhvZEr?=
 =?us-ascii?Q?6X+BNh9wvdMmDE2+zqIx5IHsUMjuUm2VMfV1arGqBtD4Ncd5mlNnqWs5OKgb?=
 =?us-ascii?Q?MdEnSht0nTyLOCKfoG1SMGnJ71R5hMZNry4w53BGYUx7B/UdaIgNUMer9A9/?=
 =?us-ascii?Q?o+DoMd8HXDkcPfz2RW2ACn94r0JBBUHjTrW6zPVZsbwxQmHernruiz+3Y45F?=
 =?us-ascii?Q?pUJ55q7fhEbaxG2hehGn4db6OQ4IydfYPojzpXB9HU6pXWWCFvf9FSRbPJWg?=
 =?us-ascii?Q?//sLFRJGwn0kFx0MJ/5sbi8BfQDOkwpFzQs+wMk+UYXsH6bvawOXXCBYivXJ?=
 =?us-ascii?Q?3OI3KF03wg0Iaq9ndK4t7powf7+miMm65FHG6PvuHfX7QQJSucai+UEzO2BE?=
 =?us-ascii?Q?/ef+reB1hGAKlpdxJxn30NzMFl8WVOeiqkeIEn9auzED+L/azKY21jwzAV00?=
 =?us-ascii?Q?4DdSU6anjCKlvuHZqM8XO07iG0tOifgtj1RccMOhaKJwNAvGkHwR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2ac96d4-fc5e-4a59-f8ec-08df39297354
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 21:37:10.2058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PYq8hIW3Y7+hB4T4o83zBdjPuRd/DwspXKjx3kLEvps2afyhSPB08R9tWYv6Lr9kVRCPUY4SGUlzzfyBzL++a4/nYS0rcByFMQXDjRNYnWzh8QLIK8irk0gcA15krfwj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8555
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_133715_274178_76D77E6F 
X-CRM114-Status: GOOD (  20.56  )
X-Spam-Score: 0.0 (/)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 01, 2026 at 06:22:43AM +0530, Dineshkumar Parameswaran wrote:
> Implement HDR-DDR transfer support for the DesignWare Controller.
> Only support for private transfers and does not support sending CCC
> commands in HDR mode.
>
> Key differences:
> - Sends ENTHDR CCC for entering to HDR-DDR mode before sending data.
> To do that we are setting the ENTHDR in controller cmd. Sets the speed

Send ENTHDR CCC before sending data by setting the ENTHDR in controller cmd.

> to HDR_DDR_SPEED(6) to do data transfer in HDR-DDR mode.
> - HDR exit pattern must be sent instead of send a stop after transfer
> completion.

Send HDR exit pattern instead of STOP after transfer completion.

>
> Signed-off-by: Dineshkumar Parameswaran <parame@synopsys.com>
>
> ---

Do NOT post new version at old thread, which will cause patchwork and other
tools.

> changes in v2:
> - Add HDR-DDR capability advertisement in dw_i3c_master_bus_init()
> - ENTHDR0 CCC is generated by the hardware. No need to put that in the
>   command.
> - Fix the speed field corruption in COMMAND_PORT_SPEED.
>
>  drivers/i3c/master/dw-i3c-master.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 05584ddaf104..149982a05477 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -232,6 +232,8 @@
>  #define I3C_BUS_I2C_FMP_TLOW_MIN_NS	500
>  #define I3C_BUS_THIGH_MAX_NS		41
>
> +#define DW_I3C_HDR_DDR_SPEED	6
> +
>  #define XFER_TIMEOUT (msecs_to_jiffies(1000))
>  #define RPM_AUTOSUSPEND_TIMEOUT 1000 /* ms */
>
> @@ -726,6 +728,8 @@ static int dw_i3c_master_bus_init(struct i3c_master_controller *m)
>  	memset(&info, 0, sizeof(info));
>  	info.dyn_addr = ret;
>
> +	info.hdr_cap = I3C_CCC_HDR_MODE(I3C_HDR_DDR);
> +
>  	ret = i3c_master_set_info(&master->base, &info);
>  	if (ret)
>  		goto rpm_out;
> @@ -1003,20 +1007,25 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
>  		if (i3c_xfers[i].rnw) {

At HDR mode, rnw is u8 command, bit 7 indicate read or write. And where
you send cmd?

Frank

>  			cmd->rx_buf = i3c_xfers[i].data.in;
>  			cmd->rx_len = i3c_xfers[i].len;
> -			cmd->cmd_lo = COMMAND_PORT_READ_TRANSFER |
> -				      COMMAND_PORT_SPEED(dev->info.max_read_ds);
> +			cmd->cmd_lo = COMMAND_PORT_READ_TRANSFER;
>
>  		} else {
>  			cmd->tx_buf = i3c_xfers[i].data.out;
>  			cmd->tx_len = i3c_xfers[i].len;
> -			cmd->cmd_lo =
> -				COMMAND_PORT_SPEED(dev->info.max_write_ds);
>  		}
>
>  		cmd->cmd_lo |= COMMAND_PORT_TID(i) |
>  			       COMMAND_PORT_DEV_INDEX(data->index) |
>  			       COMMAND_PORT_ROC;
>
> +		if (mode == I3C_HDR_DDR)
> +			cmd->cmd_lo |= COMMAND_PORT_CP |
> +				COMMAND_PORT_SPEED(DW_I3C_HDR_DDR_SPEED);
> +		else
> +			cmd->cmd_lo |= (i3c_xfers[i].rnw) ?
> +				COMMAND_PORT_SPEED(dev->info.max_read_ds) :
> +				COMMAND_PORT_SPEED(dev->info.max_write_ds);
> +
>  		if (i == (i3c_nxfers - 1))
>  			cmd->cmd_lo |= COMMAND_PORT_TOC;
>  	}
> --
> 2.34.1
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
