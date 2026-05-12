Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD7BCD4F24
	for <linux-i3c@archiver.kernel.org>; Tue, 12 May 2026 16:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r3r6QBMByweCYKyxSqDcmRM7nfLE4Bz4zpr3LCJtz5A=; b=iiDdmE/6odSKri
	f8MFqXnLkEHF/AZlSjOGuR9ndQNOFzq+In/k9vcI6stCM2k2gwjRCb/q7HBeqxwDkA5A68PJ02aRg
	6bHqOn1cZdjI9ucyK6zBJxefZDUxYjLJ3Z8aKp/XHPoXNbnBTVFoT6IvcvTCjP5rr/r1JmtJATMpW
	DH7hOgwlfHnPoAMdv/+bRa8mX+CDdslmqx4DnA3Tw1FGOFIZ307zJYlpKM1BRqAcLpDvq1xKYT9uq
	PoDmua+XhaVKCi6pxy1Gv8EH6hSeEfXmCw3BcKlYQEp4bwZSgQRHKrxUsHIXaXXKG8vKO+5zNzLLI
	rIXFh5KgqXyJvXBXsPIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqEK-0000000HQFF-1hSZ;
	Tue, 12 May 2026 16:45:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqEJ-0000000HQEr-2SIt
	for linux-i3c@bombadil.infradead.org;
	Tue, 12 May 2026 16:45:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TGh8xkWnzsQAaONiV4WldnSGh8hX3SkSUunsbd2zV8w=; b=qzKEwWl1Yvicx7CUBF+kFTkLNq
	p+/DokzKyZW9LlMSP0tZdyP19DLdx7T+RMPM7q41U7yW6+f3kwR3SxeW8ZrcRUstqzyuzfFpEBPzR
	6NhYKOi6HMOS7ZI1UcAH3aFODT4nt5nI8ttdiAW/HaJkW1Ne/XV83hr2t8IBuW4TeutsQrzg4xyNJ
	3aKd4Kl6BhMZLkeAL7sKW6y2cHfpG/oy4+xZR0563m4W7ibIZwRHFB7oVfjyrvP4XuVDLO+o5sNRn
	fjtMHP/aMZsLs8iYcsHB4kEi9bep3fD7ULTABpMnnDs83H4vee89oMPvVwqEe/t/SfloHLl4ZYzoy
	ExN2pUkg==;
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqEF-0000000FNjB-3Jcz
	for linux-i3c@lists.infradead.org;
	Tue, 12 May 2026 16:45:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b1TnoO1wItGd8lDzybp5fOGzrJNfcTLC6p4eCc68yzpTj7yT69LZCc+gzCHeDArHaNTAxTGnHOPMAHyFaU/QZt3ezHirDWaFp98BoSEza9O6B6yRbO0FjNWO3Fc46EV/SO7GCJ1fPaMHT4mF3/ThYZ26Q1LGFncjpLAWX4dcpmFA4fzBDm3pBnLBH1lhm+bOlbCwNXr+jX/jmlnXGQ7PjlME0zluk6IILOmTFJZ0IHGC4CleAH9i0/wgL1VJ4DpDURT/zjXLsCkXPl9JkIPXxjRWtZs1S+zlDgwDLejkjRwMBTIwUc70D8o8LvKUvEvkKqSl1dcEy0lPnOZK17/GQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TGh8xkWnzsQAaONiV4WldnSGh8hX3SkSUunsbd2zV8w=;
 b=pNjFEVidfLDcso+pqZd2mI6X+2P5AoeZN+vgQL82EXwX0ZlgPf5H/tyVDp6LDViSJo/qIOzh8g42RPvF9sSRV5lmx7H4O8KNbgO871/HVPieANf6jA55qrFII9MR9p0HP5mhOXkBaQOULPTyuzmk+NfVhATliz8yn1VsQPA3QUk7dRP0PrEUaLxhxsKoUnh9aZKKw05Edv8z37FmI3+Ui9DKaw9WYLUZHmiN+7eunBTWZOI2hr+isJ7Gsm6qfKt5IKMWKqvFrzChTRrjN8xnTrSpuR7FhWiQhNXDE1WAZnpNpq8SeODtBKfqqyWsxJyopepXSekjhS3VRBkJNBA/Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGh8xkWnzsQAaONiV4WldnSGh8hX3SkSUunsbd2zV8w=;
 b=LFWY+VlXSl5Ul+4rTm047hinJ+73sOalUVOyxAEMZDMzkQvgu1zY6bAGg5fPGZsKiSmMBM4YrQKzAkCvXgrR+Pu5RgiX/bSv3mbQMbMdlcCTq6vxkOHs/rOKltdjqKe9ZMq4mH1gwEjkT4/1zcbm6XikF/l1fnKyuP+A5YfeGRo9OJhJ/MZoPfWtsdQ0ApF1bDJNa9Gz8/EFxk/YZLmvsiJ2jdvHThFfgiyXNby2bORUGfaHIrCpTPpl8EowZM286czviKM/EwUIl+5amibKI+M3pgiHncaO+M7nJFxRwFJlKfNBrrnlW9AVGFzU4FZFlBY8qhv+rgBkP9TeyNy/ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB8069.eurprd04.prod.outlook.com (2603:10a6:20b:3f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 16:45:04 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 16:45:04 +0000
Date: Tue, 12 May 2026 12:44:59 -0400
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 03/16] i3c: mipi-i3c-hci: Prevent DMA enqueue while
 ring is aborting or in error
