Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F0BCD8CAD
	for <linux-i3c@archiver.kernel.org>; Tue,  9 Jun 2026 10:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ugli2GRXf7ApXiBrrhs5r89xtgudV5L/J499Z30YaEU=; b=nkieaoCwkIkbQC
	Mhfz9ijH9JcbMpvkekS7/Cky2k4Njc6/5YTkBo6JjOXfkpAmR1lSkscLQTH3hY9534aot4g0v2hU6
	dsb098smphjLz7B1RouRm5Gjw5KwSx2nJQhoUwI9XYXbaVWNmjKWpgJf8BrmWI19nwBx5T2AnZF+o
	KKKaIf8HNa/sPugacBpW/rSMAKXG9aM5m70S3mo/95tl0xeSZayWympZ8XVhc45KgGBzMFpMpFreA
	bo/IxMs8MQ6oRScQGBPK18ZxZHjvwY2zaz5OBuHlhoPDYFyWx55i/x0/jp7Ai/Y7iTwK2iBhLnG4l
	S0h+j8t/P9Kzcq/f4Acw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtXG-00000005KXm-1Bl8;
	Tue, 09 Jun 2026 10:18:18 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtXE-00000005KWP-1jSN
	for linux-i3c@lists.infradead.org;
	Tue, 09 Jun 2026 10:18:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aRDusggKLbnS/JhOBVEQJ7qFfX1xOQpVymE+kjQH50xRz3GvYFuK2ltLpZ7m8wnpfBWW5opPXPSKXuJJ2Sda9yVF+gVswDgxn5VFqXoUNikt+4vAvaPznBu+CmMMSCCly+VPUGplgOL3AGQ/7iGJa7sRjFgrRcCfHQ9S+sm13IaW5+eYdA41XW+XTnxjQ4S6hHlCbERlIhU+3KEJHOEdjtuLbkoXILnSlWKxWpsGvI7w8b/xKSZPWAsZs6SM1kPS2aEY7LGObfkcES7k/s402CkkL1kDjotiYsKyOFggwlQG4tt4iJwSANRpprOz8QYsImthp/BCKWanqdq8goyasg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TYkZCWMmOkOmFemJjUds3GGpNQnhb/jAxFaud4fOb7Y=;
 b=H/KTGz0j/jCegS77lVb7A5jGo11+rvhF6a9IjbFgISGBx8C814US7MeE/tcWsE2n8+sSWH6JxiBjIokSG5IJl3P3mrzhYO4PtnrASWxw9PnxEpde04kopUE//S/wFIupvRC5IKrRal83uhaG2kJNThIjl8xd0HYoTGaSOksb4w7eSbEwZuGMvwmV4przvAOQyzrlMZYfUUtdoJCv6OgMjM80BSdW1KVQAhsfjIuCodu10arc4Syh4+2WX4wFuHqdSCDr2CNhKcJSDeE/p49v+7Pl7vJ/RV/oYqpq5Qm+QgQpkHWtgc0pjEqTeB0bL87F4An67zNyTFy4W1St+ZbFBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TYkZCWMmOkOmFemJjUds3GGpNQnhb/jAxFaud4fOb7Y=;
 b=PmFncxeEWK9Hy8Rr9nDfZ/T81cf7ZP4Nov64c414BAA/iwk6PbaJTUhP/lJOTxtgyEkAL0KX5K2xPPN6JWiMMbY0i6lGxiKSlOPmPTBHCVlQ+QOpguuvfDVxLRIPppmMx50B7D4O6aGn5D//eSZdZneHpW7odFKs0npbx9wLL0zTD6aOS5ODrZN8jfQFr+uSSbcQ0IqSTEkSohAelzLX/N07/wna4M0tmrAytlcFnT+cS6RZL3r6rDpB+mS0JDjAPHxMqnFd77idCwhBxA0xmVI+kznW6vxQRztOMvf4yxXlQ4YZrBfZJ6daKXIVBpY1FeYEOluSsBS4KiosDynKbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from CO1PR03MB5937.namprd03.prod.outlook.com (2603:10b6:303:6e::18)
 by SA6PR03MB7759.namprd03.prod.outlook.com (2603:10b6:806:43e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Tue, 9 Jun 2026
 10:18:09 +0000
Received: from CO1PR03MB5937.namprd03.prod.outlook.com
 ([fe80::f970:684e:8c80:91c3]) by CO1PR03MB5937.namprd03.prod.outlook.com
 ([fe80::f970:684e:8c80:91c3%4]) with mapi id 15.21.0092.010; Tue, 9 Jun 2026
 10:18:09 +0000
From: tze.yee.ng@altera.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Felix Gu <ustc.gu@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Jorge Marques <jorge.marques@analog.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] i3c: Improve CCC reliability for DesignWare master
Date: Tue,  9 Jun 2026 03:18:04 -0700
Message-ID: <cover.1780999511.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
X-ClientProxiedBy: SJ0PR03CA0132.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::17) To CO1PR03MB5937.namprd03.prod.outlook.com
 (2603:10b6:303:6e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR03MB5937:EE_|SA6PR03MB7759:EE_
X-MS-Office365-Filtering-Correlation-Id: 63298f77-a413-4fdb-6451-08dec6106757
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|11063799006|56012099006|18002099003|3023799007|55112099003|921020;
X-Microsoft-Antispam-Message-Info: KMoRopVbh2qIdsU4LW3xEjhzoCUZgAwBr+LnBDf/N5OlhXkulqreXnCHJCd7qW0U9jtYeTbxol5RUo/U5u+MJZ+CSOIYazL/PP+LO0DRG6lYKZyJ3mxZ7VKAkG0NDvpGpr6xrZ0EtCEAimK68zN7FWew91x7gG/v/kNR7vQk71i0v0SJUMV6aPi1qPnFZh6zRNLK8HZDYyGYdzUOj3r2sBTYwQOiUp0e/oRw+fNYaX/O+vgn38G+hXZWz4H8LQPu9rlWJFYcskGMBUlU+4XtcraqtKTIPCFSMgQRIj41C3IJBQp0eOV1UArwp6HIp1h27SgG92zbEuHaRGdWLA86mKffs3kvG4ln/320lyUY7PedkyTH0XIKJ/zh00WHeJ68t9rPMNAws4x0BCvNorJ4w6aefdMbg+E1WEeiU70enu35siqNtwRDK79us5P/VgkIIsQ5gOP2nRbd3JsA2HUgKEJs8hPIqNVND7fDCJZ4BEPcsvfRFPggt69dXDls1W786RipYImMkU/8M90n6VLXWsI+4U/+rkng0IcBmVyPJD4hWQXNNDES18KiAVZrrv86Dg3/iIITSTOOAJDiSI08yNC5Sf72K8nzMqxQYwJSE0cT9ZwWAUgF+lzSUdCeLN0QyUAk5QuO5MGaXiwiapGwzNxsC601S9grNwwOyXGZsC5DnDCyS2vF0cKz1L6Lb/m8NyfWr4b3z1UtraZojk5hM/j6SZ1p/XlfQjr85T+WfVmRlF2b/B1pm/i71iVg5dpe
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB5937.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(11063799006)(56012099006)(18002099003)(3023799007)(55112099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2OaTGz7bf1ik/a1vpijEHBZlF/XNULU3ezTG5KYMEhJbXORNQUEywPQAPun4?=
 =?us-ascii?Q?fsZTngIh507oRABDjZ1G4NKf+urevXKAZ728GsOGZb7Hm6I2v9ELVzcJ0G8F?=
 =?us-ascii?Q?3NlSMAorios75X5CRFnoYN7A1WlrurjtRRen+jRBhYRBHRnaUCyTaAKE6hJz?=
 =?us-ascii?Q?rU2Ym3pW+j7UVyJYzunbBLqQTrwzG/Fdxtm3yU0Yti4zlQfD/hMrWUEafnHl?=
 =?us-ascii?Q?NcEJtx6vP6bEhSqTxMI2gtNLDEgBnDz6w6Tc9H6Sf6nz0nTnjV1saosaYb3W?=
 =?us-ascii?Q?ZLdpgStL076zulD1EfOTEHLaYuLT1/9C26JfuilpGA16bZsL12F2QGmIM7Ne?=
 =?us-ascii?Q?ERQVzt468cs51Fk82s8mK4OyuLRMiKgQOAOA+YRV1TZmiVikGX4K2Ly+AJ+v?=
 =?us-ascii?Q?ChJHvup1SYAJqGb0WQS9z6LoE6RzaOxS8a4WgsmqlWGlJOjE4rfO5ywDqK5J?=
 =?us-ascii?Q?BtkwlM/tx53edvIkJc0PpaYmbbu4F79WI7Zoa2RmHsg3RoicJBQHEyrhJRaK?=
 =?us-ascii?Q?KoRo+p0/mxz/nJU5hSXvIQ4UO9jc8o0ewjSE8H8edX5VB6iBtdu8I6JGoPF3?=
 =?us-ascii?Q?ZMKmvJ0ubnp4rNGwWZypPddoR4yiU0LOh7O5GdkAc7EF/sqI/muWcZR2u1yE?=
 =?us-ascii?Q?nOviaS8MoOLOvvjGT2WIu39LMIbX0ckC3TlqZMqnerNC5GIKQjsSUk5Y58hM?=
 =?us-ascii?Q?UIHIgo/Pu6kK00RPT2LOEHlFd3eCMfYgQPJAsEArCmnZrjs3wkoZdrdXZ7L+?=
 =?us-ascii?Q?DXJSkFf8GELmlkPiPCzPlFWjxJW/I9QHzw/HYsUWMdl7k8oLvkK0F3H74xap?=
 =?us-ascii?Q?G1igiF3V2Ll+0mKVR1SLN+FZiHUbUaDxWPrb+uaBuBnWF6pVuvtITN2c4adm?=
 =?us-ascii?Q?rynehvCxAd5YxKe/kb6kWP7ygC6HPPf6HWeVwC4xwKaMWFzZTUbVCKIImLhR?=
 =?us-ascii?Q?NLkBgTwnVHCRwmEOj8D492tjglMlUltZxUDbtngiFF6YPPhdsVO6a7vof9L5?=
 =?us-ascii?Q?lHY6dFOGJCxwXoCTFhRPMQgEL8cNcWGMjFcBYZOQpZ3PyC3ky/fUElL2SgHT?=
 =?us-ascii?Q?6EwnWo1dE4c7D/JvJbXAuQb33iYdlm858pzI6suVA5RMj+iFd93R53u1nKYF?=
 =?us-ascii?Q?5UeUDyF2PNKwZlanp8lhNoe/vt38+ZvAVDDnT1VplWy3iU3vg72IykfZ+Clc?=
 =?us-ascii?Q?6IqcgA46S//BAZiOmAuxmeXvuGiqgHW3Lqt7gpOuhy90wLEAhmd4pTaUXciW?=
 =?us-ascii?Q?qahpnPsByE8BEVkLCpTccXRoxEVQVFCN14tSXF/b0VRxx9NQGDLdEBu9Yktd?=
 =?us-ascii?Q?y2YIcbg1RP/oklzARpG7LYJcD4tgb77MmBYhUpF/NCCOPSb6LQThx2EQVH7k?=
 =?us-ascii?Q?OY3I1bCiDo5Ii3AxEJOhZi+jzsOUhLoRDd2M6/EjRVQPSXhOIDQa015tR1ZE?=
 =?us-ascii?Q?l94eZn7iKBHo5Mlp03k4RTHauJOb8sabUJ1ZoSXj8HmMtruewtzTJYj9JIEO?=
 =?us-ascii?Q?mRfuEDTTAMNDmrce//4B4SVxvtMvAjkNGGobqXVMAc9oqFsr4+GGmeRXJBgC?=
 =?us-ascii?Q?g7BAPpCBGDfAZp7ehA/Yrt3fDe3Czx9qNiHe0DER+BjJ2M/rLgdEwURHOQZE?=
 =?us-ascii?Q?3+5G4VjQiFF9oplMHyuOIkggRd/9ATWfhK0kwX0HmcZs50r2ZfJDhZzES28e?=
 =?us-ascii?Q?EuwozCNSAkU7+2LpshSlt3cSDDUJYv40umC5srO2jc769yH8MSzHniOI6sGg?=
 =?us-ascii?Q?mnVbrRQkCQ=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63298f77-a413-4fdb-6451-08dec6106757
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB5937.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 10:18:08.9864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8WMjfdihZyFts6RAJ9j/aN08dXsbr1cJE4UC/5B3Y/LoZehgmjC613EVtKbMy4sUEwveKvJz1LI0Dh3+AEcbYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7759
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_031816_456968_FAE9649D 
X-CRM114-Status: UNSURE (   7.88  )
X-CRM114-Notice: Please train this message.
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

From: Tze Yee Ng <tze.yee.ng@altera.com>

Improve I3C CCC handling on the DesignWare master used on SoCFPGA
platforms: report the actual GET payload length, map hardware errors
to I3C M0/M2, and validate GET responses with a single retry for
transient failures.

Patch 1/3 fixes a DW driver bug: on successful GET CCC, set
dests[0].payload.len from RESPONSE_PORT_DATA_LEN.

Patch 2/3 maps DesignWare response-queue errors to ccc->err (M2 for
IBA/address NACK; M0 for CRC/parity/frame/transfer-abort).

Patch 3/3 moves protocol handling into the I3C core: validate GET
payload length (GETMRL: 2 or 3 bytes; GETMXDS: 2 or 5 bytes), retry
GET CCCs once on M0/M2, restore requested payload.len on retry/error,
and use a stack buffer for the common single-destination GET case.

Changes in v2:
- Split the monolithic patch into three patches (per review feedback).
- Move GET payload validation and CCC retry from the DW driver to
  drivers/i3c/master.c.
- Validate GET CCCs only; drop SET payload-length checks (DW
  RESPONSE_PORT_DATA_LEN is 0 on SET).
- Retry GET CCCs only; do not repeat side-effecting SET CCCs.
- Tighten GETMRL validation to exactly 2 or 3 bytes; add GETMXDS
  2/5-byte handling.
- Expand M0 mapping to CRC/parity/transfer-abort, not only frame
  errors.
- Restore dests[].payload.len before retry and on error return.
- Avoid kmalloc on the common single-destination GET path.

Adrian Ng Ho Yin (3):
  i3c: master: dw: Report actual GET CCC payload length on success
  i3c: master: dw: Map CCC hardware errors to I3C M0/M2
  i3c: master: Validate GET CCC payload length and retry M0/M2 once

 drivers/i3c/master.c               | 111 ++++++++++++++++++++++++++++-
 drivers/i3c/master/dw-i3c-master.c |  39 ++++++++--
 2 files changed, 143 insertions(+), 7 deletions(-)

-- 
2.43.7


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
