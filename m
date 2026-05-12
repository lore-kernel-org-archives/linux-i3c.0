Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5118CD4F25
	for <linux-i3c@archiver.kernel.org>; Tue, 12 May 2026 16:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Quh3UX4JIXiG56noP05Ev4s5hb+1vwzHQnN5stBk2g=; b=ZsTX/MZ4R3LPMd
	Icy/tJkkxm8GHGdkwq6fCDlc/XvQpLv0lju787hYD/EolarTa4HlMJekicEEmKIm8sT9IF8IlBinj
	c9jDUiqtUtlTFfVqN3gfNyB8yvlvw2JMr39vvI0cWaoB48r25iyp1i/Tm/c1BNcS6Lc2VYgEXmlmn
	9aLHQvmfopj1rxM+7Hjp6b1EKuvaW4gECNWWas8rfd+JHRiso4wgiUedlBt8kwy9MzbbX2bH3vE16
	EfmLyygKgqwtXizBl+qL9i9GWodnQabCJW3Y5YlgJ4YR00q2tQSy2bTNAjRROU5Id6ORIuAQ4txCv
	1f0UDIbPO+Q1bFr3Jq8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqMT-0000000HRfF-1nuz;
	Tue, 12 May 2026 16:53:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqMS-0000000HReq-1T39
	for linux-i3c@bombadil.infradead.org;
	Tue, 12 May 2026 16:53:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oMXQPYvWQDTxqTUKPCOEDN14J3yj1esPCkWd4i5eapA=; b=NaoypZ6yZGvMS1tfS3zuP52oif
	+XXMxJupHXFyusoMZnJ5W2W595nsT8fJGxW5gGmMZkWP6beBq0CDXilgWYTSxLgyiiLB3UyzZLZm6
	ZWD5mk14pMrxEINikACa8+Wmcmo+pz4RJkEe0rEsqWdns/YIs9sjxCx8wmJU9hyfiQ0bd8GkC664w
	5GK3hN4LvJ4sl0f7HFnR8jxK3j31EF3WyXS8lUaayJ/UjJjMzyW8ePTC5OieOdG9ONYFUZyLRUMdy
	rtkzEzEBJ1yWT7IcfQkimCfQSxmOctT5z7g4i/E72nqDfNtV4wLO56pR3KThG0FsEMlnG7Z9NS3BU
	1ypsp2Aw==;
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqMO-0000000FPMD-3hPr
	for linux-i3c@lists.infradead.org;
	Tue, 12 May 2026 16:53:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BDWcpKaJ9sHlcbjLqVjGPWgpwjNBRZGC8/WDmC31hW6zLnQJ/tI21fjSK9McG09Umk5ZsaYl8UdndylTeJWhBFJIAOGcx2r9n10urLPqqIm2LAT9xTRjR1go39uMSWvDLXRSK8iXyDuzpD6EJ8rWMmdDoJRuxF15COnxhIIHEmplXfTCLxzbGr5xgLcST3XX/X7Y8g8qOwLO8+e/yHdk6sMVmDfpvTLN13EVL8ZHm1UkjlVavqYyJAVmwSvh3pyPY3++Bv+9m56Fq55CV67OCXnqTnSQiFIBxLGYvLQt0ARFcS9tZP6j9V/M2NANaI4u0zD4RcAol2VhMTi/k2v4hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oMXQPYvWQDTxqTUKPCOEDN14J3yj1esPCkWd4i5eapA=;
 b=i0DPiif3vk1+I3/AGnwdnDHIYSzcGzibinAnScmCRtwWNJyis94+Z9Ruim7n9tS7YxlPkixNgCYhD5/tA4xRigp0sM+WHTlycYf6ROrFaqI0W/ORmTz3c9+cjv4ZpTkpq19RA6BtzJVAR2NGvsFQJVnlm1b5B+Cmgr1YyiQco4UBwvYiEr8jTX05Kp/vMmuh/mhz7qXVH8LN26xxdEHk2SgQdqhO34z1kgNUUwkJOd0lipWDPlqVjFpl6ZiGkbApHyJrqtci1uO5WhzIEOce4TSqlWRKmitttx+XkNNdOr83f38q2dQs8gX7prF/6LqaxJXFqqbsO+q63d4ZJbW7gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oMXQPYvWQDTxqTUKPCOEDN14J3yj1esPCkWd4i5eapA=;
 b=NRdJsDo8fXvZ2YAjE47re0rf3hW7MsCV6/T5q5DIfE0r9PqDEVIaNLRKqZbr7yOij4bilbQWUkWvePt+pcWrEkmx4q5TEqbmetRlshrEY6TNU5Ou00PFCY52AbeiTr1wzNWzJJoPVpjqz+Cs8L/VmN8QpGavhKJua52iwfNK3qnApvIcdOsxTcuY8FMpUJhMbIm9GMDB32q9AG5rDP2BRCB33axy1yu0Pg8UIWqvlcrR3hWJqcQIet2NC5mQUkbeiR2dEZTmTOqkcXYDHhBq1X06CJbdJqnNoRVlCtOVgQAjMs4gWqvL4SOkMnd9RimEaJHJGmUbcRZDqVLE0pT/xQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV4PR04MB11971.eurprd04.prod.outlook.com (2603:10a6:150:2ec::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 16:53:28 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 16:53:28 +0000
Date: Tue, 12 May 2026 12:53:23 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 09/16] i3c: mipi-i3c-hci: Add DMA ring abort/reset
 quirk for Intel controllers
