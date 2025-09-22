Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 072A4CAC5A7
	for <linux-i3c@archiver.kernel.org>; Mon, 22 Sep 2025 11:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fjA9SW7WNcHorVoXqnj7cexlF/veA76EbZ6gI0yJro8=; b=O0u0iia+oxb1Oo
	6FIvLRM7x/bTBTUhEmL67ktg3qPLQ+UYGRQHNtx4/B7OeK/THiQRoODn4UTFBKmmnQTmgvsoDTWe7
	fFn+zmdpjFXEmPIiOMgOHaAyr1Caq2vvvc3rGiwXvawmuRbIxLDeR8I4VnOOG7ZDpiuV4jFli1/0p
	N+bI6gp8XGssH9pYwkFA1d/AAGPGlmIVGE9jXVpKiZwRrFnm+wRgg0nKNGijlfOpVEEJ6q2Ys/OiA
	PIErbEk6BMCKDhV0xwxkTZjogyEnxQ1ZrPqlXuz/GbVGfUgPs87gCPQO+2VAN9voYiJMNIdq6tA6y
	E7TlbmNxpSAMw58zum8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0f0j-0000000AFj9-3Jdt;
	Mon, 22 Sep 2025 11:47:13 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0f0h-0000000AFin-1ynl
	for linux-i3c@lists.infradead.org;
	Mon, 22 Sep 2025 11:47:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sic+YGIYGc5D1zX2kRS57672qkGvSkxf5xg6jQJEEzTE64sIE0V7X0Xw/0vekOhCj67KDpLo3vr00kyZSd5KhvxX2kCxMoWnd6Ykb/IoJ3efuyfFCq7rKBs2c0Zd+KGicZ4722m4T79aHKigssg36vC5TiPzKEXH3w2M/LKy0MBcTCRmDesbsIMKB/DR86lvgqJfCH9Gby+/9id7mlmo4JRd/uI6IaGp3ToEL0WL5me56RmEpbBDTQBgK1qK53+Mh13MMx5EUqwIX8qEmbFySgurQHqtTNneAoSsGVrePDKJO7QC+vtEwaI+WNpYEVHUD3zZokhEyiJgj+L8V24EiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2P+KwauFmeZfJ+OOUcd0ayDFtvnF2Bm24h5PB/z1CI=;
 b=cY3rYSYSOnl7lACBKLAcIQAlp8IfM9W8nGoWkaVgzFoKgZuJw9DwjG/tGaQiuIR0h/pt1PZHke1qB3Pan/vY3CP+k/iA0nbLXvMSQBGdt/eeKl9H8A10CUTbzCWG8Y/a+Rq5M3ZJBD5xUslGEEw0mP6QUuvcxXHsqlh7BDFVdYZVhBt7dCiDaAaBWXSj63T8FBdZ5+lSoSF1Hnl60MjQfAhdJb468/9KIwLlZcy6wACE/l2pHrokqkmx5RtY9nqR/ars6a33DOK3qObRP1UN48tc0b3pq7MF1S4atFqcw9Ss3f3XuGJ0JDG3DuEl5toO2JTbzMliwVAvAtn/Yhejyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E2P+KwauFmeZfJ+OOUcd0ayDFtvnF2Bm24h5PB/z1CI=;
 b=MuQ9l9j+0wTY8Zmar2BUfh8Es1prnyBdqTzqaVuRdHdVQSSepArXCyuEbGviene5vXwWIOWz4oLf4MSQa8DvYNr3Ai3Jew7pAHzXiEBsfpfBKE7AtooqLKkNCjiifKc7tU2JBdLW453sY5lUu3RIB6WaY8nL0a0P9Y/Uxmhv0GaUZuyE0GgB3ne7RZOTRipJDyiWM2JNMCzFNnzrBtLlXnzrxw3FPFp88XnUH1YQCUn0q7V7sNup6SA7b0QsHgFAuT8mgodPHJx/+qRgcA/K8l6ozwgCBqucaVwWBXuLnrg60TutrnvWZaA+6E2Mky6bGutCLHCy576ZhY65LJDsNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from DS4PPF71D32B30E.namprd18.prod.outlook.com
 (2603:10b6:f:fc00::aa2) by LV3PR18MB5567.namprd18.prod.outlook.com
 (2603:10b6:408:1a2::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 11:47:02 +0000
Received: from DS4PPF71D32B30E.namprd18.prod.outlook.com
 ([fe80::7c46:661:da37:dc33]) by DS4PPF71D32B30E.namprd18.prod.outlook.com
 ([fe80::7c46:661:da37:dc33%7]) with mapi id 15.20.9115.020; Mon, 22 Sep 2025
 11:47:02 +0000
Date: Mon, 22 Sep 2025 13:46:58 +0200
From: Boris Staletic <bstaletic@axiado.com>
To: Frank Li <Frank.li@nxp.com>
Cc: "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Subject: Re: i3c: scanning for i2c client devices on the network
Message-ID: <aNE3MkhlABIHQ-J7@axiado.com>
References: <DS4PPF71D32B30E58BEEB807E76DA5FF106DC0EA@DS4PPF71D32B30E.namprd18.prod.outlook.com>
 <aMmZnG/sbErB4Ly4@lizhi-Precision-Tower-5810>
 <aMwT9S92IpIOT_Gq@axiado.com>
Content-Disposition: inline
In-Reply-To: <aMwT9S92IpIOT_Gq@axiado.com>
X-ClientProxiedBy: FR4P281CA0388.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::17) To DS4PPF71D32B30E.namprd18.prod.outlook.com
 (2603:10b6:f:fc00::aa2)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF71D32B30E:EE_|LV3PR18MB5567:EE_
