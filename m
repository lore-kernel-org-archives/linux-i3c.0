Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E19F3D44149
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Dec 2025 09:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Un0jOW2ncYNzKd0nNbwsdcBy5WjeyfZSGJERKDLLfZc=; b=xVnT6vfc9RtMYq
	t4EU1s+niaNMWmpN6jrr8BDw8xeDDVk/OartsgOcmw+Rqi00R/3ON+ETXgYUNUCsHu7F2QFEerwfi
	3Zolp7kGJItYQEWpwJdUlI0YjarOrP5/rb+Ur9PbnenWvHMBjfHkrbYCj1ra/6xzLZU/UNvaqQZ5M
	vrvg8Ny/rXYtxnXOTMVS08l+s/wJQ4IHnUIbjlHqnZqvmc1HhS2rkOKIdujfbHgMqM64p2DBiplzr
	TfNc7c1WNg9W9axZ5bFBBPXvgSC5WqeYiNFvq2H/bSZK5iE7lZcjmMIeMxHBF78nr8GPrxXWd7Ntq
	3JSoppAWzmDC4uFw2MRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTz5o-00000000Ixl-3wqu;
	Fri, 12 Dec 2025 09:05:42 +0000
Received: from mail-westus3azon11010058.outbound.protection.outlook.com ([52.101.201.58] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTz5m-00000000Iw2-12IS
	for linux-i3c@lists.infradead.org;
	Fri, 12 Dec 2025 09:05:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LMrLPZeDQEH+IyrjTXkT7PKkMi15y4on+02m2YqgYGez9Kz608y65WsnM36XXzzIVwXFNIZ5J2POAR/uELKX6q9ay3TYQ2X0fWNRSM9ZepSyf50rVJc0TZnDUuCqUtiwYO6A6+/yO/K5ZRwer4/0VvqXKMUV8xi0+g0VlmsYd/EFOYr/evm7xG7sl2QNGq5B+L9d2CpDbIlT3Bi6zfd1zMq60bQZT+HKbrXzPnZfdYHgKqYhsHzwFInJ1fd3YEbg+4aJt1IVcy2bfoZr4OnI6HUBQY2DdJDZ2ikeRw15FfWxw9PpvNmj5f7Rt+NyN3NCXVG34sJRqIR2Rcf0M6xX8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mmNggew7jg1HiUbWMB6GQt8gohyZ2aZsia8uCT4+6ZY=;
 b=lZuplqP0MQCvoMkj/aGtghgIiqkjNgCUXnNOooC2DbiD0H9fEZgDNLZOu0sIYao6nWCF0ASStY3/J+EYqKMJmQzS9ydHj56rBRh1dpNXKL61rHGrXYofYp2s4sw73MGEXo8hdpED4LJKjj82y/RC5Hh0m7dp5I7gmbKfcN9s7scIR51I7nwc3KOAjAVTGfUyeIn60+jMb0Fu5Hm8kdRzpCE2xoMNvU9WO9T0U5h8hleetgi4Zgg2Oq9RoThwKUw011NL5XwS6ClPuezd7Npd+kZcIgvpkpNDtZ2daEO9ofAxtQDmdxqtdoYuYe4OKAs5MNE+cqzKREoxh5o7jeKdZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mmNggew7jg1HiUbWMB6GQt8gohyZ2aZsia8uCT4+6ZY=;
 b=dAs0csxS4rw2I064G4ezHGwQQrcttCcGdTaksyWfmOBHvtp8I1KqsCfWmEEAiAc4O1nAeLCdCUH5XtS03NkJbGFK2tG2cenKE+LR19bZuTOuwCsNtq9MLG3IasnNg6p6m6d89qV0NFPSBb5bPrjpMwqdhnbe+khroo+H6tbOJO+989h9gCOJ5uDNfhATQ8TlSYKdEQcWSkIQm1huPOpUadULopZbAbRfVOAroinelJ788yXFUJdzewfsCzCTEkBiY52KMXmNAQLAj3E3s6FiIDMWdnxHgfLo/PunyAqba4UARgpcKn4HTF0xvuxQnA9NhXImVwjCQBUa7GaFNK5Grg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 BN8PR03MB4916.namprd03.prod.outlook.com (2603:10b6:408:7a::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.11; Fri, 12 Dec 2025 09:05:31 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9388.013; Fri, 12 Dec 2025
 09:05:31 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v8 0/4] i3c: dw-i3c: Enable support for dw-i3c controller NACK retry sysfs and DAT restore fix
Date: Fri, 12 Dec 2025 17:02:54 +0800
Message-ID: <cover.1765529948.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
X-ClientProxiedBy: KU0P306CA0061.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:23::14) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|BN8PR03MB4916:EE_
X-MS-Office365-Filtering-Correlation-Id: a09e38a2-a0ae-4a37-d975-08de395d9a4e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?U5yorhaPIkC24CiEhfRm9skeEWpCgRDzGAhprskLzHdxTvK1WzRLUuJrqntj?=
 =?us-ascii?Q?dw1vF+ogaf852RF8QUBaQQtanM8v8s2BjoYUQYxCv92nXW9NwOLNQx0ig8m0?=
 =?us-ascii?Q?77IkZdvc/4f1db9ktPIFiKKUGfAKeUkGoRGgrA+SDwjQVRJJ95Pbr/0ZLV9J?=
 =?us-ascii?Q?hMSp5xzuqkbxzmUXZVwmy/U780Ha2UxbxWymlXIdJY6Pys3hjjJpP4DjxBKG?=
 =?us-ascii?Q?T+yTHNsesYjhY3iGEjhsGgNNHWScd8/tyk23eNPRlY357B1p8vID6QwJ4VJ0?=
 =?us-ascii?Q?7iUvyUPCbmiYqtYzdqYVUB7f5EVquDJ+CP9/h94VUJtKGLsQYMf2QWlkMUbv?=
 =?us-ascii?Q?j6J9zU8AW00+RxWnXHXWILk6BVAS2vdplTxEPMK1rCH/RcepbMpCpYL43Yix?=
 =?us-ascii?Q?uEupZ5Rif6uidwBh13fFePdLeYdP0Qi1Wm+nGxlhvRR+TocSa4EQdQpK02S3?=
 =?us-ascii?Q?93NHmnS981DV+tS/V6yabsHOCnsks5r343H6+Qt0blmwLBDo1GSJ6zJPRxw8?=
 =?us-ascii?Q?mA7DryXc4QmgMt29uP+6qQYL1F+atOJ3lmgzySVwu3nmjUFTV1vCG7GD8CO+?=
 =?us-ascii?Q?0L6QTZKU1iLcxXfS9CGCPY+7Tvi+7akLRtA8+qz5VCaBxWYsWVGwA6bM4/sU?=
 =?us-ascii?Q?mPcY7oMIIq8I3bJD6OlEEv+vsGaGIrfzztL2EyRf+facpT/OES1Hpch+G9Wx?=
 =?us-ascii?Q?SUpMI38JOHjV7OrN65P9kgYOfKnv7sB80MUHbiukrcGqMTRjc+NIE3YOjtbG?=
 =?us-ascii?Q?94RZljpK+FFYvFboxIQOFltGCjT0lbr21Kk/MHH96TM5YoOwhDAbvkb8mzfa?=
 =?us-ascii?Q?zEwrUF5E037x7nEId3m6zhEkFp5E1XjmcpD2DzrBHpqPvDQT8CpiE6H9Ww36?=
 =?us-ascii?Q?kING/0AX4sfBc+lylHXFGw2L7PN9+XlsO7C5WwK75S7WbR0zolV7FdeZ4ePx?=
 =?us-ascii?Q?wWdAqeaY5pMFw3Pds5ikKfxa8IDhV3PVn2emrmLdUkMSv4ITUEPDQW1M2cuI?=
 =?us-ascii?Q?ltUO9WbmsIm9zFLID4Yb/fwDsMWa1QJ3ZM8+w5TeDRB+OzwpdcRZcUoPvtOb?=
 =?us-ascii?Q?IJNnbBGnyvtHefX4yYGtitDl/wDCT/Rji49prDtapOTVzi398i4gvThlD+Qd?=
 =?us-ascii?Q?yrF5ioQDssDw2CSOwA+dPicR6nsflyAuy1uWWz7Hsc9Z89/8NUtVJpA7/1N+?=
 =?us-ascii?Q?nNco9JeS18RFVE2r/OYbEvJxjVoXL5R6KnUf590Pq3lRsfvPXEwRMQC1/QSM?=
 =?us-ascii?Q?mYupVjWr1NkDkOcJG5FAAVtVt9EDW38cE5cjIXviKAXjpes1oMwfuH1GzCiO?=
 =?us-ascii?Q?ON4TUTpw0kToDFiMvmH/1XZkvEoVUt7tWqG1j8z6vWd7A8SJuqZzBloiRJWq?=
 =?us-ascii?Q?utRBgsLc/Q+ksdJlq2qTwvPZhE/vijYMgBZrb7sg737AABIqyDLS/08T8s+i?=
 =?us-ascii?Q?Hldo8VLUWRum85yHIYEDoGedyiRk4cDf/z4oI9kG/N+AOHycI+hKoA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t2KXQM+bSD35tiq1M3HA/6hts9zyUScqGjXGJ3mh+xvUtAcbk3VELYaP67Pn?=
 =?us-ascii?Q?yiwt9nQYs954YWhfMa8EQW7x+pqvoIGcgFSql80Jc/XPfLBsviBE79XhODZW?=
 =?us-ascii?Q?lywyMNbX15IpH23dWxl2Vhb14QzBx+2oIUoeM+hZowpdMQLGFeex0Z9O2NUE?=
 =?us-ascii?Q?aY5Nb7KjV/9C+lLcM/4n0qHQtCXvhyeBSgzuPU5FhlHJAYalvMDaBkjaw88w?=
 =?us-ascii?Q?xZfhr9HyVoKhIyLbsTL9Gn0cDVp4e53HMsWH4DfFU3q3s8/U8SPVAfoD9wSE?=
 =?us-ascii?Q?yKluoOgjmbuw/xQyu7X+ZkOlDTX3WehpYGAQ53dyDB89bmNygYhr1amgw1Uj?=
 =?us-ascii?Q?U/fS6tQNeNAchXgFEo0uioH4UeRsiQEM/o4ZO7TTr5Kkme0gYFy6JALR+qjA?=
 =?us-ascii?Q?zdNF1WGTu/qngkpxhxHbvuUfC+zDgyOIciS2MKvRjIX2h20A4TQKuJlDweGd?=
 =?us-ascii?Q?HVHRhZ516oKbqjhYLZTcfWgD/DMWR8Qxlqes5ZGBFIHa2ClAcgsCG49Oo5Bv?=
 =?us-ascii?Q?Ox63Xnw+7s5/73MctR8VPygkHK+Ct5xMpGBhkCxXa2jZBZ62alQaSulPuBTZ?=
 =?us-ascii?Q?nuV0bM7TkwCz8dqojqJXcrOcBO8whwD5InSNP9NsqpSzBBfcX9n0exjEgBxJ?=
 =?us-ascii?Q?VI3MtNnefrZcYTR6N0yH9zB44RpvP7h/Lbw5kOFMS6JBknPGE1RDS19h9jVY?=
 =?us-ascii?Q?z8ghDUbtYnIDETQknaNjvxPxsB4hw0xGXLTqEihVbcX2LxuKnew8rWypyTRF?=
 =?us-ascii?Q?0X7mKd00RcabW8hDN49/QG36SGrgfy06JzfOjS1EFj4gEata1Rh7qx4FFrNE?=
 =?us-ascii?Q?WVcnYX0aubgI7ONwf757A95CxibincJGclC6uOxBtTdGoTJ1z6Op6uQ1CTHR?=
 =?us-ascii?Q?eQeKccHtye41UhgbYPnrZLo+EXPxtArNaoV3XbBdKAFiDUA5Gif/ImrsOBmg?=
 =?us-ascii?Q?ctFxTpHwGLrkGGLvldZu3niTGON5PNtnl81+3wTLdGkcKleY0Hn5izYp/3Xd?=
 =?us-ascii?Q?/Z6uIO+0LBONuHxijYxvE2aXTGLAX6TCQPQMb8H5L3N1r93M4h0z++gEyWGI?=
 =?us-ascii?Q?lDCfVdbM97isFDQ67l9qJk6KG0v7s6Bw8yzc16/wd8EmNFjmbOl7ZUrdg+jX?=
 =?us-ascii?Q?mvsVGSdbWFKfeaqnIkgsjmhkYlURhbPJlf/XIthUomi4E5EAoiP+GDj+/BGZ?=
 =?us-ascii?Q?Epdx4ccWaDBayWl/qjquO060Ah3EZ3dqXTY2/Qt68m79F38dNuhdcTd7Fwy9?=
 =?us-ascii?Q?u5bEjb5dz6Y96+neR2CV6MeSPVHnZmtuseXvIHXQkdRxIWHT8epiR4g2BSqL?=
 =?us-ascii?Q?Eq2M9vXnY7faInqLQxv3WKsOPlrkoj/HbQ/kPlxeQEzR9fjFNuryRgNo4oCC?=
 =?us-ascii?Q?0xmD3KNCVt3TOBygnrDkTFzlU/Yi4yxSRCz9ua8dQkYf+QgqU7jblvnRCzLp?=
 =?us-ascii?Q?zL1pca7q2L6ApM4xbBummRDtyDIZoyal1TVvUIhMVJJWv+FY+OnybZUsC6ev?=
 =?us-ascii?Q?YIogKQaSfYX6+b1OzYs2hu7lXpx8op+fg86qJN/dLnyHnl/VJgOQtUoSKcTY?=
 =?us-ascii?Q?/Dgup2auz5Rf31kUI+lrdy3Wqb7qmOqOyO+pglGRfPWISDIDPeo0WOAjbCZB?=
 =?us-ascii?Q?mw=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a09e38a2-a0ae-4a37-d975-08de395d9a4e
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 09:05:31.8252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4tK4+6vk6N8rV//MQPNou5WH+35c5FKJMT0tYE2C0oPr2O8QPIGxSx3A1+rOPYLby1U6gv0bjafESkhyRoX/obXmHbD8BU1fnmhQ4NzCUKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4916
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_010538_297848_E5E6B994 
X-CRM114-Status: GOOD (  12.05  )
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

