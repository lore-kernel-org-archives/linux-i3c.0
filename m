Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94156CAC5B1
	for <linux-i3c@archiver.kernel.org>; Thu, 25 Sep 2025 15:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WXAUKuePuR8LXyzlIqvfGyzNNuUvSiY6/Mxdt49ysrc=; b=YUZuAOcHBMTk9B
	McmBAVvrmuVSOL3D2lKUhMUJb+KEcdf7NIv8oVDye7W+56xjLpdHSVBO+rnaNZqxh3CgcahcYERPr
	Fmd67SJVkc4NW9oxQQUTAfJfQhv1309HwXGkBFwjfytlip5WE0+tikXOVghndRpJL3mkuf/BMx8fW
	s5l7DEx4Lk14Ha1uGzJEjeacjoHOBpuP1BmrHvG652e/hN0e6I0p4PqFVSWvrpvrsPunTwB5c2MHj
	n2AmKeGLwWf8BwrxtY0JY+Wq9UYYS9sTLj0OoNNfmRuuRMqvSfwy+EvtQMHF4rKBDOchdxIA0DFl8
	/isSHamCBXFDDURQnx5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1o7m-0000000Al7N-15uE;
	Thu, 25 Sep 2025 15:43:14 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1o7j-0000000Al1v-4Bc3
	for linux-i3c@lists.infradead.org;
	Thu, 25 Sep 2025 15:43:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CvYsJYRlbmr/7NTirTjC3rlAD9mJnoZwD27w/nfH/6+ygQZplxR0PeQ3i6UqZlyE6O3z6kxs4g9cChDDe+jeZ7hX7eWizZFQKinWkmF53ArIAMH+ahTac1rt0f4DQiqquYzIazlQheuGr9/2FqOVWADBxVZre2AUw9c2Tm/y9OLbchqRJWM6UPeKqHIdZiCdrvkM5MSLBCJC/DxW+03VpblHDG9573huPDFyFwcZDv1zyvTx0BLBBzy7E2A/Z7l5i7qD3FBQ/AYL0/jG5JUOO5rMZfkHZukahSvFufarMe8x3YO50GwtdDvb/PMXMMccL5bUYGs5oN0iu3ylcBX/CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pXQq1Ol8cUDbMowPz7rdD3c2kI2lv9xZZb36AROUGYA=;
 b=ia1DDlnF3BaOOn/x5hytYN3++mSewc8C/eOqtu6MG6QdtQQ3nGCJy/SIKuboyl11vpiRMC735l/goxzsMf3Vxpc7P+y4+e9WdWF7sYVVKlnvlNQcRUdATpQWD1erZk0QtuCuaxntmflpWvxydL79cO9h5wTADc3NTXTC2rdtW0OXGDDkeSeo4CWXoN1hly8VmJhkl5Z02AxcMaVebdXFkcXfR51leNA//4xLD9zm/WWjCAyK59kNZzKSdD8suNtLD+G7TVkilwuLEINFQHjJY4N2S8HyQG5JMnBPcLo0gn0uFiGrMGZ9725meSzB68rDOboAGsQDb/+Qgdbw7CVD2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pXQq1Ol8cUDbMowPz7rdD3c2kI2lv9xZZb36AROUGYA=;
 b=GHNiLg1UDjFAy9QJRz1waCn3CNT3D6lvoskXYKF4Poc8xl0cL525xXhC2ANWdz3thUHUrocs81TQdTaSwcvc80z+ZZw4rAjeunRSej+sXr/FgxTXpd3SaZLsv5EiS1ufKRYLlPi1Nu6Fsz2mqbqi29fk5SuKbepVrR3X5a54GtczlBlf2WSVI0zz5o/su8t8MF7PRVFfDZsSArCN6zmL+/6iBIsANTrK1ylZy8GyhZ1LedvVbprkQbePJ+eGaq1KQ0gxO28DbyUIMSk9A8XeGeUvg/seZ1OyMMV2ATBrK5k3zDTzAZEYj0ADC1/miTYnx41CDjjF1kX12yFo/yjGdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from DS4PPF71D32B30E.namprd18.prod.outlook.com
 (2603:10b6:f:fc00::aa2) by DM3PPFF5DC69889.namprd18.prod.outlook.com
 (2603:10b6:f:fc00::6ce) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 25 Sep
 2025 15:42:50 +0000
