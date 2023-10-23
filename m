Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E3DC25B43
	for <linux-i3c@archiver.kernel.org>; Mon, 23 Oct 2023 16:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FawPtVxrp7/sz8LaCqrMp4+yHJFSm4PY7/whP0F7fMQ=; b=SIm76J5qGCVQ3R
	eIhDWBZM3co6kico2lvNUMXFwM1ZlxlLdSU+EhX6FsHyuo3qIZP7tlr4T6hOUWzn/kA9c5bKho4Gi
	pZ4QO8bPrpFCeP1zuSkPt+mO2t2REq1+ryj997DImRem/JUQs1prpLzxsaK65am1/8IQdpXEKpmMt
	8zytJfSw/e+MCUa40kWx3udLOR2209EPhXnzQLgfkQ6x2tAgUXEGMQ3+xm301by0/fvue07WhiL4t
	IsaPmYHeLQ61HIAdqzaw8iJ/CuNzP5JyiFcE752UsWrHabv5/9H9/TQF2aHQ5IslcN5jSGLQmxhxR
	86YD8mOpw2e+cyRF6QHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quxcU-007o6g-2r;
	Mon, 23 Oct 2023 16:17:34 +0000
Received: from mail-he1eur04on062f.outbound.protection.outlook.com ([2a01:111:f400:fe0d::62f] helo=EUR04-HE1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quxcR-007nyM-1o
	for linux-i3c@lists.infradead.org;
	Mon, 23 Oct 2023 16:17:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BRLI6FkfM/TdaI18u///YcnF0M0g1tIz0GvzM0xejITvTwaYIhkh/+mwTEOBeU0gvTiWJQSTt0jnelZEaLCcaZ9Q2VPV4oGKoyhvE4KqVyuh498Jl19lut+7cQyRawOyUR8Wx9Iu+DT50gXy2eIPKOM9kZQfAKWVH0JgrS1hwkBIzNAxQGDY37y/Omc7DnqDf46DyUgEpWXJTKC5dEmjduMBvtc4LaUTk4ILjtJfSge7u/bmUwYN10pb/9dK5/f+mGs/xap3KyIbwitgojhygMpVG+NOOBf+uJZfuAm5E9B5WMKA+aJdchc9L5IHzCC7TaChicD0G2twYbOVEVo3ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nxBwTfviefvCF4FZJghiatpkh63SM3ZApfysbHSxGKY=;
 b=SNnX29DqPMWWJ9x1Ds5XY/6Y5ps95vOjaahe6vSPe0wGM7Zlmbcql3s5IW8TEgkXJu42Ry+7iAl2uZtUbuVbxF6RAuuYVmmHr6AHZsDEwrPgKsAxQ4rBff0z6i59qZQf0TfhlE8t53ua+RiWURRKEPNY259vuGItGsJrW4/SwfYNX8CwbI3F33hkZfkyXbDTG9IRG5aCXGFK3FY6saxSCkeIecVyrFZHSSk/0JqP2a2meOrANJ2z4anAe2h3Xsnc7OdiEPhLv4B642QxppnLnjT4xOYjbo3v+2XUZ5yjyQojNA6DcyDyJbS2JWmzAGYcc9zhvENs7omtW5s5ZfV7oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nxBwTfviefvCF4FZJghiatpkh63SM3ZApfysbHSxGKY=;
 b=pbOcV8Av0KqKjZ5l+K+zgQjOsDMsYc4Vq1aB2o3MjVX2avT3yaZCu/SBJiXZIGGWNl/zF8JDHQFr8wHpctq69Yaz7vPQ5ww9INCPjHnMMv/spEugLKLdDpcOLw32T2Rw5VfnFTVCE1ogd2buW5liSZTdMYJ1GucalyYlSvl0w4s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by PAXPR04MB8655.eurprd04.prod.outlook.com (2603:10a6:102:21e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.16; Mon, 23 Oct
 2023 16:17:26 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::97ca:a905:8e64:c098]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::97ca:a905:8e64:c098%6]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 16:17:26 +0000
From: Frank Li <Frank.Li@nxp.com>
To: miquel.raynal@bootlin.com
Cc: Frank.li@nxp.com,
	alexandre.belloni@bootlin.com,
	conor.culhane@silvaco.com,
	imx@lists.linux.dev,
	joe@perches.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/6] i3c: master: svc: fix random hot join failure since timeout error