X-MS-Office365-Filtering-Correlation-Id: cd179ee1-5a12-4c89-d39b-08ddf9cdbee6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ENGNd/hwJxoh0woDstdNoOjlC+bX8iBiieREV+GubYn3+ljdJ8YdE0V9Y88l?=
 =?us-ascii?Q?1YOiYff0eo5IuquL4WrQGpZhTkKpqmR39KnI+xC27XcbRC+/AQLwdNAldpnj?=
 =?us-ascii?Q?e2j89Fla+40Gn6Gn6bmKYryjOH80KhgQt23h+RLfgJ5do4888FWkRVY7iXOs?=
 =?us-ascii?Q?4kmczMsQIonFhctvk7Mu24h6BSm3z6rcowCRyu6R5e61TxDR8Q9vZslmgnNF?=
 =?us-ascii?Q?Yo25VdZ7GqGDKP/ro6Qx1bB2p/ur5g214vae6WcpbqvNY1yJUxypDQYKtJRz?=
 =?us-ascii?Q?dlTuZOyGkiH3oDi9RdU3mym2Pbn49P8jeNYopP9J785r9IxvvqRtEO/AMffQ?=
 =?us-ascii?Q?UqwoxksOsPbwZNV6VWaGIqujQpGfy2pXopFHuyAEA4U+w8RsTJBXxd8Gv173?=
 =?us-ascii?Q?nyUb9jJ6d9mGv85NS1mHJUSd7OoQmdhe+gKbhjTGSveev/MvofaYqaIZqvuE?=
 =?us-ascii?Q?o/XayTiB4AidBnMAXpaYe/XQW4A2ijr4YGICUSNx8FYePWtWTc3MSztQ0+4+?=
 =?us-ascii?Q?tDO1aW4mGL3WMTbVTguTE7fxujQmKUFqvWAKLWKg/d1Mb6y7MwzyVMiPZ0w9?=
 =?us-ascii?Q?YMBCnuu07GnJo7j+a8jCJ/3f0Yn5q/G+STA7UoLsFPLNaG8kXcuR1WgvNv/2?=
 =?us-ascii?Q?S3RGO9tZmc/shwPJ0HvlJFLQStXUxfLaE7lkQhQ8RTVvwwk4hjwgJgeylYNU?=
 =?us-ascii?Q?e/9biDZe5l0ACWSCX0Ttizza5CUm7b3sU7+jFqVq5pv0pvUMaRETant7QrV5?=
 =?us-ascii?Q?EytbLGkEQ3JBWQ602eerZrMZuUNET6mzk0jT3Q7aNSM6cJ+SDEWy4jOvS3aP?=
 =?us-ascii?Q?O0F5qMKNICrzh1iVSvykVzgF8+8c6KZ4K0N9/vjtvVtKlW+3JS+nSFKTyxeJ?=
 =?us-ascii?Q?/Mc2JyjmuAjr8nou93d7HtFM5UGTKJgCdG+cgx6heF+jmL7IWeBzSHZKCriM?=
 =?us-ascii?Q?TSir2DOv93B4koetaqtAL2A6IT2l5YoawSrQ58qzOWivpiziFXpZQNKqLHmd?=
 =?us-ascii?Q?JmxIQvjdbOueJZvWVJCzihyb3wx5U6hnlfO9aEw2MlrNxLnwS4pld1KUpVp0?=
 =?us-ascii?Q?Jw0pafaQkFRY0jst/BJB2W7cyY/FqzGeiXLAOz8RVSA2g917OmgJNx1PLcWV?=
 =?us-ascii?Q?zrjx6tMB45zc99iwqTaInEoVwdvnw0WIfzENCEO4jAQaF1RQ1gvI2AIH36St?=
 =?us-ascii?Q?ZdcTUIFu0DzvGxE8TcDqeHeXPOJQ5HSm2W2rwvQ0nR6DFqbuFcIXqnlGXYko?=
 =?us-ascii?Q?pqdZ7YdeJEKv7xLFaplHAzGQ/zMQU4/ig6sFthR9gslTqmbAWxiLpg8PiyaV?=
 =?us-ascii?Q?B/S6DB4cN89R3lneeE6gJKVkn+SLc5Y7vwUe9O0gv6rVI3sLOnBYxbjOicoP?=
 =?us-ascii?Q?m0sflt9+wSd8m1xP3u7CVWYMosLiXe+mV2ZVx0Swrmulu1be46yhtWSOZrJm?=
 =?us-ascii?Q?9RIId/hcQBo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF71D32B30E.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3GXIjh8nHik2ukel0RfQ0o/5OQ4LUiVcy40GGI9jLDB5KobjNKrIyCpKgG0E?=
 =?us-ascii?Q?P+0Fc4QrFRxtKrB/DVyKRvjyYoc9SFQ8v7uKRefpE5vPVcbOObEOBpVa+bdR?=
 =?us-ascii?Q?sfpciAKIjkYFWNv5uNniVRId46OVKV8AQ8eploBbyw8RlO8DH5GYhVun1pul?=
 =?us-ascii?Q?btQ8+oUBcit7OM1TemNWhxoduohH3i6W0VHoIJT8oiwwzHloqv8Q7d1o9tM4?=
 =?us-ascii?Q?3IPxvAAiRKtjG7C94RUHfJ9N3l5MhCOMk7eBZWNO4PiuMaqTkdMXpXGtyaWJ?=
 =?us-ascii?Q?5HVLn6+hWSK+O6qbiN7b3EQDfcOEvwWEHDb4zkQ6Y4FRqRxw0EQVncOXdRNQ?=
 =?us-ascii?Q?rHdpHOc5Im1z7RUZofbFxKt1A4wHTK4s9HF0A0dR6/peT8rWwYQw7lzFJq5O?=
 =?us-ascii?Q?mI723zDAGQMD4A2oeNKaOkFuwC8aRzSXu8rTLAY7bzuTRdaO0o++6FgEhDgb?=
 =?us-ascii?Q?WLHqratJvOEn83roqzi7FnALrTaAOkpDdMw53S0WKx6yGeO0+2cczvnC5C8U?=
 =?us-ascii?Q?8SHZPSshB4UyL4vkH2dEwF533a7E3If6kSuPw1StxYHLsCrqJlY2AbEQud5b?=
 =?us-ascii?Q?q9rl7P/gFq7DoK+4WRtAPhCCebjXquLixXNo2tfhPp2v+NKMtGm7O0D6uGxR?=
 =?us-ascii?Q?6tnOElvjJjem58C6/b+hZiOegQp9/KrIADCE2ruqrJDUGW/p+MnR9ASrOmpl?=
 =?us-ascii?Q?84MMWzIQv78LGOtSCQM2tROPHK1bsDlz4skSsf0PlnNP9/pz3pf1vt/R01Oh?=
 =?us-ascii?Q?UjeHZDiyIiER+NYDVXiRda0nHe/cLa9AtQyiB51hmR5+Qccn2cPdM1Is2rwn?=
 =?us-ascii?Q?uvSvbMka/wRs8QUmYXOGubEqvxxugMlY2mJR3xZSkbv4UOnF7i+UXIA6TEHA?=
 =?us-ascii?Q?NzfpoVKcrTgXBOnhWeAkDhPkuFepQl0KO93qYW07iXSrcKqxVlToabaK1r0W?=
 =?us-ascii?Q?lN41lBHdmB6l/UkAj4pXmGD89lgQURXlOzzarbmUncaL24hkA6DBAI+O6cFT?=
 =?us-ascii?Q?Qx2vSFVQzvXesBdaoV0gHaQJXJ820L+N6WwG+5s22wOTxp1/hMGb0qpbPy0Q?=
 =?us-ascii?Q?WJNvqgmKgB3RDod3FituPHYqqZhvr3JQGqmtRQLq4euiqzQw87yi3dqhmVgp?=
 =?us-ascii?Q?lpLEYRBD+6hufL/49ql79HBFRWH16aCT9xV6sav/EPGKvJU6hc2DMDS9lM6o?=
 =?us-ascii?Q?jtGej89MDvnmaAJVAeTiCQkHhZ+moc6q/bn97BQOWzX4ayT7Jbg29pPwCKVy?=
 =?us-ascii?Q?zQ/1AmBQHHYIzLjgPxvupp0pCtGgA2Fdy+K/Pc2609QPJw9yVgSYGaTi26Lq?=
 =?us-ascii?Q?Cf+45rZFGxuYbtxMnCK9f2J3KRDHbrzmHIwoPlJj8DhVDlo8U7Og6NLeS7zf?=
 =?us-ascii?Q?bnN96HrXxvBgPoeW0rbcvqs7MSS89A+wmaMHNNrmuol4K7HaNj98yY1CfNcU?=
 =?us-ascii?Q?kheyXja82ggT6jI9ammQFKpCgxY8PAeA+qgGRdwkWem1LSSwKZs6OJrPea5R?=
 =?us-ascii?Q?+42odLm04V0dwdMr5Jk8JzxMf0PtZ4OUp0VkMoHL/JM5PVlL0gFkCLAYTgd0?=
 =?us-ascii?Q?i9HggI6WQ5NLYvzlXvgt/WCXNZ7Vhzfg+k8f0dv6?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd179ee1-5a12-4c89-d39b-08ddf9cdbee6
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF71D32B30E.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 11:47:02.5012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qmhRjaUO7kHQlhYrENhvNvk0r4JapbC0WK9WuQbm+I+FzVw2IiuUfNPH9kmk75RiAnlkcgiI9/ePszpdh73Drg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR18MB5567
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_044711_513503_397E57AF 
X-CRM114-Status: GOOD (  28.14  )
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

