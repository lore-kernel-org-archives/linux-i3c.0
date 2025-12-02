Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DCA8CFD2F6
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Dec 2025 08:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0Q1uKBXP89eBWieRGPnpOk3AxxhVRwXY+fhYiyrbNvw=; b=Zsp0sp279ydqKf
	KbeRkh1EdZbaVfoCEgGMegDSuDiNR28zU0aueTzTr/YTuQL0HR5TaRVDBYMaJp8HTZZJGfr7uN7db
	/7tPOSljI3a7d6PzeDcz0JkxpkpRXTcTx+bc2c2ae7dWcjxUiA6cu0aRncRA+dnzHwH1U3oglXYcC
	PRZHcCXvmzn2L4hICniPlkXPToAVknRo+IBg8po5AtDR5K59IrM/7ZPkdIV4zM/SFndDTw12Zm05x
	K2cM9yZne0t6/xKxLxYnRfwEpibi9boYrWTD+ex4JbcyniJoDwDY89Qv9tHiwveqtpDtxInrXRbs/
	C1zqVLTWrNpZnDbffWVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLkm-0000000534G-44vi;
	Tue, 02 Dec 2025 08:28:56 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLkk-0000000533v-3kKO
	for linux-i3c@lists.infradead.org;
	Tue, 02 Dec 2025 08:28:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rby2+HiOCyFajQBxrXs+g8i+pXEkoPf+mng2iLRAEgVzigPqf3adETcxoQC4DmdXq0a6SfJYhbklcN7wukNMHNYbxArjLPjunHYeApfFT3K9W5wexg21D4zeVma9mpcMJ5MUaElkjTmShAuA8rZ/FdoZRboC6QyDeqFA6hzWs9oq41n6W1KLh8JfzxvT/x/mPspGqIcBCD3L0Wu7ItJAp0AKJi+fkaVG7Rd7liRvljjq/NR2IzdMvN2Ynyl4it4OMCfjinPKc/2gCtX//PsYMIKxBfwSEBC8kuOi4DAwGbboMb5rECMfwf0fDhR9tJP5AkT0crwPPuKTZNBRfc1m1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=03hUBDKZUFuJ4rRcpav10bDvz0pi74ThKEML0lGPz58=;
 b=ybtSRbZL//+Df17dMW8zPfbokFeVee+LhEViBQIx9YGhctzxhypz6KRu1CUVZHaLFzG9aJaL7J0bdgpgk7daroD4gU8PNKo5uVjwzD9l0DetxFgtwVtU2/ZlQPfnGKWy8L4hIUiPTN4WDLt0c5MoFIPk97BScamKutc7Zv1AoTkrClxWpW/XF7qZCO0Z4lg6SmvpBeyRNMjUq9q7w16NOPnh433KLdpfAES4TpUPIcNlcuB2Enbe26pfOTWv+0oD1HSNpvk0WnJZ+aMzuFj2C5whxPJTnWbXfEgJnb/iqCx1jFFn7a5uroiTXvePwYwk7BnvseBXB0+iRWxUW3boMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=03hUBDKZUFuJ4rRcpav10bDvz0pi74ThKEML0lGPz58=;
 b=YvU4gzmXHP89r5mLEVc2NjLC+V09qFgMw/5IkbzTxxewC+DY5hMWLyYCV7vJqU7smuXdWMGlcgkvUgfEeKNouEnQ3RiFss/uxZrBOfzzZdTyjVqhC5nlALx35FyC1m4I5JAmt0dZF2se+wtBk5LXcXW0IU0zqKb/biwbBvwjIMXFZUtWrOQ/n9qvZBZVKZO1xPEoUkhUziGTZb+cDbdWeECPC32B1Sckjrco+hH/aSSNcJzSiINi9/UirU1YXa/ULboimo412bVS+tsegTIEw4U7f7XgpAQtXHAyqo4AyZsxhCfitrj4dY88uo6P2s+fYP47xWY6D+bDFdAaG4EquA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 MW4PR03MB6459.namprd03.prod.outlook.com (2603:10b6:303:122::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 08:28:41 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 08:28:41 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v5 0/5] i3c: dw-i3c: Enable support for dw-i3c controller NACK retry sysfs and DAT restore fix
Date: Tue,  2 Dec 2025 16:26:08 +0800
Message-ID: <cover.1764663888.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
X-ClientProxiedBy: KL1PR0401CA0012.apcprd04.prod.outlook.com
 (2603:1096:820:f::17) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|MW4PR03MB6459:EE_