Received: from DS4PPF71D32B30E.namprd18.prod.outlook.com
 ([fe80::7c46:661:da37:dc33]) by DS4PPF71D32B30E.namprd18.prod.outlook.com
 ([fe80::7c46:661:da37:dc33%7]) with mapi id 15.20.9115.020; Thu, 25 Sep 2025
 15:42:50 +0000
Date: Thu, 25 Sep 2025 17:42:40 +0200
From: Boris Staletic <bstaletic@axiado.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Subject: Re: i3c: scanning for i2c client devices on the network
Message-ID: <aNVi8BUgYbsaaQbF@axiado.com>
References: <DS4PPF71D32B30E58BEEB807E76DA5FF106DC0EA@DS4PPF71D32B30E.namprd18.prod.outlook.com>
 <aMmZnG/sbErB4Ly4@lizhi-Precision-Tower-5810>
 <aMwT9S92IpIOT_Gq@axiado.com>
 <aNE2aAxJzo2edoRm@axiado.com>
 <6b8271ea-282f-4900-a5ab-622c4eb85dbd@oss.qualcomm.com>
 <aNQ2U58hF5LzK9cT@lizhi-Precision-Tower-5810>
Content-Disposition: inline
In-Reply-To: <aNQ2U58hF5LzK9cT@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: FRYP281CA0011.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::21)
 To DS4PPF71D32B30E.namprd18.prod.outlook.com (2603:10b6:f:fc00::aa2)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF71D32B30E:EE_|DM3PPFF5DC69889:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b48330a-b761-4f85-6a30-08ddfc4a2eae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DxZeDxt6q+UyEr9AMLWfGsrfzDMCAobfkFMKdl98lOUwutVOWRLn0q2EWhJy?=
 =?us-ascii?Q?CwH6pJCoVdEMkxO+vpRt5sfVGU3A+fxViJMGpxzsheoxP+Y6DOTWyfENBIar?=
 =?us-ascii?Q?Ud23KQ09jJ4ZtgojyXtOqUvDNFQ1re2HXGRMaIo+fnyTlQ8D+K/p3HrEGGs7?=
 =?us-ascii?Q?XtgNEckitbkpuzp7VCW4oqndQG8krGxRECfH4Ivfdt7MhDpWthhUMsQ036rS?=
 =?us-ascii?Q?F8KiCDed6T2+0yJxrlmSXtbAMH0rpJg52PtvhO4F4nu49TGf5oNtkY9x15Ym?=
 =?us-ascii?Q?HUFCHNTPB/klIF+OwFi6vC7YH2waP8ufkf7LN0fQadpTaZkAr9BdgN1x3OVG?=
 =?us-ascii?Q?U8y8zSXTR3hrQUdNi5Pr2mOd2ZlkV5+qIludwnPefJwfEIpjWCQk6DVBcwip?=
 =?us-ascii?Q?nlimrIup4gdli1AhqtEQwpYfPuN9CyFO+BXQLRXGJFY2bhtVSNdu2Pwmj8II?=
 =?us-ascii?Q?aTDc8Vp6F0XehsvziJsnr4PkiNNXLEDc0NINXLBZ8JcoEMBQ6ZBkAz1qUqqz?=
 =?us-ascii?Q?p3pUhAagMMPMEAUvpq2HbHmjlV27TN9j8+vKRn7Hcs6n95oNqBD4WzxrKHnA?=
 =?us-ascii?Q?ae5vM+oObB8Cb5mbLby0yL96l8zfOZ8SuBIsXFDNKed2QYtNvV8RN6sQpqoX?=
 =?us-ascii?Q?6q1IY9lJ22u8bIrrh0vEhCL/2/0Pu7vl5YG3pBxlNyzdClH7zaDZ7HnRzDx7?=
 =?us-ascii?Q?pMPeYf3aAGqKxZH7JHgn6E7qA+EhgsHikCE/WJ669INGMUSbmlcG5XhU6ynB?=
 =?us-ascii?Q?aHbEq95QS8nu9faV3BtkO0WtlHx6o/a5qtlBtaOe4qiZqNOLlX/RalekRTjr?=
 =?us-ascii?Q?dMiihSDwjraX63aa98mGFF26Eg7ZVrRTlJGOHwkNJU6HqIxNd97dQxiuwME0?=
 =?us-ascii?Q?sOYAi1ofKwoKeCCoYkT/AYZ1X1HEz89hsPOVIZvp1SeDCcVHI3iW6r1FkDnU?=
 =?us-ascii?Q?Te1yOWYh/Uc02T1clIvEqSH8ANoTRn8wiypNh4oBi5t/YK/hvWN6xOjbdQ/1?=
 =?us-ascii?Q?3kOJXl1lf/TmKccwikIEtuR8oNd8bI/1fIYTlbyCsAO+Vk8wuNbV47NArT1l?=
 =?us-ascii?Q?A7vNaudmzdkreUbHK55CZjEg8zXb/THzBM4ChjSreTEF460pv9feaycKITXC?=
 =?us-ascii?Q?lrzqVKhu1fjt0YsCXSniPALZlJRzZ5TkP5d8vOiCB3sUGlOxhW0eQDvsn03s?=
 =?us-ascii?Q?HnPFlkCW9D/SZzJSmg34kO29SKsrU04vXBN/OzDqMJYy5wjXRuvIotCqVKvY?=
 =?us-ascii?Q?bAmwMP7bBZqB8qyGZUAmyzgOI/fuKO2YDXUnkSza0903bcWbEe74ntu61Kvp?=
 =?us-ascii?Q?tUc/2WkxSTd5xJOViUEb3Lu3XcAS7hpwMr4FnDFUSIlXZ58KJhkqL41zys4B?=
 =?us-ascii?Q?ffcwsfzhaLYubJG+MEmHCprB3ftYWR06mcTDFKHcBekiQOWv/wPCHIZILAfa?=
 =?us-ascii?Q?2NPpdaGGTe+l8F4aiE2HgViSHlcdO8CC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF71D32B30E.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X7H9Qo9210x79LPUmoiV14rEgFOa39EOlaKwD73GFHZNapIVpkGZMoDjDYkr?=
 =?us-ascii?Q?d2IJ5x3pfcR3ojOS2iAiSN2f+3egMbB6xqp/Qx+4gaKvSUE6D/+MHXtFzNsA?=
 =?us-ascii?Q?qZmRNpW9ULFJQG913gBepW/Xga+x6OO2FI6a0lZbnmvTeNqAembEuDl/yKGx?=
 =?us-ascii?Q?3ql5jaGUtNT+6Y9MD8FCD+ZOWhNp2XENAz0/hk3DUK1yq3/FThIAmdQJOSlz?=
 =?us-ascii?Q?6jRJHOmkWRWjagh+wz+gQQYR36GS3yFQ8P/XdVHm1yTU4TZz+QalpvIDhDmL?=
 =?us-ascii?Q?a1Rwg47gnV1NSCNd/VjLinJsmsFfcc6t62Rv1o2v1WZNnPNFkWBbQGElohRI?=
 =?us-ascii?Q?1TznzAwyIr/B4hjWptwBEenfWm/CxlC4xPxCtfgrWWrCncRjoIkrSwSDrvDB?=
 =?us-ascii?Q?rdwOqMhNAmHg2bNXb4dlEv9/m83/fU5u1j+deTzY2ACI0xZfwQSO/d96krqY?=
 =?us-ascii?Q?NjeSnmnDCywzDjw8FtjeXMw2a0vcPOGnIjEC5VBx7ay0C0Rnz/PxlH9EhdRa?=
 =?us-ascii?Q?0dqBE7Aku3/h2wZBK01R6J8NWetZVdAEPFlf/b28Si2uP4IbVhC0Fzd3tZlW?=
 =?us-ascii?Q?P5J8IKQfrFAIkPKjdiPuUzsEzvEqQnRuL7iDpoaq9Lb738pVPGO0EnRJvddN?=
 =?us-ascii?Q?n4V+bzJ2CwNUlLnuNEZQsOWyTi6P22bgno8l3jslEAEaWJSq6khmPGtX+rbU?=
 =?us-ascii?Q?4PfCugl6zyP+GsbUhO+xHBP9H0Mm1z22Jp5w2YLG88ttaxAvMsfgeB+n1TyG?=
 =?us-ascii?Q?jpl6C2kTZnd9yfTvqcH9GOsaEDKeXaBmQuH/Zh4oKaVafR78ZE5ZBAEgJY9P?=
 =?us-ascii?Q?YOBizz9Nh6xdT6lqQs3fu4g7X5WPw0amhIh3IM3MzN8CJy2+fBgWBUq6BMRY?=
 =?us-ascii?Q?yqhOORNN5HDhEtdki3PSdtWt87F6f9K8mk7e1wQq8AK7y+YMeksURhUYERm3?=
 =?us-ascii?Q?KGgFPHHat2lDT5TKBPKscXYIzY2/G7S7CWaGaPLyxIeeaGl8/X3JfX1r1PBp?=
 =?us-ascii?Q?kk0McMdxITyHwjBi51qRy+cD9TMZrKXx9dnbT1ggraq1XS5IYaCqUvXSNpIf?=
 =?us-ascii?Q?/0Xq76LYRwdooCVwynu8t08EosfZ3hZwLap+RSQDQMWDsaUjSOTqGzE5rPex?=
 =?us-ascii?Q?MoiZBvfQFAowEWNZDW8uJhOGWkwqnRr3Hxsvsh6LfMCdeCwD4heyVFMhI1i9?=
 =?us-ascii?Q?XFkxK2MRtnKl3BWL+OkL3HnclWkY6BzV60aLZ8uq4VRjPhNGfAguVyFg3ga0?=
 =?us-ascii?Q?0dncSy7/7qaUoV0s/IBTAFkpIVGh8z1NHAtFPJdSK2UNrnfsIvX2mm3+Sdqf?=
 =?us-ascii?Q?w1KdzFPoQ/cmb+SVi6EgyGogT/C3BV4LdP3JmKrKAiE16D92h2AnzVVz1S0S?=
 =?us-ascii?Q?TIEevnC8XuyX1ohK80HRn8wCl/dMA9HvuFN9QUQZ8Xkh3QhWb81D7xc4ibtt?=
 =?us-ascii?Q?mFh4wC1kGDtU1eEXp/7H8AIa09S9AUu0dZTMHfTc1qlQK8Z77p4gBrAjC6Iy?=
 =?us-ascii?Q?78VV3T3R4eoWt6PJ2RjfgzkmQGUyFnqiOB1VyxCFeYJX/Au3Ysmgqyb8YiO6?=
 =?us-ascii?Q?l4gx5f8eMhaDYLO78Cw8z3CfNsq25lRgaO7gMo6i?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b48330a-b761-4f85-6a30-08ddfc4a2eae
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF71D32B30E.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 15:42:49.9276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gct1J3TP1CcSAw82c4B7hVDRB2dzcDn+L2G4VPYqA2ARa838gBAGHgPORBIoRIRYkWHvC72le9j8thR1glCE8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFF5DC69889
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_084312_106415_5DB50B30 
X-CRM114-Status: GOOD (  47.93  )
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