Message-ID: <agNZCwL7IdfQ_Nz5@lizhi-Precision-Tower-5810>
References: <20260504113352.38490-1-adrian.hunter@intel.com>
 <20260504113352.38490-4-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260504113352.38490-4-adrian.hunter@intel.com>
X-ClientProxiedBy: SA0PR12CA0003.namprd12.prod.outlook.com
 (2603:10b6:806:6f::8) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB8069:EE_
X-MS-Office365-Filtering-Correlation-Id: a6a2fe43-42f4-4073-a12f-08deb045d14e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|19092799006|1800799024|366016|56012099003|18002099003|22082099003|38350700014|11063799003;
X-Microsoft-Antispam-Message-Info: ABtGHigoCaAvcHJMlU9l2lc7UrmBwbosRsJfDEyQLRiycjwbZJV8fr+g24t9TUNwpwG85VqqIfRtF9H2LSxhmzo/wnzcCR9tWiZtqG5CbktclUkGA1zGMqx4pQK7v2BN0Zsq8rvSRtC8PujJm+ciVVE0zr/ik0vvL3XCuGn9DVkPzUndIx7U0wabB08E7uqzn+PR+P40PyWYi0IMuaM9VlrlU13ES4RCBgSqvsJCHDardP/6OKjexxMJLUX5nq30+VLOEpBpAJ84tGcIKot/X9NL0SAq3486iW4TEd+CfLp+V0QGL+Jn95MT8JTY9eS/+5NYeEJN1U3CwtOowqFM72ieyLflVSJqzHHWsa7zfjEu4tMuCHCFGwahbsiYbKI1JMqLwWhgIiqP3eXRocuiyLx4hT5AW7nkt9+X+3rLQPdNLuCUIAifZkIPyf/RkEFNPgHBifYrh/rv87Ufj7hyzD9tWKEkpyTJPY8dcsVnUVI5QCoQanWvuoWKUiM3rMiwiZMEMBw4xXwkTxTwpg7Y1UWlhDKn8EpxCC0mhKf5JSvhwvv2k/lDAodtgVo3Tuju2wOfZjTHgX0FhA3dL9c9HqrSnMEK4h43zXdI7tjvZxpDREB4CsbkFXrlct4E8X8yiy/ARcWXzMtSoA5IuP6iUi2VaT2z2NW6gFTQv1PbSYNilyLyegrJr8ehlmN7c2tEf9cPGjHTGfLpQ7+tWJZhMrzn18gl9RxXEOGDhd2NJbXKumOGVHrocX6QshpuVdqM
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(19092799006)(1800799024)(366016)(56012099003)(18002099003)(22082099003)(38350700014)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3E3AGGujlAnYoAkZ2lEtDrGWLTJke9xbhB+miAbmf9/U9IKZ89kiOq/0h0mb?=
 =?us-ascii?Q?fWNOCYz9nrpnmOoTtPi+1B9oXtn2AE7ko6oyuVbsCLgng1HkC+mgNTS2cGBr?=
 =?us-ascii?Q?Sv9UL4vAIFeEgz3syN2JKaTYCjEH0R/Z67V9PMwfPJUsQ68e8gOLxUf1sPcS?=
 =?us-ascii?Q?uXqXcUfDjFW9tjPOR77rJDoQHWRrwQznnVPW7ejbfvHQPYYtCRwtJuuTNvdb?=
 =?us-ascii?Q?40iapMe2eNjp/dh7ia7mF0BcsZEewSs+7NjfpfRME3y2AV+vb4tyYGFSoSeK?=
 =?us-ascii?Q?4S3RXN0sP+y7UDSlkhLDzDjoLH6lYymkmQTkDTLXQgtqAriNKiOXimMdze+8?=
 =?us-ascii?Q?Ing+n9Uu2uWygZiCJ1J1WYbjSxfpgULYRLRCLwMF83QD87GZ1Vt9yCJOGsZJ?=
 =?us-ascii?Q?j1j2AUB3ROhaVNaPY4g7E6Im2g2oj3VanWNFlJAbjf7ugD33uPEVC72IFtAt?=
 =?us-ascii?Q?s56XjJDYjmxhM8iAIIe4CPk5/mdKE5JnlZ93AsdMBtLDRpVfqJSalmFm9eJ1?=
 =?us-ascii?Q?K1GbdGKmxt6ZuzDruO4NhUm/f00xMeQqCC3PmImWbuMkJidlRIUk6XBFFLOH?=
 =?us-ascii?Q?rH6/bUchFNM737rdCrQAYWhOTQD6nTU+Uf04nvwBvVHPIsijhwdaZLyBjE6v?=
 =?us-ascii?Q?gxZmEcBdoAkOZhRSOOQMdmmcgieXyeH+oKTMRtnlEUVxOZj5tgmyQkeCbkMr?=
 =?us-ascii?Q?CprnQqd+2EFycVsxOPrSygOX+5d1nlXCRjLvWeH1HYDYGWotMzyAE7e1loDX?=
 =?us-ascii?Q?uEfpWUoqBl26OaFMm3TiHgXGYzlaBhfnhnmwkHT+rv4ryAKopuUzEj4sq+X4?=
 =?us-ascii?Q?gQLD0lHUsVx9S4zNRaReGHVqETQXyL9xB6a4SDVEnVplsRapKXCEnmoPowTJ?=
 =?us-ascii?Q?23WHSlPrqiQXc2t+Wo12uqpp2b9Rxa0fiuV00gPpGCjC2rcQaOaqbdKH09/1?=
 =?us-ascii?Q?fpC9xuOY210g1h6pkP89aWwlbYZUC1XI6ERM1rLIrJBYC47pDBqBddKaTU6/?=
 =?us-ascii?Q?l6vuY54/tkg9Z4YIK+rsTbImTeFCjUY0PoA1VzOivYHzI4rLnfv3Ma8xUfwl?=
 =?us-ascii?Q?RYK4Catl8v5e6DYGodxFYJVoKLgA/ccXu5oBEsqrwbPETbmo8SnX4nrhMiUr?=
 =?us-ascii?Q?nNoRChTHZrxSnLCc4513in9dF0e/lSMmCWRov33d9c81XjEkryjvizG5vJEX?=
 =?us-ascii?Q?G2MY/oc/4lkOs86UfhmovTf9Asab5hVaaQ29bA47DU9cYOZjb+S8cYBOyCrD?=
 =?us-ascii?Q?iTis/lHeOjdPafo0JDBDapwpy8QGq9lyVFwtLcK0jRki1+Tau6n78LjPWaWD?=
 =?us-ascii?Q?yuThkGC+8EL+4OJ5boKkmZHzL55cgveKTL9vjyw8QWGG8nebjQzs5dTu3GMR?=
 =?us-ascii?Q?T0zUm7HA/svIfYOnCyR1ykaMqkc+OezmxBMQDXA6nk0huWyDcVeLCh0OnUu0?=
 =?us-ascii?Q?vHt7OPUVynxDbSeN/402xBjgd9iAN4I7GktAJXlFOwsynTN5PwjpWpTzeN+t?=
 =?us-ascii?Q?BLrcUH7yQVDzpGyCf2n4f1eQkTbKqwQJQ+ObK4yEau2T9h4UrlnYKXz6RCou?=
 =?us-ascii?Q?1E0PzeNZvcz4ozdkawqPuVB98i5fAae/709C8cMjualuxhOMD2mlOc9MorKU?=
 =?us-ascii?Q?2uULIxf0/E73chcTICBxQzgTy0EBzui+mCiU9lSwUyU5sjMoyMY7SbFiG5/b?=
 =?us-ascii?Q?lWuKpYJMz7mtKv5PM9fvp/q/UZM+ym0IwXKxjJmEQUJhBOx/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6a2fe43-42f4-4073-a12f-08deb045d14e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 16:45:04.5460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zW3iAIihlXtGNRvK6N/8Epjln2J7gvxUVARdhrllp+FwsQA4Yn7Scxho3jNRksdlMWWIp1PQgUIFipC457frdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_174508_257618_C2D47B6A 
