Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75417CAC592
	for <linux-i3c@archiver.kernel.org>; Mon, 22 Sep 2025 11:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=liajIfdaSfPud8J7TanE2fq3xDHhCHK1VQLOZrMw75Y=; b=Xj/Tb0dU3r1R+f
	n4SEFbW13Sx5MzxrXh+lio6z6AHyVpG9r2Gdl74tgZX8FInYEi5iwiwEtaQebMepq/OwqDaH3ntCA
	PwMH8UHTxrTl+Vj+5eMS3BD1v96mbU268PSTngJMBfiPiVvgMy91u8nqWjZQwhSLq+3kmKRvTMffy
	5AAX7/oUm0uT60BnVCPrVZWDqNxwzD3DHAf/Q8iraBXioTFKPWQGROInwpH0fK3TyJx4FX/Xb/Pf/
	kssa71/KOE4Y1ZFrfHavJUmzt9ramQPx22IRM1KZobvBBsefcBoJcBb8pcvDYDbqtt1pCuvhUSqkn
	WkRizrxGhYdVSls7Zuyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0exR-0000000AFWA-0sQV;
	Mon, 22 Sep 2025 11:43:49 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0exO-0000000AFVT-0yVn
	for linux-i3c@lists.infradead.org;
	Mon, 22 Sep 2025 11:43:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UTPH4Za4zKjisrRNgI4ooa3XOh0eHkyrAulx5bdFZKZmNMpsAvv8mVRl3r08uXWSACEBXQO9IkDkAjLIig/BocEl19fbJOZaz09+k0Z19VWfwYYZJQKA8CCaoPyHsk6uBA+MP+o3Mdv3rRuDu7ff2sG96rvfyfd1SohOpvnyKn5qdencpyqeCCY6xk1nsqI9ykoLy9uYkGl67vsbkHLjzDIcTmBVJcRISvH8LZqJjVvtzm2NFecODGKX1FVJHdKXnBdrXEKpM3pOz+m5z2tl4J168vSrE+EHzHUdZnZ8/fF4WgiXX0MN7gJ/7/WffTkUv1sLql0vPHTC0jL63mokyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ycN+pvsDHQT/+1tZ1Vhpt+CNhIaqpnxXbCLicU5qQp0=;
 b=tlxeVoQ2gHCO3K8s7EAiKZWTphkddh6Sl61AnXBrX9IbQ3ogfPa0bK9HWkTPlxLr5cVpRK3yqJYrx/+zmzPgCQbSwRHpqt70Hti89BGrBMBGW3BjMBEgHCwLKMROEe1R/nNI7lgTq3uHa/KcZkiPs581BivfY5mhX7LvmkyP5fzZD0Kw/7uliuLbjSAfrQeVsossK7FGrszT1eelS3v/Xf6YkbVI7rW53iEkiiTHYf02xoEirXVQ+tjiuAhxdkDd8O3fa+sWQlqH/KTQHuWhQFRbtRDeRh4znHp/JfLbpBgQZDnKkbzmG5loekf27g10vhXrS58IU4zzLiCagafUrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ycN+pvsDHQT/+1tZ1Vhpt+CNhIaqpnxXbCLicU5qQp0=;
 b=mVsV7PbyewCAYkLcmxicsqRo9o8fXLTUDnzSzbzStqAuwpR+eq32wJspHXe3UijrEYORNS+hpGSTJllfH5wgfxg0NjGvWi/GL6z7DZG/VOXQ1eIIpul0fBqVFhhOVphE4FhSZAufgtpE2x8xbOh6JHLgxOTsL+DmoPtwiJ6DchDA3iSgd8RlkMDxEhrM5W/M8t5qd5oEdLO4oELpoqJiNSjZnuMxMyLy+BqrMDP+v2qr8l3PGNjmhQfraMs0GKqGPrNVGAdsLN1awCvkrTS4mF4fAzqlAcpqaQffIq9XQHS19MboqTK73Zend2/V8i0yo84xz4T8cZcVW7l5NdXIrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from DS4PPF71D32B30E.namprd18.prod.outlook.com
 (2603:10b6:f:fc00::aa2) by LV3PR18MB5567.namprd18.prod.outlook.com
 (2603:10b6:408:1a2::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 11:43:41 +0000
Received: from DS4PPF71D32B30E.namprd18.prod.outlook.com
 ([fe80::7c46:661:da37:dc33]) by DS4PPF71D32B30E.namprd18.prod.outlook.com
 ([fe80::7c46:661:da37:dc33%7]) with mapi id 15.20.9115.020; Mon, 22 Sep 2025
 11:43:41 +0000
Date: Mon, 22 Sep 2025 13:43:36 +0200
From: Boris Staletic <bstaletic@axiado.com>
To: Frank Li <Frank.li@nxp.com>
Cc: "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Subject: Re: i3c: scanning for i2c client devices on the network
Message-ID: <aNE2aAxJzo2edoRm@axiado.com>
References: <DS4PPF71D32B30E58BEEB807E76DA5FF106DC0EA@DS4PPF71D32B30E.namprd18.prod.outlook.com>
 <aMmZnG/sbErB4Ly4@lizhi-Precision-Tower-5810>
 <aMwT9S92IpIOT_Gq@axiado.com>
Content-Disposition: inline
In-Reply-To: <aMwT9S92IpIOT_Gq@axiado.com>
X-ClientProxiedBy: FR3P281CA0148.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::7) To DS4PPF71D32B30E.namprd18.prod.outlook.com
 (2603:10b6:f:fc00::aa2)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF71D32B30E:EE_|LV3PR18MB5567:EE_