On Wed, Sep 24, 2025 at 02:20:03PM -0400, Frank Li wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
> On Wed, Sep 24, 2025 at 12:16:45AM +0530, Mukesh Savaliya wrote:
> > Hi Boris, Frank,
> >
> > On 9/22/2025 5:13 PM, Boris Staletic wrote:
> > > On Thu, Sep 18, 2025 at 04:15:17PM +0200, Boris Staletic wrote:
> > > > On Tue, Sep 16, 2025 at 01:08:44PM -0400, Frank Li wrote:
> > > > > On Wed, Sep 10, 2025 at 02:01:33PM +0000, Boris Staletic wrote:
> > > > > > Hello,
> > > > > >
> > > > > > We have an I3C bus where the user may ultimately attach an I2C slave with an arbitrary address, with the idea
> > > > > > of using i2c-utils to communicate with the I2C slave from userland.
> > > > > >
> > > > > > With the current kernel, I2C slaves need to be known statically and thus i2cdetect fails to detect any slaves.
> > > > > > All communication attempts get rejected early, because i3c_master_find_i2c_dev_by_addr returns NULL and then i3c_master_i2c_adapter_xfer exits with ENOENT.
> > > > > > I3c_master_find_i2c_dev_by_addr returns NULL because bus->devs.i2c ends up being empty.
> > > > > >
> >
> > Checked both .master_xfer() function registered for pure i2c controller and
> > for i3c controller.
> >
> > I2C controller provides full implementation of .master_xfer() function from
> > vendor driver, whereas for i3c controller, framework  first validates if any
> > i2c devices with the passed address is already registered or not ?
> >
> > To suggest at i3c_master_i2c_adapter_xfer() - what's wrong if
> > i3c_master_find_i2c_dev_by_addr() returns NULL ? can we not continue instead
> > of returning -ENOENT ? If slave is not present, than we get NACK else
> > continue to perform  master->ops->i2c_xfers() ?
> >
> > This is just my thought, I may be wrong. Please point me if i am missing any
> > fundamental from I3C specs.
> 
> master.c search i2c_dev_desc to pass to controller driver.
> 
> static int dw_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
>                                    struct i2c_msg *i2c_xfers,
>                                    int i2c_nxfers)
> 
> look like below is more reasonable.
> 
> static int dw_i3c_master_i2c_xfers(
>         struct i3c_master_controller *master,
>         struct i2c_msg *i2c_xfers,
>         int i2c_nxfers)