Message-ID: <agNbA6IlaF5f-sW8@lizhi-Precision-Tower-5810>
References: <20260504113352.38490-1-adrian.hunter@intel.com>
 <20260504113352.38490-10-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260504113352.38490-10-adrian.hunter@intel.com>
X-ClientProxiedBy: SA1P222CA0092.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:35e::12) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV4PR04MB11971:EE_
X-MS-Office365-Filtering-Correlation-Id: cefcd9de-e615-4466-e021-08deb046fda0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|52116014|366016|19092799006|22082099003|18002099003|56012099003|11063799003|38350700014;
X-Microsoft-Antispam-Message-Info: hm9pCX71c0mF81rjfJd/4jx8w/R5SIsYz8z3JVj+a9etT4PitforS8WHHKZ2n3R8JUg+iEmn2Api9+w4gTWMFVEZhupTaCVywkqheIRdFRbJu9VLALtXWRLJni8fKZPY+7G8Ahk9if3YSnhyDa6MV0HA50Z0jnkBqqx0lgGbfJzJM0tlB5zOJqN8eX9eiknsE29YZhSkfYcrjqbeQkHBHvUU7RrdbDmuRkV+LbJD/S+iHp3+O1Tw5zW5hKLQ5xxt+tLEnwEqzUXrKiH4VFPvzJyIq0gjqAJMrzNuQ6xlshxM25g10Ztwb7quxG6RxvMRUP3AyfSAQi1vMyyey9jt+P79wmWMm556QWzO/+SbkwWVsr6KK4aLlTjH5qYLstKgk59NJPARodOTvS0b6S3eEKhmo0XgkLS1mZqaqT7M0RAo3WYiFBXRe0yrlFi5TIy4OM61CtvJwVxclxe7Oa6K6CrevC653nWuTpI5FwoVmAFOWElK+lQ1nHp1bbAACUzGtBd0nR+NLD4o5TvewxJZQmYogvFsIdCSaaIxubP2EOXVCQtkH+MDCKobMQI1gtlrI2qGa6s+CXns7Z5mw/j3dX6MuZRHBgpVYkq7QFdKKtFAZQJZXPZqBAJYP4pmYtbYC8PV3xfCzdAPn7NOSYptvjtEcHKgaIThmnwVOYPFTDaaWy5ZcEYUmwnG0bCQHql0OXbN/lASLyBiN6m33Sl1bzPbzVNytMyD1MCBBpqmTA2C1qglCcT+Bl4/OFkNkgbk
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(19092799006)(22082099003)(18002099003)(56012099003)(11063799003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IF0wJ1AytDdt0Fhb59MQNaoB4/kOfu2juFPBDobjnxEFcNw9L/9kOJ7oZrWF?=
 =?us-ascii?Q?ac5B5TIg/tA1HQdbgga17wtM0cMx+Yod2qHRpe00w33wkgk6EmlXU3HoRx4G?=
 =?us-ascii?Q?gjpHBCRtovDG6z8Qe53movSuDrPKje0YabY0e2THYL8jFcXrDCNq0YC5/rQM?=
 =?us-ascii?Q?gkrtnam+jFdyzBP3LTBiIxTbdof1GDK5xejaINbFmCaIDU1q2I24DO0SxLqM?=
 =?us-ascii?Q?fElyHLzb/ed++jV94B3WG5tiZp3lSYY218Pl/4uPbD3pAIXI7V8ufDpYQXE1?=
 =?us-ascii?Q?VC9HXCGRCyRMPbbX5MIP2u6AZFecHxita4qDr4MI+LlZi23PW7q8wg2LElgQ?=
 =?us-ascii?Q?TOD0naiWsZF/HxF5yj/smXG4smDPJw/Tc7kEmXvseoifX6DXsnw57MCq7thq?=
 =?us-ascii?Q?MZxAqo2FrhIGJK0IsM+Swl4uM/fT8bgRiTFZi0JPZT/szuqCbemOQxcdbdz0?=
 =?us-ascii?Q?vMEsVzpu+Xc7EPrWfgp0Iz/MBG58Mtsfjr5L5otYP+JCChamPlGhTPFdkju+?=
 =?us-ascii?Q?WnnXqcEYC1I3ZlnoTF/C5oi1wWYFvFGe0YK5kXY441e3tWNnRor0XLsQ3qmu?=
 =?us-ascii?Q?YOg3+vAxGhGSbE2wI5RTDC/YwyhgUjiyUk6J89RwBQY3LLHRkeio6JHxOwfD?=
 =?us-ascii?Q?okdsmRx+uQcJolfFVJPEljCku8XjC3baw/xMCfnA0DveOIiqA9NYEE7ZdjDa?=
 =?us-ascii?Q?vqEtHivDH3eLd9e+NxdTkjOVTdNvOds3Z3+VoSq4zzWJMBXMzSnWrPs7Mp3D?=
 =?us-ascii?Q?tNBReXyT6LRGF9zwgEphHfMykdnvf6uXHOZFrz3AJmMu2A7lfiLvKZTd3hZL?=
 =?us-ascii?Q?VIwH8vVs3aCJFl177P2tjPTbtNXsovWNDVm52WmWN4o4KP/XjC8yrQ/v5bwA?=
 =?us-ascii?Q?3kN7u376BEcF4Crsph3jhdUQprpHVu6hgeI4Vesq6yVhR5XRHn5xLkIqiygd?=
 =?us-ascii?Q?Qqd7748mRF8xkdrA2NqONWhfz62Cg+Ffqgo8J2TJolKuCLMK+aoNYt4hkkSL?=
 =?us-ascii?Q?2EJtlJwfC+48n5UHLSKoe+K6djmvBNHFz8TnDTzq7NJN85pMKPK4S/bwBO9+?=
 =?us-ascii?Q?dk1HyuuW76l4kgHLrP8VDKIJFQHmGbMysvrGVzUSh4tSUtvbLJap67lQQBn7?=
 =?us-ascii?Q?Fl4ijNWa4w/XBqbFqK92FV+WeR80hXZT/NHRrbVfjnx4TQpK0TuxewGE1xad?=
 =?us-ascii?Q?3+7dEUJsDfy5I+zy0L3MgpHMTdLMFkasIBM1aDr1GefBaRCv3aDBEZ7X1kwV?=
 =?us-ascii?Q?wAooe/1R4VxkaYY2zDwRygliTm0TbR/hyaBl/Fu2o2XvoD2Ub/dYy2twY6hu?=
 =?us-ascii?Q?OtBtblQY5Zs6v9eErPXnXMG/bctqRCkUDJ1z0QVOUfnM5TynZg3pzd0CcQAt?=
 =?us-ascii?Q?yEZJi+n58BlCbD+iVPbrskffS/T6vOWLhHzBhfNxE18jMu8Vit3pyS5wt96w?=
 =?us-ascii?Q?XkAU+wxM3o90RGF+XCUm9Au3msaDSWUN5sXx8M8iWDQQ4PhaMM6Q7jHNWPX3?=
 =?us-ascii?Q?+hGzpneBtBl5Bc8troeXo0zxTJXqULu6KdlS45yLK3/MNa+HFOr0IHRZLCjf?=
 =?us-ascii?Q?QsdvzPMLtKlQsYWAApSuvo3/dIwEGdcYnkHavznLzROzwKJeUj0vviwUac2R?=
 =?us-ascii?Q?4QIhB74cpxNDh92kvHJyP0fpZF11A7GFzCDy5cBwoskWqx0kNSmCyrhHc4VG?=
 =?us-ascii?Q?0lda/rdes4NU/tbYLYN1ZogXT2YVYt8oa5wPf1sHIDb7BXcF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cefcd9de-e615-4466-e021-08deb046fda0
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 16:53:28.4576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sm1VlRrGI/IstpQtX+NRr9AfXXzcNNPPz4EgdnbUO9SweYYRTw0Y9h5lunVjRoYKUeet3isIvqgFGsn/eyZu9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11971
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_175333_516238_E99845BB 
X-CRM114-Status: GOOD (  26.78  )
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

On Mon, May 04, 2026 at 02:33:45PM +0300, Adrian Hunter wrote:
> Some Intel I3C HCI controllers cannot reliably restart a DMA ring after an
> ABORT.  Additional queue resets are required to recover, and must be
> performed using PIO reset bits even while operating in DMA mode.
>
> This behavior is non-standard.  Introduce a controller quirk to opt into
> the required PIO queue resets after a DMA ring abort, and enable it for
> Intel LPSS I3C controllers.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>
>
> Changes in V2 and V3:
>
> 	None
>
>
>  drivers/i3c/master/mipi-i3c-hci/core.c | 15 ++++++++++++++-
>  drivers/i3c/master/mipi-i3c-hci/dma.c  |  9 +++++++++
>  drivers/i3c/master/mipi-i3c-hci/hci.h  |  2 ++
>  3 files changed, 25 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 44617eb3a3f1..770235ad6b25 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -240,6 +240,18 @@ void mipi_i3c_hci_pio_reset(struct i3c_hci *hci)
>  	reg_write(RESET_CONTROL, RX_FIFO_RST | TX_FIFO_RST | RESP_QUEUE_RST);
>  }
>
> +#define ALL_QUEUES_RST (CMD_QUEUE_RST | RESP_QUEUE_RST | RX_FIFO_RST | TX_FIFO_RST | IBI_QUEUE_RST)
> +
> +void mipi_i3c_hci_pio_reset_all_queues(struct i3c_hci *hci)
> +{
> +	u32 regval;
> +
> +	reg_write(RESET_CONTROL, ALL_QUEUES_RST);
> +	if (readx_poll_timeout_atomic(reg_read, RESET_CONTROL, regval,
> +				      !(regval & ALL_QUEUES_RST), 0, 20))
> +		dev_err(&hci->master.dev, "%s: Reset queues failed\n", __func__);
> +}
> +
>  /* located here rather than dct.c because needed bits are in core reg space */
>  void mipi_i3c_hci_dct_index_reset(struct i3c_hci *hci)
>  {
> @@ -1040,7 +1052,8 @@ MODULE_DEVICE_TABLE(acpi, i3c_hci_acpi_match);
>  static const struct platform_device_id i3c_hci_driver_ids[] = {
>  	{ .name = "intel-lpss-i3c", HCI_QUIRK_RPM_ALLOWED |
>  				    HCI_QUIRK_RPM_IBI_ALLOWED |
> -				    HCI_QUIRK_RPM_PARENT_MANAGED },
> +				    HCI_QUIRK_RPM_PARENT_MANAGED |
> +				    HCI_QUIRK_DMA_ABORT_REQUIRES_PIO_RESET },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(platform, i3c_hci_driver_ids);
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index 268f54b32101..699c6d523eed 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -597,6 +597,13 @@ static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
>  	rh_reg_write(RING_OPERATION1, op1_val);
>  }
>
> +static void hci_dma_abort_requires_pio_reset_quirk(struct i3c_hci *hci, struct hci_rh_data *rh)
> +{
> +	if ((hci->quirks & HCI_QUIRK_DMA_ABORT_REQUIRES_PIO_RESET) &&
> +	    (rh_reg_read(RING_STATUS) & RING_STATUS_ABORTED))
> +		mipi_i3c_hci_pio_reset_all_queues(hci);
> +}
> +
>  static void hci_dma_unblock_enqueue(struct i3c_hci *hci)
>  {
>  	if (hci->enqueue_blocked) {
> @@ -638,6 +645,8 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>  		}
>  	}
>
> +	hci_dma_abort_requires_pio_reset_quirk(hci, rh);
> +