On Thu, Sep 18, 2025 at 04:15:17PM +0200, Boris Staletic wrote:
> On Tue, Sep 16, 2025 at 01:08:44PM -0400, Frank Li wrote:
> > On Wed, Sep 10, 2025 at 02:01:33PM +0000, Boris Staletic wrote:
> > > Hello,
> > >
> > > We have an I3C bus where the user may ultimately attach an I2C slave with an arbitrary address, with the idea
> > > of using i2c-utils to communicate with the I2C slave from userland.
> > >
> > > With the current kernel, I2C slaves need to be known statically and thus i2cdetect fails to detect any slaves.
> > > All communication attempts get rejected early, because i3c_master_find_i2c_dev_by_addr returns NULL and then i3c_master_i2c_adapter_xfer exits with ENOENT.
> > > I3c_master_find_i2c_dev_by_addr returns NULL because bus->devs.i2c ends up being empty.
> > >
> > > Since the I2C drivers have i2c_detect and i3c_master_controller has its own i2c_adater, I looked into what needs to be done for networks
> > > with I3C masters to use the existing i2c_detect mechanism. That lead me to the following list of changes:
> > >
> > > - i3c_master_controllr's i2c_adapter needs to have its class member set.
> > > - In i2c_detect_address, temp_client->dev needs to be populated and registered before the call to i2c_default_probe.
> > >   - Otherwise the attempt to probe gets rejected early, for the same reason described above (i3c_master_find_i2c_dev_by_addr returning NULL).
> > >
> > > That much was enough to get i2c_detect to work with an I3C master.
> > > To complete the use case I also needed a registered i2c_driver that implements a simple i2c_driver.detect function.
> > > In my test, the detect function simply checked whether i2c_smbus_read_byte_data(client, 0) returns a non-error value.
> > >
> > > Could anyone comment whether this is the right approach for implementing I2C slave detection with an I3C master?
> > 
> > Generally, it is the same as I2C. just send out address, and check if target
> > ACK/NACK this address.
> 
> Are you referring here to i2c_new_scanned_device? If so, that also, in
> my testing, couldn't detect any devices without modificatioins.
> The failure to scan happens because:

