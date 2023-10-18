Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFF7CDB47E
	for <linux-i3c@archiver.kernel.org>; Wed, 18 Oct 2023 16:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9p0ihgmvyPPYzl8DmN6US8Ulpwar1vnrf49HxmCkN9k=; b=daJd053P6sHSdA
	8nkXsHy1Kv2Q0KVORtdFz2gvLo66vC6P5QcmOHTrswNbS9ALXxaFlIYCR6Nbve5B11WnEyDUcX51o
	GnWHPTSrmRafzzjzkrAmwP0cXWeXuhVR3y7rQ7cFkKuhl5LoondNzQaenV6qVNPgw/dJu/aBFP2UR
	KZ6rFsK1YFk49ib3GXQD+g2Cc2MZI2LWrGZS91GzFdgj8lUbqQGR2le/ValP5xwthyS4YPgsHoNoH
	wHV87/ugVPmd90SDOCPeDWplxeiv3+SiigZhursd7aEsufjKYD3lBgtNlzGS9RtmK3iMZfjpO1hDq
	e8DfkWLJovJXKi0PFkqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt8xp-00F7ur-1N;
	Wed, 18 Oct 2023 16:00:05 +0000
Received: from mail-he1eur04on0630.outbound.protection.outlook.com ([2a01:111:f400:fe0d::630] helo=EUR04-HE1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt8xl-00F7pR-0w
	for linux-i3c@lists.infradead.org;
	Wed, 18 Oct 2023 16:00:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PXIvC6ZLfNB+KGG0DzU8M85j5GIWB56VpQh6c4GPAf3BCF7gjkq4sS/OovCn4OPZvnhwmpxfju1qwYnXfsMj++JqXfeytijqP1tyqfMbYTQJSdc81uHDNlBTNJCXzH0KTnpIFcOkE8sVccj6Lbc/3hTewP8n+sKSNg6ZkrqonZFiBY4dnNlNO9P/s73BAGwOzZeJXOxvnOvGUx9fRNCIbP0QPX+200aSZgFZobtC64FhZQdB+/HOqnj2UX+c0CCUGZWjpgcVw1sTkjj/beoTlquNg5Ywu+sEppUFUfmN4vyYgyot0sv4jiRMY0aXZ5Hp6wzoCUskUckBAW/kC728xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=478803QczRFFXBUKZoVGKqPgxQF91oUCRqBqSsaRd+c=;
 b=QWeViCOLj9+yWPPu9X2ZaQjBd/Jj427tpv8uOkPEIyJjkQqpTile/Ogeh9282QquzXgDgdmCRhxQJSVmw+7afrBZikW2ovXedm4vXR5j5UVa0IKemmdegdYg//gMHkop68TFjJrewccgz3qFCZg7wLrxZ+zPW3c5Sk8CbiP5zss95ZCNuDRh/A9bv4uR9xHZPLvUdmtOlOTIEtbwpXlZUkwnwOtEI3LffRbjpxIGDz3ywwnNoJDyw1+0mzh+EWoFhCi014fuW3mp74WVgTCAl9pouv0+vgc+UwUqpfTjj2u6HnhR2WMZ9by6WrbehYjpJM5VvsePro1xBmP2Oomj2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=478803QczRFFXBUKZoVGKqPgxQF91oUCRqBqSsaRd+c=;
 b=I7lSfk6mpf4kco4xiOh1PzN5kobl9au2hHtcGe69DWXLY2mE3VQOrIitd5qc6peg73MI3eN+VrWVMuC5f8leVdxiwtQyC6aN3wyd0qSV6owNX3zRcs3e8D1qYIbA4HQSvCh1hIsdB807ZDfnwlBgdYnTGCBMAilUdYalThj3OZ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by AM7PR04MB6966.eurprd04.prod.outlook.com (2603:10a6:20b:109::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Wed, 18 Oct
 2023 15:59:58 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2%4]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 15:59:58 +0000
From: Frank Li <Frank.Li@nxp.com>
To: miquel.raynal@bootlin.com
Cc: Frank.Li@nxp.com,
	alexandre.belloni@bootlin.com,
	conor.culhane@silvaco.com,
	imx@lists.linux.dev,
	joe@perches.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 Resent 6/6] i3c: master: svc: fix random hot join failure since timeout error
Date: Wed, 18 Oct 2023 11:59:26 -0400
Message-Id: <20231018155926.3305476-7-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231018155926.3305476-1-Frank.Li@nxp.com>
References: <20231018155926.3305476-1-Frank.Li@nxp.com>
X-ClientProxiedBy: SJ0PR05CA0210.namprd05.prod.outlook.com
 (2603:10b6:a03:330::35) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|AM7PR04MB6966:EE_