X-MS-Office365-Filtering-Correlation-Id: 51da2eed-0849-41a1-7541-08ddf9cd46ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FkRzF6thHiIsNxZO2ndoYGPXtJYkyecmYiCXmaakg4YLgdxJ9GYCXgfNfvX6?=
 =?us-ascii?Q?BabXAZTNEqmrLZc7anGCdNGo3HpY1ZBcpsQVgOUb7Cx/rxLii3q285n0ac9M?=
 =?us-ascii?Q?v0QZUGo/awBCUJoYeste4yfDl0sxapCPNXzvJmQPcPCUTdhYTWJ3u1tKREUR?=
 =?us-ascii?Q?4MumVu+BBHdWzy1RbW7fUhvC93/1DqD7g+SAlBVluaThba0oPLXWj6PuqiBd?=
 =?us-ascii?Q?EwyWTnC4Uvxf40lsLFHSo2Rs6FIqAu/5gmfqJ8DwNJCGVevNP6GFg/nZhhC6?=
 =?us-ascii?Q?kbghtseaPad4e3J29lrngiE3WCdrIgFUT3wOO3VnciiD2+qfFDXL22PhfoBP?=
 =?us-ascii?Q?0BNJh1N4w/Vayg8f2V5bQwe/xT7Xv6QvZSI/+rv546GAP3DagOnj5hQ/RyfI?=
 =?us-ascii?Q?YD3+a87RdzD5YLOPtYoIfOrUYlejYM9+KfP6FTpRaiA81WbFAVIdGdZ2uGNI?=
 =?us-ascii?Q?02usQmivsm33eIS3/SVu2UeB9KN4waXOg6Cx7jbhWElcD5jErg5Xr1UwdNl4?=
 =?us-ascii?Q?WXxDM54nVNc6W+TZL4WHhYTt1PB1G8oPVZTIqQA8P/uMEqIbmBJ5ebtZzfMV?=
 =?us-ascii?Q?jjbM0hc8ilsdElZZnpdpRaTvDikQ9QNS9myADgtXbW0st091ktNmNgdgPkCO?=
 =?us-ascii?Q?sXYPFG2l68vTDOC5PZ/ku5EU3wVP7g1TYfQXU02sLfoqutZ4Btdc56/ogq+M?=
 =?us-ascii?Q?qlXWaXmLxba7j/+LyWHoB5uttDCx+ANF6CAx1fLxnSgFqDON/SCyVi9BsO6s?=
 =?us-ascii?Q?sDewdNk1gFUABFFFpdqAgpYYxWyRKuPbVsTZkkdbjwPGKVzwh2wC9Pk+l2rx?=
 =?us-ascii?Q?2JjCpjMyyG0Z/eUwW6QWsXS6yKrQeex1YxiBv/1Z4MPbduInhDdpAtp0gahA?=
 =?us-ascii?Q?WFaSTL3iVXXbSpXmYve+PLTxB4/jm/IEM/TBVJyzyQlISHKq+Ctz6s5bncx7?=
 =?us-ascii?Q?IKHvTh7UC/4hn8vKBbHUSlmFdsdMSBO7dfapZ/4/8//uOvxiCeh2OFnMkqYZ?=
 =?us-ascii?Q?lzgPlVyr/7eBZxhCWTTH+GjTXwoOA3+WVwT9vLk1TAtWl+4dTdMNPZBa+Sro?=
 =?us-ascii?Q?BEnUNt1gwUJ1RyfS1XLI+SQiTNoPuj5cBiS8Loh3TbfD0gkIkvrPELStufUa?=
 =?us-ascii?Q?fwweQucD8ZUXwFEsic8YKQOYheUBN2flmJZWagm+Fgztbb/EiVBECjQF6v9J?=
 =?us-ascii?Q?JdmfrExlwrIa9K1OLkDAyStxWokJHdmdVB1YdzvaXDtMS3CgI5vzDYuMGLZW?=
 =?us-ascii?Q?TlZ6klpJhOjtFTDi9eidkCTRD5+D8Con0ur0iZN2Y+NzatEELn+10xvPiRZM?=
 =?us-ascii?Q?S0x4uS1AqQEVMEQY6vkJL/sZIeeR2WYae+d5REphIE3It+Zk0POhJgnPrak+?=
 =?us-ascii?Q?TcLCoiWAqIYPMOWnecYU/RPyaBQMax71kpvgpQsuzEW1oUY/BiU4vvrp/I0c?=
 =?us-ascii?Q?6nCRpGdi7fk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF71D32B30E.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zLwWZIlyT/sGg/ZgMJAyOQX6hs5bLj8sNchTyIP+i2r51blmQJVT/gd57U8m?=
 =?us-ascii?Q?vxWHe7LekOoSysHWoOQJqnbMwGtHrY99o0IVihQUoguBr2vWsAgjrVaMK3s4?=
 =?us-ascii?Q?m+Klfw4yNa0ZATt5l7qOoJhf9CpZ8+dkSLdjn7kgVDD9eG03wEI9GVU5xtT2?=
 =?us-ascii?Q?gxKTXBiO5wgWMnr3+keSs4vds0f+w60oGdxBi9eva0+sDCawhfAmhGUrDayw?=
 =?us-ascii?Q?Ae6QFaG1OBUYGgL/XJ+EujVhxPBCbN4Ej2KvLnboXxZzc5u4TsNbB/OChpBn?=
 =?us-ascii?Q?Z/Rz0D/fTEkXl8ztMHPI3E3kBBkiXAwh2o6E5AQsXEA0nexX4MxBzdyvXd0A?=
 =?us-ascii?Q?jFhlrlVibCCdMpV/rpzcJrCECEDBT9ygzxdonqvL4aeoHOEA/xW9VO1EncUg?=
 =?us-ascii?Q?tw3b/v8MHKTvX/zd2w0WuEwSTaM41y/lqu7SpaS/yiDgstChp0kLwCX2T+13?=
 =?us-ascii?Q?pgvxCeIHwiwIWCivYANw6ricNIAV1lzyOTGrof6sKIHLtyX7jxpSfEuym10/?=
 =?us-ascii?Q?37DKOPn39/5KoCYjv0qMBVWDHuLQmMpXVnf8MPxa9i5j9bvVym1wo2ldr7TV?=
 =?us-ascii?Q?6Z8gxVmipZmmc1DGJUgcq/WsWmz0O1C5R2EW3F8+LqdrFQehJhV03/mJ9BMf?=
 =?us-ascii?Q?ta9Jf4IEkkD/Min6J+tDL8/oAatXy6C4ywIbECWCJlGq0Vufi+Y0dxANcRX0?=
 =?us-ascii?Q?+XMuE3xGt/GlSWj9dySSTQx5p1IK1GTnhnFCkBF68NcV4GiHomEJZ6+85WVf?=
 =?us-ascii?Q?E8jiMHznhMidvorLYzz/YX5EQ/iqUn2mD2pqCX5ouIvD9XizcB+IY1WIb/ey?=
 =?us-ascii?Q?qftyWJLnIQgLLDqmfHqh9+fiddc5nR2O3B9bcUlCjLgCeT7nXSdB1rKkZy1h?=
 =?us-ascii?Q?Zfn07uujb2wvrvvlTvSE1tK3GNJQtGlPxrlnIZwpjIYk2n+K+wUZ7EEj2Me0?=
 =?us-ascii?Q?kvAzHyBnBkIPPhXgc3Air4JslTKz7G2ZteGEb4U48vMw8mXK64lEDd/PwVOT?=
 =?us-ascii?Q?o+hXFoCkdC8RtzKXQRzUsefbxebQSmhQhVqMVycPE5YOSSG+6ntfzzKN+sF5?=
 =?us-ascii?Q?ImfeORZdn38Cbc/Ar0e9Bp1BBGJKQC096Ar+SpFzjuLvjY/T8AbL6PTI5bvx?=
 =?us-ascii?Q?MReBoTynVShXAIhHD6yyShKIb74xdz/dbZk4NhLYB2XUe7LfhGVunL/fa1hv?=
 =?us-ascii?Q?vfj3ytjkLWwNCe0QBpQOgtKkXPQPTYDy/Dtb/AdUY8kJOq9ARAbT+ipBukFN?=
 =?us-ascii?Q?gfZv59dw5t+X8Pr2Cu0luntP5XeB7aTQxYxlpNZNfl0zqHKGXgj7jVykAzZW?=
 =?us-ascii?Q?encHlo6rH7tOl1mwXf56MXXh/hzUImVnhQc+fdo1IDF/5fst5akXquU7GpC1?=
 =?us-ascii?Q?ZCNNb4ezyEqwITwb84pyr6t4nCWD7Yrc7zsAJSl8zq6W0aQS5eNC3gusvTv8?=
 =?us-ascii?Q?eApL14jn+YHB50Jf6z4DiYLKN+YCGMN4LviaYs4tKp/RzMNJOMn9dEJFiZay?=
 =?us-ascii?Q?l3aDSctvC65CKkMt7qAn25J/lpUWN6wL7taiDeHatoq73bDA/V9uuoniiD0Z?=
 =?us-ascii?Q?TVAMMmHCpBoNCEa+HnkqMio23qpSVfH2/0AoPLmT?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51da2eed-0849-41a1-7541-08ddf9cd46ba
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF71D32B30E.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 11:43:40.9080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DFbAo9at5PWHusrvMpUl0Xpr0L5L98F5L9OeNfL8NqlnXSTlifKgjzRUu5lKzLh8c+NQi2Lthg6tdF2+XN1cUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR18MB5567
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_044346_367120_F63B09E5 
X-CRM114-Status: GOOD (  43.65  )
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
> 
> - i2c_new_scanned_device calls i2c_default_probe, which calls
>   i2c_smbus_xfer.
> - that eventually gets to i3c_master_i2c_adapter_xfer, which looks up
>   existing devices by calling i3c_master_find_i2c_dev_by_addr.
> - i3c_master_find_i2c_dev_by_addr returns NULL
> - i3c_master_i2c_adapter_xfer then returns -ENOENT, ven before trying to
>   communicate over the wire.
> 
> I am probably missing something, because, as far as I can tell, neither
> i2c_detect, nor i2c_new_scanned_device can currently be used with an I3C
> master.
> 
> Would you mind elaborating more on the suggested approach?
> 

