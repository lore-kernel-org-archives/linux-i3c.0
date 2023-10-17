Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1398CDB474
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Oct 2023 15:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OdLCxxabQcuUlFPOowhtcYfU4UCEq0ebKJUBbRRETpQ=; b=LESqeid7rtglzJ
	/q9bklxUYWGQu71xWZa89G7KhdGlUurhZaith3/Ye9TTsD60LwJyr/gf8d/kQiTD07C5nP1tzGMaE
	I5i8rIcnkJ5PvAvRpcTn+CQczGQjb8Sld1+reO1m3jOg27XnZN3s8RJfa2b0hUU21Uw1D2Bo0QpuW
	2Ozizt9rqfEVx4blaTxqoP3OGJcxKmTJ4D7yXketwKc9Yi0cob+HH2HSRPUUIbBntTgt2QrIxYmcr
	B/DAGxZa4NlctfyZ/2j9DtG9J0AFlFa+R6GJjZFNNEBm6VrKcmU7BwJrc5wdvFd2OEBAB/d5clh7u
	3+xZfcqY95hGGawU1NOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qslxB-00Cjg8-1F;
	Tue, 17 Oct 2023 15:25:53 +0000
Received: from mail-vi1eur02on2062e.outbound.protection.outlook.com ([2a01:111:f400:fe16::62e] helo=EUR02-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qslx8-00CjfP-2p
	for linux-i3c@lists.infradead.org;
	Tue, 17 Oct 2023 15:25:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TcV1zp2LxqSavayH2ymx2lq/wkA5MttX6t+vvx/akAZ02prYRGuLWFzAOKOO/DhPPTk319XDUHubnTUxMUP4eMdtNZzJxnXf+XdzX1xo0ztTdlrLMGGdkCSzQkYc6yYL4jZFEXrWb34zdsKoAHvop8mVfsliEdaWeRHHjU/FutefwcHdT95s+05Hl7gdUKWlglQOQEUTJbWr7TK+B71gyc/YfpZzr02A+pRZWIoteXdz/8te6v0DXDDQasoP7PTDyRTzUPka8dRPIpjnP23g3tsfHZAY0Hksvs58iDzSSiuTZsDnczX5jgALasCiJtizoP3SFUSEVe9Jy8KW6MQ3Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BhpL+3p/lYUiDJGPKlnyBtBYFV8mchDVP4HqJ9uv/DA=;
 b=k1BRyzs4ykhDRTExn4EetyiWbIsu9EJCuSRmpVCRzhMs1IYGPYiWKpAU1M3vOAFHOSjQSUwwddW1PoNDBl+zbZd1b+8rdTIJ33cQ9BIP4RTqRVPxAXmJ9y5yE1AxYWf2K8Sf5tttYkQMAN3rirnuPRmNGHxghEbjOpGZ80bkcid6QrMgpMA83xbdcUJeYMDBJf1YdqPKT6E2IbdqxaQQnxNWzf6Vkz5kq7vLwgB+eHqsTT19oBgEDfu+ZBvgjZ0iDpp3DyMI68NDZdRh3JuHOBZRmFSE0cFVbPgUVzJJMRDYSmIhcP5eP20YmCmnSijcdTlWuhSw7wu9n2Pe5bXEDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BhpL+3p/lYUiDJGPKlnyBtBYFV8mchDVP4HqJ9uv/DA=;
 b=GLvXg4+yOUo8kDArRm+5OHhR/6r82gPgsnhQN9mRwgbYZEpRyrVZEbA+oLUG+OkI2yqGbEjpZ30b4er36KlqPEsxRbZn678ARo3JBFTi1JYXU9JkT3RVWaAexjMXRUhHpZRsw59aKMKDtUIUO04L0NR445YSGuhiVme3Jr75pmw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by DB9PR04MB8185.eurprd04.prod.outlook.com (2603:10a6:10:240::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Tue, 17 Oct
 2023 15:25:44 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2%4]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 15:25:44 +0000
Date: Tue, 17 Oct 2023 11:25:37 -0400
From: Frank Li <Frank.li@nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: conor.culhane@silvaco.com, alexandre.belloni@bootlin.com,
	joe@perches.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 6/6] i3c: master: svc: fix random hot join failure since
 timeout error