X-CRM114-Status: GOOD (  28.96  )
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

On Mon, May 04, 2026 at 02:33:39PM +0300, Adrian Hunter wrote:
> Block the DMA enqueue path while a Ring abort is in progress or after an
> error condition has been detected.
>
> Previously, new transfers could be enqueued while the DMA Ring was being
> aborted or while error handling was underway. This allowed enqueue and
> error-recovery paths to run concurrently, potentially interfering with
> each other and corrupting Ring state.
>
> Introduce explicit enqueue blocking and a wait queue to serialize access:
> enqueue operations now wait until abort or error handling has completed
> before proceeding. Enqueue is unblocked once the Ring is safely restarted.
>
> Note, there is only 1 ring bundle configured, and a transfer error causes
> the controller to halt ring (bundle) operation, so there is only ever 1
> outstanding error at a time.  Furthermore, a later patch ensures that only
> the currently active transfer list can time out.  Consequently, the DMA
> queue will not be unblocked while there are outstanding transfer errors or
> timeouts.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V3:
>
> 	None
>
> Changes in V2:
>
> 	Improve commit message
>
>
>  drivers/i3c/master/mipi-i3c-hci/core.c |  1 +
>  drivers/i3c/master/mipi-i3c-hci/dma.c  | 25 +++++++++++++++++++++++--
>  drivers/i3c/master/mipi-i3c-hci/hci.h  |  2 ++
>  3 files changed, 26 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index afb0764b5e1f..44617eb3a3f1 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -973,6 +973,7 @@ static int i3c_hci_probe(struct platform_device *pdev)
>
>  	spin_lock_init(&hci->lock);
>  	mutex_init(&hci->control_mutex);
> +	init_waitqueue_head(&hci->enqueue_wait_queue);
>
>  	/*
>  	 * Multi-bus instances share the same MMIO address range, but not
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index 4cd32e3afa7b..314635e6e190 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -484,6 +484,12 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
>
>  	spin_lock_irq(&hci->lock);
>
> +	while (unlikely(hci->enqueue_blocked)) {
> +		spin_unlock_irq(&hci->lock);
> +		wait_event(hci->enqueue_wait_queue, !READ_ONCE(hci->enqueue_blocked));
> +		spin_lock_irq(&hci->lock);
> +	}
> +
>  	if (n > rh->xfer_space) {
>  		spin_unlock_irq(&hci->lock);
>  		hci_dma_unmap_xfer(hci, xfer_list, n);
> @@ -539,6 +545,14 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
>  	return 0;
>  }
>
> +static void hci_dma_unblock_enqueue(struct i3c_hci *hci)
> +{
> +	if (hci->enqueue_blocked) {
> +		hci->enqueue_blocked = false;
> +		wake_up_all(&hci->enqueue_wait_queue);
> +	}
> +}
> +
>  static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>  				 struct hci_xfer *xfer_list, int n)
>  {
> @@ -550,12 +564,17 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>
>  	guard(mutex)(&hci->control_mutex);
>
> +	spin_lock_irq(&hci->lock);
> +
>  	ring_status = rh_reg_read(RING_STATUS);
>  	if (ring_status & RING_STATUS_RUNNING) {
> +		hci->enqueue_blocked = true;
> +		spin_unlock_irq(&hci->lock);
>  		/* stop the ring */
>  		reinit_completion(&rh->op_done);
>  		rh_reg_write(RING_CONTROL, rh_reg_read(RING_CONTROL) | RING_CTRL_ABORT);
>  		wait_for_completion_timeout(&rh->op_done, HZ);
> +		spin_lock_irq(&hci->lock);
>  		ring_status = rh_reg_read(RING_STATUS);
>  		if (ring_status & RING_STATUS_RUNNING) {
>  			/*
> @@ -567,8 +586,6 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>  		}
>  	}
>
> -	spin_lock_irq(&hci->lock);
> -
>  	for (i = 0; i < n; i++) {
>  		struct hci_xfer *xfer = xfer_list + i;
>  		int idx = xfer->ring_entry;
> @@ -604,6 +621,8 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>  	rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE);
>  	rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE | RING_CTRL_RUN_STOP);
>
> +	hci_dma_unblock_enqueue(hci);
> +
>  	spin_unlock_irq(&hci->lock);
>
>  	return did_unqueue;
> @@ -647,6 +666,8 @@ static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
>  			}
>  			if (xfer->completion)
>  				complete(xfer->completion);
> +			if (RESP_STATUS(resp))
> +				hci->enqueue_blocked = true;
>  		}
>
>  		done_ptr = (done_ptr + 1) % rh->xfer_entries;
> diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
> index f17f43494c1b..d630400ec945 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/hci.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
> @@ -54,6 +54,8 @@ struct i3c_hci {
>  	struct mutex control_mutex;
>  	atomic_t next_cmd_tid;
>  	bool irq_inactive;
> +	bool enqueue_blocked;
> +	wait_queue_head_t enqueue_wait_queue;
>  	u32 caps;
>  	unsigned int quirks;
>  	unsigned int DAT_entries;
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