Replying here to post the diff of what I have tried (and attempted to
explain the opening email). Hopefully it will make it clearer what
is our need and (more so) what my attempted solution does.

-------------------------------------------------------------

This change allows I3C master drivers to trigger I2C slave detection
by i2c slave drivers, leveraging the existing i2c_detect mechanism.
---
 drivers/i2c/busses/Makefile     |  1 +
 drivers/i2c/busses/i2c-axiado.c | 53 +++++++++++++++++++++++++++++++++
 drivers/i2c/i2c-core-base.c     | 12 +++++++-
 drivers/i3c/master.c            |  1 +
 4 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 drivers/i2c/busses/i2c-axiado.c

diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 04db855fdfd6..7b51df1433c4 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -42,6 +42,7 @@ obj-$(CONFIG_I2C_AT91)		+= i2c-at91.o
 i2c-at91-y			:= i2c-at91-core.o i2c-at91-master.o
 i2c-at91-$(CONFIG_I2C_AT91_SLAVE_EXPERIMENTAL)	+= i2c-at91-slave.o
 obj-$(CONFIG_I2C_AU1550)	+= i2c-au1550.o
+obj-y				+= i2c-axiado.o
 obj-$(CONFIG_I2C_AXXIA)		+= i2c-axxia.o
 obj-$(CONFIG_I2C_BCM2835)	+= i2c-bcm2835.o
 obj-$(CONFIG_I2C_BCM_IPROC)	+= i2c-bcm-iproc.o