Once again, here's a patch of what I have attempted to do, but this has
seen less testing.
I have removed the quotes below the patch for brevity.

-----------------------------------------------------------------------
 drivers/i3c/master.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 2ef898a8fd80..de9dbf6c518e 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2849,6 +2849,26 @@ int i3c_master_register(struct i3c_master_controller *master,
 			i2c_scl_rate = I3C_BUS_I2C_FM_SCL_MAX_RATE;
 	}

+	unsigned short addr_list[] = { 0x48, 0x49, 0x50, 0x51, 0x52, 0x53, I2C_CLIENT_END };
+	struct i2c_client *temp_client = kzalloc(sizeof(*temp_client), GFP_KERNEL);
+	for(int i = 0; addr_list[i] != I2C_CLIENT_END; i++) {
+		unsigned short one_address[] = { addr_list[i], I2C_CLIENT_END };
+		struct i2c_board_info info;
+		memset(&info, 0, sizeof(info));
+		info.addr = addr_list[i];
+
+		memset(&temp_client->dev, 0, sizeof(info));
+		temp_client->dev.bus = &i2c_bus_type;
+		temp_client->dev.type = &i2c_client_type;
+		temp_client->dev.parent = &temp_client->adapter->dev;
+		dev_set_name(&temp_client->dev, "i2c-temp-client");
+		int err = device_register(&temp_client->dev);
+		if(err)
+			continue;
+		i2c_new_scanned_device(&master->i2c, &info, one_address, NULL);
+		i2c_unregister_device(temp_client);
+	}
+
 	ret = i3c_bus_set_mode(i3cbus, mode, i2c_scl_rate);
 	if (ret)
 		goto err_put_dev;

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