Date: Mon, 23 Oct 2023 12:16:58 -0400
Message-Id: <20231023161658.3890811-7-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023161658.3890811-1-Frank.Li@nxp.com>
References: <20231023161658.3890811-1-Frank.Li@nxp.com>
X-ClientProxiedBy: BY5PR20CA0002.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::15) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|PAXPR04MB8655:EE_
X-MS-Office365-Filtering-Correlation-Id: b6aa3968-6fb1-4441-0e8e-08dbd3e38bc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8zCVGeih/1XImRLE1hl3BcOTxLhQr7KRepfcuRX6ha/BJfmXPe6bw94yaVdNh/u58eVxmV4gO2G7rKDVqAMvxFpUKBj3eSgcoLeiEfUb9PHpDPX/IRpktinvigrtFPYRTtV2pNLnJ4DpIJm8jT/75kSVYyNg+G0uBU8SDYSx9pjaufZB3NDDimrQl0UE4sz5bahXtmzhUssUsK2KUuNqV+lgP4qb4EQJikJYuOqWf09CMo4tyEv9/eEZXX9KAlGi9faKO6je22yyUbMUCfQF9huuuliR/C+bvuUqc1xTgJa6t5nr1pGEyn0Qh1/uuNHFl5TnaXVjM5OGgadqH46Z5pxDHB6py35jhv+4QfTiowwJOGp9NCNhZXHWOKlnJO6Vsoyc0mXOH31DtIZeTH+IigJB0UlYdirJuPu+wXcMP6axN5DzHA8CvWfOfqo2X1cCGhCro5XfuQbbckm61zZf/WecHG8cGPPyZAP4CGhnxTOBZYQ5Yhh8xPCGKd7AWBg0ohTxfYUCOS7rD54Rm5yyAwOcxJMu0v0JRjWX5mDNBdRPVj56v1zy2dQWHQFJ6C68dRHx5jQ9tnDAy84qlCJgseWS1pP3jm6bz9/+16q6BoED0Y2vxAD3uBd6YyyuEMJW
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(39860400002)(366004)(396003)(376002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(478600001)(6506007)(6512007)(6666004)(86362001)(316002)(41300700001)(6916009)(2906002)(6486002)(5660300002)(52116002)(36756003)(8676002)(2616005)(1076003)(26005)(38100700002)(8936002)(4326008)(66946007)(38350700005)(83380400001)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFQxYnJHS1Y0T0c4Z3FyNklJeVptTUkrdU5QVVZIdmh5MEowbE4xdG9ZZGlR?=
 =?utf-8?B?Q2JOYmxLRkdIckZBbC9IWlJMQzVVaXFacUdsSjU0dTZzaHVzdGhmTlZoRFZ6?=
 =?utf-8?B?RkkwOS90Y01MRVk5ZjRHUHJyVUxyMnUwaEJ0NXhIRUlrUUNmR1IwQjBJdjZG?=
 =?utf-8?B?eC91M2xHd2JNT203eCtDUlFHQTgyUEFLM3ArcnhYd0JGWlY1Wk03Y3lpZnVB?=
 =?utf-8?B?a2VtWk5MdVkybVBsakJyN0E2Ykg1c25TWTFZeUwxRUJGa2ZOSTJZUExzWGw1?=
 =?utf-8?B?UTB1S2lGVkhGR0ZjNTZpR0creEpXTGFXbThubWVZZmRHb2Z4WFlXY3RobUhY?=
 =?utf-8?B?bEVKV09pSXpxbWNXQXVCWStldmFPZmVYSUNOQjRWY2F4TXFRNzMvSDVDbEdI?=
 =?utf-8?B?WWVTZGQzc3ViM0hiaDRCV25Ra25kSXFKc0hndGFTUHErRy93ZGNxa2ZYY3oz?=
 =?utf-8?B?VmM2ZDVsMWJCU0VLOEFMTWhnekh6UEVlTzBQVVl2MU5HNy9xWHVWYkxod3ND?=
 =?utf-8?B?dEpvQVhmSThsd0N6T0tPbXNWRGhUK21lZEVjOUlEQUErc3ZreU5ZWU1SZllX?=
 =?utf-8?B?STV4SXg0MGJiTE8rb01QYmM4Q1c1aTNMMlNZdzBRbFo4dDFHWUVSMDdab1ZC?=
 =?utf-8?B?bkRZYWUxMkkrbjlGSXBMN2lTMTZZdzY3dTJQTzlHYTk0eWQ3b0ZiVTVNd2ha?=
 =?utf-8?B?R0t1b1UwTHovWlVnSjlMQVdVVmJzOHlaVElyMHNLWEozQzlqSHdsREJnOGty?=
 =?utf-8?B?TmJCQkNKRGgvcTBkTVJ2SG85L3Q5bHRkaVF2emZvMmpLQjZVQnlxdnlmVFNN?=
 =?utf-8?B?QWZ1Z05TZTVmcHE2d3FvejIzSHpBQ0VKbjROT01rNmtSbzNOSSt1dmpDMUZX?=
 =?utf-8?B?SkZMUndaWksrTnFVbFUvUjBBQkpvendUV2RxbTRVMGVvNlVmQWtOa3E2T1l3?=
 =?utf-8?B?MDZxZncwQXk3dHNsOFJCUzBab1ZmRG9Od3M1NjdEVCtZQlJBODlhbGNFaHdG?=
 =?utf-8?B?ZC9adWJ2ZXFKYjhCZWl5TlFiUC9rQVJGQnJkM2tzZ1BwOXdhdmluUEwvTDZw?=
 =?utf-8?B?cWhpb2pOcUNwZGdGWkpOVEMwbmJiMmJTUmFFUllOQ0JmSTdKeGRmMHY5SG83?=
 =?utf-8?B?MC84eThLSERBeE03OGM3OUd4V1ovRzJUMDIvMTladExsVm1QTkRPZU8zY2ta?=
 =?utf-8?B?L1hpcmUxa3N0bTBKU1lDTjlvVE5KN0kxWEJBVjVlOW9JRHBadGNBQ2NRL1hk?=
 =?utf-8?B?MENaTzk2WHBzanU1VUFQQlZYeHRmUzFqVzIzM3d5TXpOY2hCZlVuRk84bWdp?=
 =?utf-8?B?VWxMRXlCZVk0YlhnZ1FVbjRhczNmZFpiNDNzMWFTR1Qrc1c3T2ltM0JlZ0JD?=
 =?utf-8?B?MFQ4aER3YVBUZlFFejlaZFdrOTlSaGE5cHM5STh0K2NnRGtxR3MyM0FCZGl1?=
 =?utf-8?B?VUlKbXhRczFzTnU0K01mOTNhN205QnRSV0VhZjE3WVZNU2tFSU96TWh4NGpm?=
 =?utf-8?B?elFGOWlFRUJCaDZ2Rjk4cWlKU1Y5WUFFd3FiRCtpaEF0QlZybm94OTRzaGdN?=
 =?utf-8?B?R3JYTkorRExRWnhmTUFsenNKTnBXK2xtVjRweDhPeGVyNGgvaXlSS1BXN1Fo?=
 =?utf-8?B?NDN0VkdIbG5MTlZQK0ZHOEhkWnVQL2l1d3graU1DR3Y0dlpwMDkxcHdobVNR?=
 =?utf-8?B?TSs3eXFkZ3NYN0Z3aG5CN281ME1GWjBJVXVxanRRRTY4elZwU3o2dHgwMXBV?=
 =?utf-8?B?QnF5WE1HU3JINkhwUXFsc3ByT2ZLQ3VhV0t5MnJpeVZIQmVMbTNIazYyWW02?=
 =?utf-8?B?RFNrOTFKWE0yNVVWcmhLZnp6dW1HWllFaVZHTGU3SUwyNndnWnBiYXpERjVt?=
 =?utf-8?B?K0UzMHVrVGV1bFdrTnVTejRwVXR4MTNOOHB2YnFHVjcwOG5yY0QrZ0NSV29O?=
 =?utf-8?B?M1g3eWtsUkJyYTl0bFZJMTNtcHhDNmZsYy9GUUw1Z3VuTzBIL1pMS2hyNy9L?=
 =?utf-8?B?Z3F4WVVaVVc5WUs1NTliK091NDBNZG1FUndOMllibGllcW1kOEY0dHlHbTZH?=
 =?utf-8?B?eHhObGtvV2graW1xcGxGM1BqMTh4N1ZRZitiUkNyMmFjNTAwdzJualdhTExh?=
 =?utf-8?Q?q5F6x5hc2oylmxOXC/lq8NzQ7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6aa3968-6fb1-4441-0e8e-08dbd3e38bc9
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 16:17:26.0587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fv2aAifx1F2hnB4a9mY7Ky225TgNnfdoQNvWE8DzyfWWSXdNQy2obMMT08ujlHnYmFcBAsyMQlKzPObKwtOM2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8655
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_091731_604882_A5C934C3 
X-CRM114-Status: GOOD (  10.80  )
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
YXhpbXVtIHN0YWxsIHBlcmlvZCBpcyAxMDAgzrxzLgoKVGhpcyBjYW4gYmUgY29uc2lkZXJlZCBh
cyBiZWluZyBqdXN0IGEgd2FybmluZyBhcyB0aGUgc3lzdGVtIElSUSBsYXRlbmN5CmNhbiBlYXNp
bHkgYmUgZ3JlYXRlciB0aGFuIDEwMHVzLgoKRml4ZXM6IGRkM2M1Mjg0NmQ1OSAoImkzYzogbWFz
dGVyOiBzdmM6IEFkZCBTaWx2YWNvIEkzQyBtYXN0ZXIgZHJpdmVyIikKQ2M6IHN0YWJsZUB2Z2Vy
Lmtlcm5lbC5vcmcKU2lnbmVkLW9mZi1ieTogRnJhbmsgTGkgPEZyYW5rLkxpQG54cC5jb20+Ci0t
LQoKTm90ZXM6CiAgICBDaGFuZ2UgZnJvbSB2MyB0byB2NAogICAgLSBmaXhlZCBtaXNzZWQgdXBk
YXRlIGNvbW1pdCBtZXNzYWdlCiAgICAgQWRkIGRldl9kYmcgZm9yIFRJTUVPVVQgY2FzZQogICAg
IFRoaXMgY2FuIGJlIGNvbnNpZGVyZWQgYXMgYmVpbmcganVzdCBhIHdhcm5pbmcgYXMgdGhlIHN5
c3RlbSBJUlEgbGF0ZW5jeQogICAgY2FuIGVhc2lseSBiZSBncmVhdGVyIHRoYW4gMTAwdXMuCiAg
ICAKICAgIENoYW5nZSBmcm9tIHYyIHRvIHYzCiAgICAtIHJlbW92ZSAxMGsgYXQgY29tbWl0IG1l
c3NhZ2UKICAgIAogICAgQ2hhbmdlIGZyb20gdjEgdG8gdjIKICAgIC1ub25lCiAgICAKICAgIENo
YW5nZSBmcm9tIHYxIHRvIHYyCiAgICAtbm9uZQogICAgCiAgICBDaGFuZ2UgZnJvbSB2MiB0byB2
MwogICAgLSByZW1vdmUgMTBrIGF0IGNvbW1pdCBtZXNzYWdlCiAgICAKICAgIENoYW5nZSBmcm9t
IHYxIHRvIHYyCiAgICAtbm9uZQogICAgCiAgICBDaGFuZ2UgZnJvbSB2MSB0byB2MgogICAgLW5v
bmUKCiBkcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYyB8IDkgKysrKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2Mv
bWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0
ZXIuYwppbmRleCAxYTU3ZmRlYmFhMjZkLi42YjZiZGQxNjNhZjRmIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYworKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIv
c3ZjLWkzYy1tYXN0ZXIuYwpAQCAtOTMsNiArOTMsNyBAQAogI2RlZmluZSBTVkNfSTNDX01JTlRN
QVNLRUQgICAweDA5OAogI2RlZmluZSBTVkNfSTNDX01FUlJXQVJOICAgICAweDA5QwogI2RlZmlu
ZSAgIFNWQ19JM0NfTUVSUldBUk5fTkFDSyBCSVQoMikKKyNkZWZpbmUgICBTVkNfSTNDX01FUlJX
QVJOX1RJTUVPVVQgQklUKDIwKQogI2RlZmluZSBTVkNfSTNDX01ETUFDVFJMICAgICAweDBBMAog
I2RlZmluZSBTVkNfSTNDX01EQVRBQ1RSTCAgICAweDBBQwogI2RlZmluZSAgIFNWQ19JM0NfTURB
VEFDVFJMX0ZMVVNIVEIgQklUKDApCkBAIC0yMjYsNiArMjI3LDE0IEBAIHN0YXRpYyBib29sIHN2
Y19pM2NfbWFzdGVyX2Vycm9yKHN0cnVjdCBzdmNfaTNjX21hc3RlciAqbWFzdGVyKQogCWlmIChT
VkNfSTNDX01TVEFUVVNfRVJSV0FSTihtc3RhdHVzKSkgewogCQltZXJyd2FybiA9IHJlYWRsKG1h
c3Rlci0+cmVncyArIFNWQ19JM0NfTUVSUldBUk4pOwogCQl3cml0ZWwobWVycndhcm4sIG1hc3Rl
ci0+cmVncyArIFNWQ19JM0NfTUVSUldBUk4pOworCisJCS8qIElnbm9yZSB0aW1lb3V0IGVycm9y
ICovCisJCWlmIChtZXJyd2FybiAmIFNWQ19JM0NfTUVSUldBUk5fVElNRU9VVCkgeworCQkJZGV2
X2RiZyhtYXN0ZXItPmRldiwgIldhcm5pbmcgY29uZGl0aW9uOiBNU1RBVFVTIDB4JTA4eCwgTUVS
UldBUk4gMHglMDh4XG4iLAorCQkJCW1zdGF0dXMsIG1lcnJ3YXJuKTsKKwkJCXJldHVybiBmYWxz
ZTsKKwkJfQorCiAJCWRldl9lcnIobWFzdGVyLT5kZXYsCiAJCQkiRXJyb3IgY29uZGl0aW9uOiBN
U1RBVFVTIDB4JTA4eCwgTUVSUldBUk4gMHglMDh4XG4iLAogCQkJbXN0YXR1cywgbWVycndhcm4p
OwotLSAKMi4zNC4xCgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1pM2MK