If only use once, needn't helper function since this helper function is
simple

Frank
>  	hci_dma_xfer_done(hci, rh);
>
>  	for (i = 0; i < n; i++) {
> diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
> index 83d4f13a68a3..01237b12d32e 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/hci.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
> @@ -156,10 +156,12 @@ struct i3c_hci_dev_data {
>  #define HCI_QUIRK_RPM_ALLOWED		BIT(5)  /* Runtime PM allowed */
>  #define HCI_QUIRK_RPM_IBI_ALLOWED	BIT(6)  /* IBI and Hot-Join allowed while runtime suspended */
>  #define HCI_QUIRK_RPM_PARENT_MANAGED	BIT(7)  /* Runtime PM managed by parent device */
> +#define HCI_QUIRK_DMA_ABORT_REQUIRES_PIO_RESET	BIT(8)  /* Do PIO queue SW resets after DMA abort */
>
>  /* global functions */
>  void mipi_i3c_hci_resume(struct i3c_hci *hci);
>  void mipi_i3c_hci_pio_reset(struct i3c_hci *hci);
> +void mipi_i3c_hci_pio_reset_all_queues(struct i3c_hci *hci);
>  void mipi_i3c_hci_dct_index_reset(struct i3c_hci *hci);
>  void amd_set_od_pp_timing(struct i3c_hci *hci);
>  void amd_set_resp_buf_thld(struct i3c_hci *hci);
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