Message-ID: <ZS6ncZeNaen13s1b@lizhi-Precision-Tower-5810>
References: <20231016153232.2851095-1-Frank.Li@nxp.com>
 <20231016153232.2851095-7-Frank.Li@nxp.com>
 <20231017163335.16770af2@xps-13>
 <ZS6d+mANtuhoAcuX@lizhi-Precision-Tower-5810>
 <20231017170603.5ef996c2@xps-13>
Content-Disposition: inline
In-Reply-To: <20231017170603.5ef996c2@xps-13>
X-ClientProxiedBy: BYAPR11CA0086.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::27) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|DB9PR04MB8185:EE_
X-MS-Office365-Filtering-Correlation-Id: b9b4d50b-179a-4ae3-e4dd-08dbcf2554b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jmLouNxbQdaCfpRM0iA1PQAjpqyVVYzBbMfGnOZQgIpguW6vabnkkqduwC5fNfBP+0Lt6Fd/R62tHYRPjmzQ4XOgBEqSq8JsNl9/yOaGcscvgNgv1ODGX8vaEjEYX6zk/YPfdTYxOB0RnepTf8BDwApJniO+7RKmRzix/sSTvt8nNW1Baax8IETTpcyWDNq3LvUUHkwZ7hl5gjRsL2+mky9LuExbSFWmRgXEW48fgG5iIlfiIdAeZZPHIvyVHX3NIEjI6OChemZ2c/SdklvX2lvgUxy1Bl/3UOhctWJXmdN0KlecI4vqMaxyC+DZ3yP7kf8aw6K2ykQY69g2e05ABDcGTD/3kLl9el+AV23zggXzd/5axNSOTDJ2RtG7cwCPHKyJrxS50PdGPrM/wNLVNn7LOqcHKoB/7l3pgqqmMkiDGwqB0E8+9x7rNnQ2eSE64Wu5h8sI8ihgCZEOYdFf/rSHqbD3OMV8sHMNm0MuZD+b2oxuXRezoVgYGRnrfcTkemfwCQcM8bhkepsdv1BJwrH1jniTgCPlY0GfoVw9YRcLIwpmZitAzN39ub07cCz5kgbfo0KyDrclFBb+QpRF20GUXuo3m9jzs4ebJGHuK4a6d81fYkbUGety/ex/i4ge
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(366004)(396003)(39860400002)(136003)(376002)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(26005)(6666004)(66574015)(8936002)(52116002)(6506007)(83380400001)(41300700001)(4326008)(5660300002)(8676002)(2906002)(6486002)(33716001)(478600001)(66946007)(66556008)(6916009)(66476007)(316002)(38100700002)(86362001)(38350700005)(9686003)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elVhSXVqRnQ5ZTFRMnpvajBQTU1tNmk3YnJ0eW50L2VEOXFRWlZjZ0RhTEhQ?=
 =?utf-8?B?endwSlcrZGQ2K0VOVENXUzRsUnVjaVpnZ2ZmcGczR0lkbmV3d3JENDlyaGpK?=
 =?utf-8?B?TW1xQlRETTN5US9pMXU3QXNWOFMyYXhRQmdhemhPUU5zQ1VKR1N1SDNNNk9t?=
 =?utf-8?B?TENUSVlLR3ArS3g4RGxuSmt3TWxoaGxzcHpPMFlKS0hZbEp4bkdrdTVpV3dp?=
 =?utf-8?B?TU1BaHo2dzZGWkdDaGd1Rlp4Uy9aTUhDaERQemVGdDBwcFdFaVZBZDlSZ09o?=
 =?utf-8?B?eTJzME13WVUydlhvU0VEYm5xdTlUaUdVUUpuWkdWYVRMMkQ1UkVxTmI1WHlL?=
 =?utf-8?B?RUNZeUNUS0JOVXdUQ0k0eFBUVDE0cVRhdWxIditwdHhKbkd5NGlacXlMM3BE?=
 =?utf-8?B?Y3dIM2tlK25QTFBsdTNlRTFpaHg5L0twWEFwODhPR1VFR1ZEWllUZm5rZThQ?=
 =?utf-8?B?ZHl1SmhmSzBGRkFNSGljQWt1ZWZBUGNDZGNGVTNYVklyT3UwY0xKVktFR01w?=
 =?utf-8?B?aWNWNjZWVUtDWmltNEFkOE5aVUJnc3d6MWJtUHRWejBBTTRhd3Y2S3NsSzlD?=
 =?utf-8?B?NUJGdnR4V3pKc0RzSm5FWVVjREoxNFdyb2ZYMnl3WUpCOEJrSzI1M0NlNENR?=
 =?utf-8?B?V01HNENnWWdhbEtCZ0lKQy9zdnM3MmN6RzQzWWE4TEhOUDdieExlbGRFd2pY?=
 =?utf-8?B?TVdyQ2kxZHZ2VVFSYi9EVUVCYk9BNzBvbkkxL1ZIUlhtM2dqV1lMOXJnUGtF?=
 =?utf-8?B?NVVTdmE2c1EzSWtkU3NQV2hycW1QTVpXaTBPMGZ4UEFQWC9IanNhaEpzZDlF?=
 =?utf-8?B?ZzJDSzUzUlBFYWd4bDlnaFJ6a2JvWWtOR3dJZ1FsY1REbkhIVzljSTJja0Jq?=
 =?utf-8?B?NnRZTlhjTjJiQzNSQmU4c3lqbm9QaTEvODI4eVlDWGJka2o3SVltV2tqRDNL?=
 =?utf-8?B?b1JmWDROV0VzY3RDOW9vbFByN2NOMldwUS9PNVdlYitZaFhhd094YzBFMzl1?=
 =?utf-8?B?Q0JjblRKa1FML3lVdCtmVms0MnI3THovRUJ4WHh3enRId1VZMVJ1d0xwUndY?=
 =?utf-8?B?QVNVQjVOVUYrUEZUdU44NjRxQk9SOVg2RHZHTXAxZVdBVkJOa0d5c3YxYlpl?=
 =?utf-8?B?SU8vb1k0NkpoWWVhdy8veDVoSVZQT0R1TlJnNzM3bzJtVzVQM3g4RHFLa2Ry?=
 =?utf-8?B?N2Vlc3NGVkd2RjNkdExSVGdUbTVtb1UzcWs3ZHNINHdRTlhkYnBYcXFtZ2ZM?=
 =?utf-8?B?TlBrZzg3R2dvS3U5RzF5OTFZanNKS1htY1BnWU1YQTN0QXFmZTE5Q1JVNjdE?=
 =?utf-8?B?WXJlU2tnai9SeDIvZ0U2L3U0TVQ2NnNpNUoxZmpDVWlsLzJ0RzJPRW5qVGpV?=
 =?utf-8?B?bkVBU0Iwd0gyQ0F0UXVIUFZxTWxnZVBnS3pzQlB5aVVNSjVYdVhCYk4yMUZr?=
 =?utf-8?B?SEVrUFRxWXR0MGhBU0xBSUVYeW5FalE4TEJMM1F2d25DUFZEY2Zhb3hqYndW?=
 =?utf-8?B?bzNnNndhTUk3NGRtbngweGFseEtBK1I1L2VPYnJiY01RcFF3U0FqWXd1dzJ1?=
 =?utf-8?B?SWloYnpnc1V4WmRXL2NTanJBenlIdm5QcFJiZFY0dGRvUEw3TGxDYWhmY0gy?=
 =?utf-8?B?Zmw5TWlXUjBMa1pHL1pkdXBPVWpWcDZnU2hIeE1HUVNvZ3ZULzlhU3NydWZq?=
 =?utf-8?B?U0M1SWtIcGFLSWZmZ3ljSDNmb2NBNWllSGJGTERIazlTdUp6eDFxSS9oWm5r?=
 =?utf-8?B?TVVTa05Lc1RMS1FxQS9JbzdxYUZSMHljd1BIZnhKRmNiN1J2bVlMR2hEN09Z?=
 =?utf-8?B?WmdaMnB3MHpkNHA2Q0VLRnpFUjl2bGtqSGRUVUUrNFowVUJnMWpYeU10cDB2?=
 =?utf-8?B?ZkI5RHpjbm10L2hDanh2VkhFZmZPSGhqTnFIelJDMlk3Z1RaNnZrMWdXd2dT?=
 =?utf-8?B?U012bzNvVFFDSTl5ZUtmSE9KdVdEeVhQZTBwMHJ5dWRqcFFaSWRmdUZOL3o5?=
 =?utf-8?B?WTFNQVdCNzRvMHhVZWcrUVA5cTViTmQzM2I3VDZ3VXRFaFo2Q3NPL3ZmYUJy?=
 =?utf-8?B?SVpPbVNaaDlSVU42SWgzWGNISmVqQmxFZmxoWWh3S3psbXh6WjlTWVQvYmVu?=
 =?utf-8?Q?8rB3SFMk7RndBci5OnSKG5vE6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b4d50b-179a-4ae3-e4dd-08dbcf2554b6
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 15:25:44.6186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 03OhmdVEmqhuInnFDxq2A9SvPTrmdIBKzSPU5boRe4uPXaKgAg0O119z4Uwz5vl1t4vyiFXih+hM0UK18N84IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_082550_920241_B73A5D9F 
X-CRM114-Status: GOOD (  22.60  )
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