From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>

This patch series adds a controller-wide sysfs attribute
dev_nack_retry_count for the DesignWare I3C controller, allowing runtime
control of the automatic retry mechanism when a device NACKs. Some I3C
slave devices may temporarily be busy and unable to respond immediately;
automatic retries improve robustness in such cases. Writes are clamped to
the hardware maximum of 3, and the value is applied to all active DAT
entries.

The series also fixes dw_i3c_master_restore_addrs() to preserve existing
DAT entry bits, preventing overwrites during runtime PM resume.
---
changelog:
v7->v8
* Squashed patch 1 and 2 into single commit.
* Refactor and update naming to match sysfs documentation.

v7 patch link:
https://lore.kernel.org/all/cover.1765177110.git.adrianhoyin.ng@altera.com/

v6->v7
* Update dev_nack_retry_show to remove redundant i3cbus variable.
* Refactor dev_nack_retry_store to store dev_nack_retry val only if
  set_dev_nack_retry does not return error.
* Update set_dev_nack_retry in master and dw-i3c-master to take
  additional param which is the dev_nack_retry_cnt.

v6 patch link:
https://lore.kernel.org/all/cover.1764746266.git.adrianhoyin.ng@altera.com/

v5->v6
* Use dev_to_i3cmaster to get i3cmaster insteasd of direct assignment.
* Remove redundant set_dev_nack_retry callback function check.
* Update kernel doc for set_dev_nack_retry.
* Add macro for dev nack retry mask.