X-MS-Office365-Filtering-Correlation-Id: 7426af02-8e5e-4016-5b81-08de317cccdb
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IxJBFsVztC4HGlqsWhzTidMDefczLP+qpnPOeNDXU7KSAeEQwDO3jc7TmBmn?=
 =?us-ascii?Q?QSWFcn0ANKpcmd6klho08Mrf94Epzn4htpV366MF05FqiBR8/1yTyLSPcoYM?=
 =?us-ascii?Q?EHN2lLfUYBQGyR4BeeL9Ba7FOeQ7m4QgV0guxZXpUStQ6eWzgVuX1f5YJQ04?=
 =?us-ascii?Q?NLAcMrQIIsvFiJmj6Kzq8sqqewk+XecjzODo3xkzAkDSOV247Pk8vUPidPLT?=
 =?us-ascii?Q?I02cqsmA+/Ndpvrp0n5+zgtnRMTL+8OszD+V8LPHtsfgzwG5YsyEvIHqByCO?=
 =?us-ascii?Q?IwRpdA7gdoEFxh3ZOoWSQ0to8Fd4QNGjPj0jFPVmFbMfREvRGXXv3FD0O/BS?=
 =?us-ascii?Q?UOwyKlH121udhEO4nprJpfgYVgimnZNj/If7Tn8H0kOymavpmBrbh3N4HgsP?=
 =?us-ascii?Q?TFcVUU0b18BFhYcnqhVywW+tHb5c+EbA7iBpZ+ONnNyVnusm8+ec2zUMkkab?=
 =?us-ascii?Q?1uzaHyyQBnG5/BWRePHtTvcmnFeT0zGMB3Bt1W0UPKHGUNPTCn/sdAhqH0aK?=
 =?us-ascii?Q?rTmxT8a00Mo7+KCxE1nWZADiL1kh96eRsCiAf9oew56oeVbk0/RVDp6AYrFe?=
 =?us-ascii?Q?1G958mBKjChk2V8v274aFfAsZoQVh/Oi2pOwjH+m7SYV8O9+JEyP8b5GER8F?=
 =?us-ascii?Q?dvj0ldMnIgGlQDmcKrgbYlIw7iM/MEFLOUP7UMFDtwB3BzcPmUgNNLGjOTor?=
 =?us-ascii?Q?aqAyKuRz0QDWpnqBzKUThvdMk0XQDChY7WUXMTTERme66TDjD7/NfpRhUPxF?=
 =?us-ascii?Q?vUqD9upjLEkkHKDLMXptVT+5vNsVqBtsVezRqT/zAhbyyfbqpRNCV6B1H5/R?=
 =?us-ascii?Q?RXop0Xtfw09i0mOkl3wHuP1mEmWKXlwYi/kvFPdSMusmYCyZqKWK7R7Bu7M6?=
 =?us-ascii?Q?cz/hDgYm1VDQBMjKk113URHz0/hf3VMwQlIbTfKDstLRhmNoQd0UgeRb431O?=
 =?us-ascii?Q?1cbHjXzpBkNQyJ/TLHlW+TUGVOf6i+7ZN/DyK6lcwj3mry+9HRi2+xLyUBKt?=
 =?us-ascii?Q?i9YyynOeHiVMK4tp7NGcVc76jxGpNU1cJkd1fQ3jmmZmHu6bjM9KbxDhXF91?=
 =?us-ascii?Q?7/b7FKSeUIUbqBIA5MwIuNFBaEgKZZB6um1VhsNpO799lH8PtsppCRJRl6FL?=
 =?us-ascii?Q?oEMr+4wP5t4fJWqI+xPJ3VYAmEHDqqUEd80v3prGyz/jdL6933MVxcWBpmeo?=
 =?us-ascii?Q?wq8UxV/u3b2Ru/WQdcJwXBErIap1d+JWIEDNNonXueLErecGrUqE/UOIMRhQ?=
 =?us-ascii?Q?RrYq6NScAsfBNLz18Vt8MXyT44w9UYjEcgWEvRjQdKXB31odlHzaX+/4L6z4?=
 =?us-ascii?Q?mwamS2/qnv+PENJASpN1TvPbDZTY5yb+Ba9/P+RMQ2NlbdKFZrITjptp5oaC?=
 =?us-ascii?Q?VlI0tt1M23d3Ge66ZwtSx6WqqhY2zRZEVbKVZpZrJhw5x92gE8jCJQwaYXWN?=
 =?us-ascii?Q?iUqvO5Rmq1ThHV+7gneuiZiFQgInW2Grxk6Etzk/MStdjSI85WthPQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1QJUoAUkAUDgUORwxhPbmxriaqTmPF4OVjp5Dugq43T/YWQl8FFm7o6woEih?=
 =?us-ascii?Q?xAwkRIocylo1gHYP3MBHBQ2Myt3s9h0Tt/ti0aEAXJOtQ4OsbV2dGi/ZZcus?=
 =?us-ascii?Q?pSbsMfOb0u8HMVxZXWUqICnxFtn7n3GIP30EKAks0BNjL2OYDadkueq4+Eqt?=
 =?us-ascii?Q?LiGZk4Gbk6ezjA/bhpH3MOYTDFwEXN+q+Hm1IOaOI3vKkhAHd64cmKv+j+1/?=
 =?us-ascii?Q?QD9JBKNUdiUjsxV7UHLwYLeua7GSbfDB2d1rKf7VhH1AupqnGrZ+5K9jRue3?=
 =?us-ascii?Q?18m5IJgYf0cuLcqgxWOjjBhTP+eY6l8z14TvBfIz7ZvzmeE0xeMIUGanR4iQ?=
 =?us-ascii?Q?KcTHX9xLQvb0OuWxFGSqHOcI9qCJ0ECE5vyfdFZNJ9RsxAr25TEWkBcetXq6?=
 =?us-ascii?Q?o4c/CCaZKRks7Mj8sH0v+DidkbRs1L7yzBAUPHyntcUva0U/w4J5YWcl7c3q?=
 =?us-ascii?Q?5WwkEKjN9to8+sIHbt0XJ6A/htSlel2UPSs4kc/V/ki+ADXulnzjTVLk0cPg?=
 =?us-ascii?Q?Z8MDmKMixlhNoNmPR4Bzi8RQXCdqnisWD0NzwrjpHD1gnKRWxmXksSZifiQC?=
 =?us-ascii?Q?R891cJw2lz6v4rYmAbjZmp3r5LcbD6/Do1WKli56IXYwSuUVbsStyuHdMETI?=
 =?us-ascii?Q?j2e40E9M94zLYaYByazwrBftslySb44mrjKscrZ4nlG4oheAJzKpbHY+UAuH?=
 =?us-ascii?Q?He+0I2Ail7pBePBV+3MJfFpJlPwMYa2bib0Kdu02uRsIFSxZ3XsUEXD9ouGI?=
 =?us-ascii?Q?XJ0CLorjhIquPnkE7DrQqzbbmN6n/Rax1JE3jK3wyCgl8VWI/MPR458xSsr6?=
 =?us-ascii?Q?YM/3MTOmeVEVmHAyH/xqAuUXmBxTwEY1gNcTfg5nf0EeP6V2UpuobcFCw821?=
 =?us-ascii?Q?glUi02D6jkr7gV/xrZ9Ur2veBislK0kMP7zTww5pPKvV/e9tCROskUHuoneA?=
 =?us-ascii?Q?6Yo4kWGL5IoioQvdXVimjTch85zwSzn9MRa81yAzuNlMn5j7rX2o9ThRG0eO?=
 =?us-ascii?Q?ofYAdkocJZIxRNIzVRkMui1jWGfvULvXix8sr/h1kJqm6zJAESatK0Skpad6?=
 =?us-ascii?Q?sx2ANClHUzAB6Ry22YzZGukVRKoOlOFVw6gufRYss2z2r9ExsmhEZU2ZYXtn?=
 =?us-ascii?Q?clYdGBdJ3qmwukZ+Q40cRqw8hSqL04G0X7kn9fuObiaWuNiDaeGr2V8eOWAl?=
 =?us-ascii?Q?idKMKgYyGnIuZYJEL1kH3qtEzyxzz9i7zWZvagb0nFhq7DWXHiFq0Z0zI8uk?=
 =?us-ascii?Q?ujGKO4D1hxJI6yAvmG0+V0orDokKJnsLzupqaBITZrzkCD24/pTtxjQ55Hhn?=
 =?us-ascii?Q?Eit3YP781cH2szJnsok3hpcmv05KWpplnAs4zZU7RDtv2nrGOinLU9e+F2ex?=
 =?us-ascii?Q?/Fy9DTBvfhH/TX3vVFE7UTjQibw/BfVmpo9U4QQAAPq7FBkuV9qma7qaQvRX?=
 =?us-ascii?Q?FBG2kiabL/8TLeCW8rgCG8qW2rECIqzkcjK4S46U2q8vwN5HaCynTh7XI/NM?=
 =?us-ascii?Q?r3sZIShjKEu7gboEtJaF3F4rjplXfo19Ui0elvHqA7/toFDs08iXFMoqEHJQ?=
 =?us-ascii?Q?RbVB3q/Byw3s36uEeK/GhnaS/gKgvM5TdLTiQ8coRMtoEySDNh3I7S5F+6IF?=
 =?us-ascii?Q?+Q=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7426af02-8e5e-4016-5b81-08de317cccdb
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 08:28:41.7070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 92ZyUqnBylDDzUw9S2PouMkTzVizgXaE2GxUZQoH57nPkXNM76FUQzog2itVZh/KvRL/souwMR+IrXlQxUAodBO96uVowVcDdkeAJubPSIY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6459
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_002854_974242_E10B3225 
X-CRM114-Status: GOOD (  10.10  )
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

Adrian Ng Ho Yin (5):
  i3c: add sysfs entry for Device NACK Retry count
  i3c: add sysfs attribute for device NACK retry
  i3c: dw: Add support for Device NACK Retry configuration
  i3c: dw: use FIELD_PREP for device address table macros
  i3c: dw: Preserve DAT entry bits when restoring addresses

 Documentation/ABI/testing/sysfs-bus-i3c | 12 ++++++
 drivers/i3c/master.c                    | 44 ++++++++++++++++++++
 drivers/i3c/master/dw-i3c-master.c      | 55 ++++++++++++++++++++++---
 include/linux/i3c/master.h              |  2 +
 4 files changed, 107 insertions(+), 6 deletions(-)

-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