T24gVHVlLCBPY3QgMTcsIDIwMjMgYXQgMDU6MDY6MDNQTSArMDIwMCwgTWlxdWVsIFJheW5hbCB3
cm90ZToKPiBIaSBGcmFuaywKPiAKPiBGcmFuay5saUBueHAuY29tIHdyb3RlIG9uIFR1ZSwgMTcg
T2N0IDIwMjMgMTA6NDU6MTQgLTA0MDA6Cj4gCj4gPiBPbiBUdWUsIE9jdCAxNywgMjAyMyBhdCAw
NDozMzozNVBNICswMjAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4gPiBIaSBGcmFuaywKPiA+
ID4gCj4gPiA+IEZyYW5rLkxpQG54cC5jb20gd3JvdGUgb24gTW9uLCAxNiBPY3QgMjAyMyAxMToz
MjozMiAtMDQwMDoKPiA+ID4gICAKPiA+ID4gPiBtYXN0ZXIgc2lkZSByZXBvcnQ6Cj4gPiA+ID4g
ICBzaWx2YWNvLWkzYy1tYXN0ZXIgNDQzMzAwMDAuaTNjLW1hc3RlcjogRXJyb3IgY29uZGl0aW9u
OiBNU1RBVFVTIDB4MDIwMDkwYzcsIE1FUlJXQVJOIDB4MDAxMDAwMDAKPiA+ID4gPiAKPiA+ID4g
PiBCSVQgMjA6IFRJTUVPVVQgZXJyb3IKPiA+ID4gPiAgIFRoZSBtb2R1bGUgaGFzIHN0YWxsZWQg
dG9vIGxvbmcgaW4gYSBmcmFtZS4gVGhpcyBoYXBwZW5zIHdoZW46Cj4gPiA+ID4gICAtIFRoZSBU
WCBGSUZPIG9yIFJYIEZJRk8gaXMgbm90IGhhbmRsZWQgYW5kIHRoZSBidXMgaXMgc3R1Y2sgaW4g
dGhlCj4gPiA+ID4gbWlkZGxlIG9mIGEgbWVzc2FnZSwKPiA+ID4gPiAgIC0gTm8gU1RPUCB3YXMg
aXNzdWVkIGFuZCBiZXR3ZWVuIG1lc3NhZ2VzLAo+ID4gPiA+ICAgLSBJQkkgbWFudWFsIGlzIHVz
ZWQgYW5kIG5vIGRlY2lzaW9uIHdhcyBtYWRlLgo+ID4gPiA+ICAgVGhlIG1heGltdW0gc3RhbGwg
cGVyaW9kIGlzIDEwIEtIeiBvciAxMDAgzrxzLgo+ID4gPiA+IAo+ID4gPiA+IFRoaXMgaXMgYSBq
dXN0IHdhcm5pbmcuIFN5c3RlbSBpcnEgdGhyZWFkIHNjaGVkdWxlIGxhdGVuY3kgaXMgcG9zc2li
bGUgIAo+ID4gPiAKPiA+ID4gCQkJCQkJCWNhbiBiZSBiaWdnZXIgIAo+ID4gPiA+IGJpZ2dlciB0
aGFuIDEwMHVzLiBKdXN0IG9taXQgdGhpcyB3YXJpbmcuICAKPiA+ID4gCj4gPiA+IEknbSBub3Qg
c3VyZSB0aGlzIGlzIHRoZSBjb3JyZWN0IGFwcHJvYWNoLiBJdCdzIGEgcmVhbCBpc3N1ZSBidXQg
dGhlcmUKPiA+ID4gaXMgbm90IG11Y2ggd2UgY2FuIGRvIGFib3V0IGl0LiBQZXJoYXBzIGRldl9l
cnIgaXMgdG9vIGhpZ2gsIGJ1dCBJCj4gPiA+IHdvdWxkIG5vdCBlbnRpcmVseSBkcm9wIHRoaXMg
bWVzc2FnZS4gTWF5YmUgYSBjb21tZW50IGFuZCB0dXJuaW5nIHRoZQo+ID4gPiBtZXNzYWdlIGlu
dG8gYSBkYmcgcHJpbnRrIHdvdWxkIGJlIG1vcmUgYXBwcm9wcmlhdGU/ICAKPiA+IAo+ID4gVGhl
IGtleSBpcyBub3QgbWVzc2FnZS4gSXQgcmV0dXJuIHRydWUsIG1lYW5zIElCSS9ISiB0aHJlYWQg
d2lsbCBub3QgcnVuLgo+IAo+IEJ1dCB3aHkgc2hvdWxkIHRoZSB3b3JrZXJzIHJ1biBpZiBpdCdz
IHRvbyBsYXRlPwoKSUJJIEFDSyBhbHJlYWR5IHNlbnQsIHRhcmdldCB0aGluayBtYXN0ZXIgYWxy
ZWFkeSBhY2NlcHRlZCBJQkkuIHRoZW4gbWFzdGVyCmRyaXZlciBjaGVjayBUSU1FT1VULCAKCklm
IHdpdGhvdXQgcnVuIElCSSB0aHJlYWQsIHRhcmdldCdzIGRyaXZlciB3aWxsIHdhaXQgdGFyZ2V0
IHNlbnQgSUJJLiBBbmQKdGFyZ2V0IHdhaXQgZm9yIGRyaXZlciBoYW5kbGUgSUJJLiAKClNvIHRo
ZSB3aG9sZSBzeXN0ZW0gbWF5IGxvY2sgb3Igd2FpdCBmb3IgbG9uZyB0aW1lIG91dC4KCkhhcmR3
YXJlIGNoZWNrIFRJTUVPVVQgYW5kIHNvZnR3YXJlIHNlbmQgQUNLIGlzIHRvdGFsbHkgYXN5bmMu
Cgo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51
eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