diff --git a/drivers/i2c/busses/i2c-axiado.c b/drivers/i2c/busses/i2c-axiado.c
new file mode 100644
index 000000000000..d5006e250a3d
--- /dev/null
+++ b/drivers/i2c/busses/i2c-axiado.c
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * I2C bus driver for the Cadence I2C controller.
+ *
+ * Copyright (C) 2009 - 2014 Xilinx, Inc.
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/pm_runtime.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/reset.h>
+
+static const unsigned short normal_i2c[] = { 0x48, 0x49, 0x50, 0x51, 0x52, 0x53, I2C_CLIENT_END };
+
+static int ax_i2c_detect(struct i2c_client *client, struct i2c_board_info *info)
+{
+	int byte = i2c_smbus_read_byte_data(client, 0);
+	if(byte < 0)
+		return -ENODEV;
+	strscpy(info->type, "axiado-client", I2C_NAME_SIZE);
+	return 0;
+}
+
+static const struct of_device_id ax_i2c_of_match[] = {
+	{ .compatible = "axiado,ax300",},
+	{ /* end of table */ }
+};
+MODULE_DEVICE_TABLE(of, ax_i2c_of_match);
+
+
+static struct i2c_driver ax_i2c_drv = {
+	.driver = {
+		.name  = "axiado",
+		.of_match_table = ax_i2c_of_match,
+	},
+	.detect = ax_i2c_detect,
+	.address_list = normal_i2c,
+	.class = I2C_CLASS_HWMON
+};
+
+module_i2c_driver(ax_i2c_drv);
+
+MODULE_AUTHOR("Boris Staletic axiado-2532@axiado.com");
+MODULE_DESCRIPTION("Axiado I2C bus driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index ecca8c006b02..231c43cf657d 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -2467,13 +2467,22 @@ static int i2c_detect_address(struct i2c_client *temp_client,
 		return 0;

 	/* Make sure there is something at this address */
-	if (!i2c_default_probe(adapter, addr))
+	temp_client->dev.bus = &i2c_bus_type;
+	temp_client->dev.type = &i2c_client_type;
+	temp_client->dev.parent = &temp_client->adapter->dev;
+	dev_set_name(&temp_client->dev, "i2c-temp-client");
+	int err3 = device_register(&temp_client->dev);
+	int err2 = i2c_default_probe(adapter, addr);
+	if (!err2) {
+		device_unregister(&temp_client->dev);
 		return 0;
+	}

 	/* Finally call the custom detection function */
 	memset(&info, 0, sizeof(struct i2c_board_info));
 	info.addr = addr;
 	err = driver->detect(temp_client, &info);
+	device_unregister(&temp_client->dev);
 	if (err) {
 		/* -ENODEV is returned if the detection fails. We catch it
 		   here as this isn't an error. */
@@ -2542,6 +2551,7 @@ static int i2c_detect(struct i2c_adapter *adapter, struct i2c_driver *driver)
 		dev_dbg(&adapter->dev,
 			"found normal entry for adapter %d, addr 0x%02x\n",
 			i2c_adapter_id(adapter), address_list[i]);
+		memset(&temp_client->dev, 0, sizeof(temp_client->dev));
 		temp_client->addr = address_list[i];
 		err = i2c_detect_address(temp_client, driver);
 		if (unlikely(err))
diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 2ef898a8fd80..5fabba14de20 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2494,6 +2494,7 @@ static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
 	/* FIXME: Should we allow i3c masters to override these values? */
 	adap->timeout = 1000;
 	adap->retries = 3;
+	adap->class = 1;

 	id = of_alias_get_id(master->dev.of_node, "i2c");
 	if (id >= 0) {
> Thanks in advance,
> Boris Staletic
> 
> > 
> > Address 7E, REPEAT START, scan's address. ACK/NACK STOP.
> > 
> > Check ACK/NACK. But you don't know if it is i3c device or i2c device by this
> > way.
> > 
> > send 7E to avoid IBI during you send out address.
> > 
> > Fank
> > 
> > > The most iffy part of this approach is the need for such a dummy driver, just so the I3C master knows that "something exists".
> > > I'd welcome any sort of feedback.
> > >
> > > Thanks,
> > > Boris Staletic
> > > --
> > > linux-i3c mailing list
> > > linux-i3c@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