X-MS-Office365-Filtering-Correlation-Id: c2be9190-f7fc-45cd-6d61-08dbcff34751
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Smkj3gwC3HUe66vGSDimpNAsvQlq7DV5p1MyVAdR7X+KEKe4PZSZZEj5/VnNVMKgxkC1ozjDt4VaK3YQjPcn37OMmUfFlkzj41AU5k5An8cGQOE5V/Jl4vS89JULr/fdYuXA7NOF5ct6H0nSyPm5wxSWfthKLaPdT5bKPQuFP/SGuhVJtfK1HuLwgIgVCjRXw4t/1sQnWuZogYXKKij9rQ6Q7BnX+VB0pLZwJEiOFEcmxwhN1Y9eh4wHTqj8hgaJWcl4Ob1WUkD5vtGaSG5rccTBGyr1RE30VZQSnSaN8elm2w2Y6fDMPW+0SvmTz4XiK5tSXfz2gIKw9YrWsXDNw6opudtkzNmXxTT5mOl/hc88IEdhqRr1NPzuZo6DcxJz+E2ZNNNp/bUmNAzl9qv1/Gh/I58Kyyp4hsWmM6R6pNbICtflNmFHSfmy/JHws+m2WuCs3Ohv8KsFPUy7hoaAPfFRd2gNrqsObFP1LaqFFn2pDaItddkDveYuJcH6GfWbnlzHO048918hk3yO7A4/8i/OLY0yRDJ8/E5/TL0tnCYdcAo40WlkCHxSYGmJ/pIL2GpUul+kuNf2m0VtW1BEcXiXvfyueL2dE83ZagKmuOiK1rpfJoJb8Z3HWOpwdoO6
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(376002)(396003)(136003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(2906002)(478600001)(6486002)(6666004)(38100700002)(8936002)(5660300002)(8676002)(66556008)(4326008)(66946007)(316002)(36756003)(66476007)(6916009)(86362001)(41300700001)(6512007)(52116002)(1076003)(6506007)(2616005)(26005)(38350700005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGYzVUdwSlJJUDFkVWw5VjB1a3RONUF2UCtYREFtdnpGS2RjS0tPK01jaEpI?=
 =?utf-8?B?c1djekpaWnBQZnZqNWlyY2NOdXJSL252WWxKaksyU1dReWxqaUxWY1E2dlVB?=
 =?utf-8?B?djJSMGlnM0ZCS2tSUHRsMWNyMHMraXA0anA4QWRXQ2RoaThVVlhKNTFMUUFX?=
 =?utf-8?B?REY4QXN3dVMvY1lHL2ZWUVp0N1RaUEt5YTU2NDgwcVN4SFNCcWFmY3U3REY3?=
 =?utf-8?B?MFR4OC9VVUY0TFJTSHJJNWFROG1VaC9OUmVaeFlVaWQ5Y3QrU21nUURrRVpy?=
 =?utf-8?B?Q3huQjR5TmdWSzRLTmFHQmt4NkZmZlVwRUZaUFZyL0xyZUg1WENTN2kwQndy?=
 =?utf-8?B?NUpoWHJmOEJDZVFJL3pKbTBpRk5yc0k2QnF5UHBjT3NHcGNSRGd4cUR0bHIx?=
 =?utf-8?B?a1MxMWNqT0NldTFxSG9pZXZvcFpuSFNLUzB6VkdCUU95SVFYTGM4Nms4TnJS?=
 =?utf-8?B?eEJydis1NzdXeVdnR0psN0dGQStkSlFQQUpHaHJUU0I4aVhDU3BtbmJCUEw5?=
 =?utf-8?B?am05WFNLbkJYU2ZwTWhZTUJMNzdDUnpZajBmbVVHRkpIY1gxR1hYT0xweWgr?=
 =?utf-8?B?ekpSdHVrZ2ZvdDhSMU1hMjhqT2cwNSs5bitqSEduMUtGNnBjdGZGdG1pRmFP?=
 =?utf-8?B?QnJBazZaYWoxem84UEREU1FIT1c1Q3YxdTZKbjlIL3l3bGV3N0g0L3ZRT0pV?=
 =?utf-8?B?dVRIdFNGZEZwLzZKNW12NU12dFZTRnozNHkzSEVXbk55amxESElmcy8ybytK?=
 =?utf-8?B?WnVoNzhQSnZsMTdtdVQxbUNDMXZMalduM0RRMlhsYVRmSXNLK09ERGN1UzA4?=
 =?utf-8?B?YUhiMHhySGdtUk56S0hSeEVoMUtKNURlcGQ2cml6NHc2VlJlNXFFTmM0aWRu?=
 =?utf-8?B?aDdQSU1ILzlBTDdrTUFlMFZkVlhtU2FqeEJBUmNabVR6d29FMUJUSHBSUzRo?=
 =?utf-8?B?Q3FkeGdQditKQUtUcXVOQXZvSUhuSS82SG1pL2piZmhuTmU5NnFTSDk0MXFh?=
 =?utf-8?B?TjBMYUtDTDVtOTNqTkp3NGpBWGJvNEtUV3E3ZlExdWFKcTc5SHlpNU1QWm4r?=
 =?utf-8?B?cnlsWEUxZ2d1eTlObXpLZVIycDBWTi8xOGRWaGdIT0ZHSWl6ZHhWUEJZZ3lJ?=
 =?utf-8?B?VTN3TGZZK2RHcGlZZEZNbE5NelhLbG8wM2ZxcTNESU9rcThtL25JWmZqSGRv?=
 =?utf-8?B?NEgxOEcrSGVKL2k0MmY2YVZlaG9HMXBVRGJUcjhBZlZJTFFHQldGOUVJSXA5?=
 =?utf-8?B?SnFUZnY5VEtNdUZCR2xQbXhzTmU0U1VJQzVaTDUxOE5pZ2tXYU9Qd0FuS3pp?=
 =?utf-8?B?YTl0RFViMmVuVE96VXYxS2hDTHViTlVMT3k4ZjdMQWRoQ3VvVUFESGY4TlJ4?=
 =?utf-8?B?U1JrRDBtdHlqNjV2bWE1UVVpRDF3SU85bjRoYzl3V3pudVpiWmFqdUFwcnV1?=
 =?utf-8?B?eFc4SysyWFBsNHd4OGxTQkdRbUZnKy9CSGs3a2RhZzFtQjZwcmd3b3pVb0Jv?=
 =?utf-8?B?UUJqcWhSY3BWTytoV1FsZVkyYTk1Y3JrRklhSTJtN3NrWHR5TldNZEh0cWtp?=
 =?utf-8?B?MXc2dVRDQUZLR0lwU0Juc2VCZGtkS0FNZ01WdTBRc2ZIbEZqN2tBQ0VDY2xC?=
 =?utf-8?B?Rkd6ZWFyRU9aRHRTMFRJY3pVekd1dXpOVGtscG9kRkIwZjBpMktidk5WemVZ?=
 =?utf-8?B?TnpSdWxKMW5KYmozdEtCaWQwcmFpcE9naXRlUnU1L0lKUkQxNVdZblVUNm04?=
 =?utf-8?B?RkRZa2s4RUtpUWtHUUIvQ3o3eURHd1FKcXZ0ZUlWelNmRFVJMXhEN09KWWpl?=
 =?utf-8?B?SlluMXlSNWFrdjZvd2pqd3FYTXU5OVpFQTdTclQxeHpPenJwQnVGVW9ENVBk?=
 =?utf-8?B?amFoZXI1MzNHZW10UUJxZXFNOVVsRmlzQjlKQ0VYY0JxV3k5VGFsc08zWnh1?=
 =?utf-8?B?OGxtR2NHbnFJc2ZoVWNYcm02Wlp6VVcyME80b2pMRGkvVGFvVllCMTdNcE5L?=
 =?utf-8?B?TVF6SExiaHdOdUtkc05FWTlGRXZXWkZvbmtmK3NZdW5iMVg4ZE9xeDdIVUcx?=
 =?utf-8?B?MFVJY3hDeExlM1JoR1BMTlBiazFGSG5LaUcyaFd6SU5SMGZpWDBQMyt4MThj?=
 =?utf-8?Q?GKqPKpgYhS11pSc+BGHyCDWml?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2be9190-f7fc-45cd-6d61-08dbcff34751
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 15:59:58.5131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4I63UuGnjXmXnwy8MxQis7lE52/x2VZWoraOOvtBb+ac2OVVWOFq1FgDitYaoM1rPLMYGh/QX9lhRt+GEq1sPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6966
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_090001_357200_C4C717EB 
X-CRM114-Status: GOOD (  10.88  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

bWFzdGVyIHNpZGUgcmVwb3J0OgogIHNpbHZhY28taTNjLW1hc3RlciA0NDMzMDAwMC5pM2MtbWFz
dGVyOiBFcnJvciBjb25kaXRpb246IE1TVEFUVVMgMHgwMjAwOTBjNywgTUVSUldBUk4gMHgwMDEw
MDAwMAoKQklUIDIwOiBUSU1FT1VUIGVycm9yCiAgVGhlIG1vZHVsZSBoYXMgc3RhbGxlZCB0b28g
bG9uZyBpbiBhIGZyYW1lLiBUaGlzIGhhcHBlbnMgd2hlbjoKICAtIFRoZSBUWCBGSUZPIG9yIFJY
IEZJRk8gaXMgbm90IGhhbmRsZWQgYW5kIHRoZSBidXMgaXMgc3R1Y2sgaW4gdGhlCm1pZGRsZSBv
ZiBhIG1lc3NhZ2UsCiAgLSBObyBTVE9QIHdhcyBpc3N1ZWQgYW5kIGJldHdlZW4gbWVzc2FnZXMs
CiAgLSBJQkkgbWFudWFsIGlzIHVzZWQgYW5kIG5vIGRlY2lzaW9uIHdhcyBtYWRlLgogIFRoZSBt
YXhpbXVtIHN0YWxsIHBlcmlvZCBpcyAxMCBLSHogb3IgMTAwIM68cy4KClRoaXMgaXMgYSBqdXN0
IHdhcm5pbmcuIFN5c3RlbSBpcnEgdGhyZWFkIHNjaGVkdWxlIGxhdGVuY3kgaXMgcG9zc2libGUK
YmlnZ2VyIHRoYW4gMTAwdXMuIEp1c3Qgb21pdCB0aGlzIHdhcmluZy4KCkZpeGVzOiBkZDNjNTI4
NDZkNTkgKCJpM2M6IG1hc3Rlcjogc3ZjOiBBZGQgU2lsdmFjbyBJM0MgbWFzdGVyIGRyaXZlciIp
CkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IEZyYW5rIExpIDxGcmFu
ay5MaUBueHAuY29tPgotLS0KCk5vdGVzOgogICAgQ2hhbmdlIGZyb20gdjEgdG8gdjIKICAgIC1u
b25lCgogZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMgfCA2ICsrKysrKwogMSBm
aWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21h
c3Rlci9zdmMtaTNjLW1hc3Rlci5jIGIvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVy
LmMKaW5kZXggMWE1N2ZkZWJhYTI2ZC4uZmVkYjMxZTAwNzZjNCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL3N2
Yy1pM2MtbWFzdGVyLmMKQEAgLTkzLDYgKzkzLDcgQEAKICNkZWZpbmUgU1ZDX0kzQ19NSU5UTUFT
S0VEICAgMHgwOTgKICNkZWZpbmUgU1ZDX0kzQ19NRVJSV0FSTiAgICAgMHgwOUMKICNkZWZpbmUg
ICBTVkNfSTNDX01FUlJXQVJOX05BQ0sgQklUKDIpCisjZGVmaW5lICAgU1ZDX0kzQ19NRVJSV0FS
Tl9USU1FT1VUIEJJVCgyMCkKICNkZWZpbmUgU1ZDX0kzQ19NRE1BQ1RSTCAgICAgMHgwQTAKICNk
ZWZpbmUgU1ZDX0kzQ19NREFUQUNUUkwgICAgMHgwQUMKICNkZWZpbmUgICBTVkNfSTNDX01EQVRB
Q1RSTF9GTFVTSFRCIEJJVCgwKQpAQCAtMjI2LDYgKzIyNywxMSBAQCBzdGF0aWMgYm9vbCBzdmNf
aTNjX21hc3Rlcl9lcnJvcihzdHJ1Y3Qgc3ZjX2kzY19tYXN0ZXIgKm1hc3RlcikKIAlpZiAoU1ZD
X0kzQ19NU1RBVFVTX0VSUldBUk4obXN0YXR1cykpIHsKIAkJbWVycndhcm4gPSByZWFkbChtYXN0
ZXItPnJlZ3MgKyBTVkNfSTNDX01FUlJXQVJOKTsKIAkJd3JpdGVsKG1lcnJ3YXJuLCBtYXN0ZXIt
PnJlZ3MgKyBTVkNfSTNDX01FUlJXQVJOKTsKKworCQkvKiBpZ25vcmUgdGltZW91dCBlcnJvciAq
LworCQlpZiAobWVycndhcm4gJiBTVkNfSTNDX01FUlJXQVJOX1RJTUVPVVQpCisJCQlyZXR1cm4g
ZmFsc2U7CisKIAkJZGV2X2VycihtYXN0ZXItPmRldiwKIAkJCSJFcnJvciBjb25kaXRpb246IE1T
VEFUVVMgMHglMDh4LCBNRVJSV0FSTiAweCUwOHhcbiIsCiAJCQltc3RhdHVzLCBtZXJyd2Fybik7
Ci0tIAoyLjM0LjEKCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWkzYwo=