v5 patch link:
https://lore.kernel.org/all/cover.1764663888.git.adrianhoyin.ng@altera.com/

v4->v5
* Revert changes that made bus_maintenance_lock and
  bus_maintenance_unlock helpers public.
* Move dev_nack_retry sysfs attribute to master.c; create it only if
  the master implements the dev_nack_retry callback.
* Add dev_nack_retry field to i3c_master_controller; updates are applied
  under bus maintenance lock.
* Add optional ops to configure dev_nack_retry in the DAT entry in
  dw-i3c-master.

v4 patch link:
https://lore.kernel.org/all/cover.1764571045.git.adrianhoyin.ng@altera.com/

v3->v4
* Make bus_maintenance_lock and bus_maintenance_unlock helpers public.
* Replace taking spinlock during DAT update with bus_maintenance_lock.
* Add macro for static and dynamic addr for device addr table.
* Replace GENMASK calls with the appropriate macros when updating addr
  table.

v3 patch link:
https://lore.kernel.org/all/cover.1763747151.git.adrianhoyin.ng@altera.com/

v2->v3
* Update commit message for better clarity
* Update function name to maintain consistency.
* Update store function to return error when retry value exceeds hw limit.
* Add lock to protect DAT to avoid concurrent during transfers.
* Clear the address field in the DAT entry before setting new values to
  ensure correct dynamic/static address configuration

v2 patch link:
https://lore.kernel.org/all/cover.1763703573.git.adrianhoyin.ng@altera.com/

v1->v2
* Drop dev_nack_retry_cnt binding and device tree changes.
* Update commit message for better clarity.
* Update to use controller wide sysfs attribute that configures
  dev_nack_retry_cnt during runtime.

v1 patch link:
https://lore.kernel.org/all/cover.1762245890.git.adrianhoyin.ng@altera.com/
---


Adrian Ng Ho Yin (4):
  i3c: add sysfs entry and attribute for Device NACK Retry count
  i3c: dw: Add support for Device NACK Retry configuration
  i3c: dw: use FIELD_PREP for device address table macros
  i3c: dw: Preserve DAT entry bits when restoring addresses

 Documentation/ABI/testing/sysfs-bus-i3c | 11 +++++
 drivers/i3c/master.c                    | 39 ++++++++++++++++
 drivers/i3c/master/dw-i3c-master.c      | 59 ++++++++++++++++++++++---
 include/linux/i3c/master.h              |  6 +++
 4 files changed, 109 insertions(+), 6 deletions(-)

-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