I have tried this change already. Two things to note:

1. Yes, passing `struct i3c_master_controller *` instead of `struct
i2c_dev_desc *` makes sense, but isn't strictly necessary.
2. The Cadence i3c master still won't work without a call to
`i3c_master_attach_i2c_dev()`.

Let me elaborate on the latter.

The cadence i3c master has 10 "retaining registers" (11, but one is
referring to the master device itself).
If communication is attempted with a device which is not in a retaining
register, the command register's error field will just report "data
access error".

The simplest solution that I have found is:

1. Try to find a known device with `i3c_master_find_i2c_dev_by_addr`
2. If that returns NULL, allocate a new device with
   `i3c_master_allocate_i2c_dev` and attach it with
   `i3c_master_attach_i2c_dev`.
3. Now attempt communication.
4. If errored, detach and deallocate.

Of the four steps, current linux performs only step 1.
I did omit error handling in step 2, but only for brevity.

Regards,
Boris Staletic

> 
> I am not sure why not use addr information in i2c_xfers, like other i2c
> adaptor driver.
> 
> So framework needn't scan known dev for specific addr.
> 
> It looks like not worth to update all drivers and frameworks only for
> i2cdetect function, which generally used for debug only.
> 
> And actually, i3c transfer protocol is difference i2c although address phase
> is the same. but data transfer phase is difference.
> 
> Frank
> 
> >
> > > > > > Since the I2C drivers have i2c_detect and i3c_master_controller has its own i2c_adater, I looked into what needs to be done for networks
> > > > > > with I3C masters to use the existing i2c_detect mechanism. That lead me to the following list of changes:
> > > > > >
> > > > > > - i3c_master_controllr's i2c_adapter needs to have its class member set.
> > > > > > - In i2c_detect_address, temp_client->dev needs to be populated and registered before the call to i2c_default_probe.
> > > > > >    - Otherwise the attempt to probe gets rejected early, for the same reason described above (i3c_master_find_i2c_dev_by_addr returning NULL).
> > > > > >
> > > > > > That much was enough to get i2c_detect to work with an I3C master.
> > > > > > To complete the use case I also needed a registered i2c_driver that implements a simple i2c_driver.detect function.
> > > > > > In my test, the detect function simply checked whether i2c_smbus_read_byte_data(client, 0) returns a non-error value.
> > > > > >
> > > > > > Could anyone comment whether this is the right approach for implementing I2C slave detection with an I3C master?
> > > > >
> > > > > Generally, it is the same as I2C. just send out address, and check if target
> > > > > ACK/NACK this address.
> > > >
> > > > Are you referring here to i2c_new_scanned_device? If so, that also, in
> > > > my testing, couldn't detect any devices without modificatioins.
> > > > The failure to scan happens because:
> > > >
> > > > - i2c_new_scanned_device calls i2c_default_probe, which calls
> > > >    i2c_smbus_xfer.
> > > > - that eventually gets to i3c_master_i2c_adapter_xfer, which looks up
> > > >    existing devices by calling i3c_master_find_i2c_dev_by_addr.
> > > > - i3c_master_find_i2c_dev_by_addr returns NULL
> > > > - i3c_master_i2c_adapter_xfer then returns -ENOENT, ven before trying to
> > > >    communicate over the wire.
> > > >
> > > > I am probably missing something, because, as far as I can tell, neither
> > > > i2c_detect, nor i2c_new_scanned_device can currently be used with an I3C
> > > > master.
> > > >
> > > > Would you mind elaborating more on the suggested approach?
> > > >
> > >
> > > Replying here to post the diff of what I have tried (and attempted to
> > > explain the opening email). Hopefully it will make it clearer what
> > > is our need and (more so) what my attempted solution does.
> > >
> > > -------------------------------------------------------------
> > >
> > > This change allows I3C master drivers to trigger I2C slave detection
> > > by i2c slave drivers, leveraging the existing i2c_detect mechanism.
> > > ---
> > >   drivers/i2c/busses/Makefile     |  1 +
> > >   drivers/i2c/busses/i2c-axiado.c | 53 +++++++++++++++++++++++++++++++++
> > >   drivers/i2c/i2c-core-base.c     | 12 +++++++-
> > >   drivers/i3c/master.c            |  1 +
> > >   4 files changed, 66 insertions(+), 1 deletion(-)
> > >   create mode 100644 drivers/i2c/busses/i2c-axiado.c
> > >
> > > diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> > > index 04db855fdfd6..7b51df1433c4 100644
> > > --- a/drivers/i2c/busses/Makefile
> > > +++ b/drivers/i2c/busses/Makefile
> > > @@ -42,6 +42,7 @@ obj-$(CONFIG_I2C_AT91)            += i2c-at91.o
> > >   i2c-at91-y                        := i2c-at91-core.o i2c-at91-master.o
> > >   i2c-at91-$(CONFIG_I2C_AT91_SLAVE_EXPERIMENTAL)    += i2c-at91-slave.o
> > >   obj-$(CONFIG_I2C_AU1550)  += i2c-au1550.o
> > > +obj-y                              += i2c-axiado.o
> > >   obj-$(CONFIG_I2C_AXXIA)           += i2c-axxia.o
> > >   obj-$(CONFIG_I2C_BCM2835) += i2c-bcm2835.o
> > >   obj-$(CONFIG_I2C_BCM_IPROC)       += i2c-bcm-iproc.o
> > > diff --git a/drivers/i2c/busses/i2c-axiado.c b/drivers/i2c/busses/i2c-axiado.c
> > > new file mode 100644
> > > index 000000000000..d5006e250a3d
> > > --- /dev/null
> > > +++ b/drivers/i2c/busses/i2c-axiado.c
> > > @@ -0,0 +1,53 @@
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > +/*
> > > + * I2C bus driver for the Cadence I2C controller.
> > > + *
> > > + * Copyright (C) 2009 - 2014 Xilinx, Inc.
> > > + */
> > > +
> > > +#include <linux/clk.h>
> > > +#include <linux/delay.h>
> > > +#include <linux/i2c.h>
> > > +#include <linux/interrupt.h>
> > > +#include <linux/io.h>
> > > +#include <linux/iopoll.h>
> > > +#include <linux/module.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/of.h>
> > > +#include <linux/pm_runtime.h>
> > > +#include <linux/pinctrl/consumer.h>
> > > +#include <linux/reset.h>
> > > +
> > > +static const unsigned short normal_i2c[] = { 0x48, 0x49, 0x50, 0x51, 0x52, 0x53, I2C_CLIENT_END };
> > > +
> > > +static int ax_i2c_detect(struct i2c_client *client, struct i2c_board_info *info)
> > > +{
> > > +   int byte = i2c_smbus_read_byte_data(client, 0);
> > > +   if(byte < 0)
> > > +           return -ENODEV;
> > > +   strscpy(info->type, "axiado-client", I2C_NAME_SIZE);
> > > +   return 0;
> > > +}
> > > +
> > > +static const struct of_device_id ax_i2c_of_match[] = {
> > > +   { .compatible = "axiado,ax300",},
> > > +   { /* end of table */ }
> > > +};
> > > +MODULE_DEVICE_TABLE(of, ax_i2c_of_match);
> > > +
> > > +
> > > +static struct i2c_driver ax_i2c_drv = {
> > > +   .driver = {
> > > +           .name  = "axiado",
> > > +           .of_match_table = ax_i2c_of_match,
> > > +   },
> > > +   .detect = ax_i2c_detect,
> > > +   .address_list = normal_i2c,
> > > +   .class = I2C_CLASS_HWMON
> > > +};
> > > +
> > > +module_i2c_driver(ax_i2c_drv);
> > > +
> > > +MODULE_AUTHOR("Boris Staletic axiado-2532@axiado.com");
> > > +MODULE_DESCRIPTION("Axiado I2C bus driver");
> > > +MODULE_LICENSE("GPL");
> > > diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> > > index ecca8c006b02..231c43cf657d 100644
> > > --- a/drivers/i2c/i2c-core-base.c
> > > +++ b/drivers/i2c/i2c-core-base.c
> > > @@ -2467,13 +2467,22 @@ static int i2c_detect_address(struct i2c_client *temp_client,
> > >             return 0;
> > >
> > >     /* Make sure there is something at this address */
> > > -   if (!i2c_default_probe(adapter, addr))
> > > +   temp_client->dev.bus = &i2c_bus_type;
> > > +   temp_client->dev.type = &i2c_client_type;
> > > +   temp_client->dev.parent = &temp_client->adapter->dev;
> > > +   dev_set_name(&temp_client->dev, "i2c-temp-client");
> > > +   int err3 = device_register(&temp_client->dev);
> > > +   int err2 = i2c_default_probe(adapter, addr);
> > > +   if (!err2) {
> > > +           device_unregister(&temp_client->dev);
> > >             return 0;
> > > +   }
> > >
> > >     /* Finally call the custom detection function */
> > >     memset(&info, 0, sizeof(struct i2c_board_info));
> > >     info.addr = addr;
> > >     err = driver->detect(temp_client, &info);
> > > +   device_unregister(&temp_client->dev);
> > >     if (err) {
> > >             /* -ENODEV is returned if the detection fails. We catch it
> > >                here as this isn't an error. */
> > > @@ -2542,6 +2551,7 @@ static int i2c_detect(struct i2c_adapter *adapter, struct i2c_driver *driver)
> > >             dev_dbg(&adapter->dev,
> > >                     "found normal entry for adapter %d, addr 0x%02x\n",
> > >                     i2c_adapter_id(adapter), address_list[i]);
> > > +           memset(&temp_client->dev, 0, sizeof(temp_client->dev));
> > >             temp_client->addr = address_list[i];
> > >             err = i2c_detect_address(temp_client, driver);
> > >             if (unlikely(err))
> > > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > > index 2ef898a8fd80..5fabba14de20 100644
> > > --- a/drivers/i3c/master.c
> > > +++ b/drivers/i3c/master.c
> > > @@ -2494,6 +2494,7 @@ static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
> > >     /* FIXME: Should we allow i3c masters to override these values? */
> > >     adap->timeout = 1000;
> > >     adap->retries = 3;
> > > +   adap->class = 1;
> > >
> > >     id = of_alias_get_id(master->dev.of_node, "i2c");
> > >     if (id >= 0) {
> > > > Thanks in advance,
> > > > Boris Staletic
> > > >
> > > > >
> > > > > Address 7E, REPEAT START, scan's address. ACK/NACK STOP.
> > > > >
> > > > > Check ACK/NACK. But you don't know if it is i3c device or i2c device by this
> > > > > way.
> > > > >
> > > > > send 7E to avoid IBI during you send out address.
> > > > >
> > > > > Fank
> > > > >
> > > > > > The most iffy part of this approach is the need for such a dummy driver, just so the I3C master knows that "something exists".
> > > > > > I'd welcome any sort of feedback.
> > > > > >
> > > > > > Thanks,
> > > > > > Boris Staletic
> > > > > > --
> > > > > > linux-i3c mailing list
> > > > > > linux-i3c@lists.infradead.org
> > > > > > http://lists.infradead.org/mailman/listinfo/linux-i3c
> > >
> >
> >
> > --
> > linux-i3c mailing list
> > linux-i3c@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
