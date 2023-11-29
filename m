Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50676C10DC1
	for <linux-i3c@archiver.kernel.org>; Wed, 29 Nov 2023 22:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zvmrYfWb6Jyzx5plF9p56RaSdTLBSS5cqyyLPh7MCJk=; b=nB5+gChk5BtMB/
	ATZUPbxYJ88Z7hof4GYyHinmnDKt4JoF+u2q8w6e5SnBhKzE3R6AoSqNa7iQ/06pJkgOg4fwMFIZc
	zb5IAsRg8bg3Q/8GtjPO4fcfp3Vh3WNg3gpF9mhjVIL6Dl5OyiXtekuLH7CdknjHvDWjlHUzZMyuX
	RNUSLc5GFwrMck++xE2+u+ylGy2xyKwp/kWJDOFwbLqjjlLfeTsB7oFS31Yibgb+RHVS89vrfTW1I
	Lf2iMNoLHpXW6J0VXxmwIP/x1QOKlthyj7oS04VN0x00fA5XJpsF7SF3yopXshY/f8xtJkY/LJyl+
	FFKLXVRAdl27P1fntC/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Sni-009Pay-06;
	Wed, 29 Nov 2023 22:12:58 +0000
Received: from mail-am0eur02on20621.outbound.protection.outlook.com ([2a01:111:f400:fe13::621] helo=EUR02-AM0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Sng-009PYC-03
	for linux-i3c@lists.infradead.org;
	Wed, 29 Nov 2023 22:12:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EDsQ2KcAuz0d8mg2XG882N4R69w2/0MdK1pXwB0+3F5g/OdIYJD4WqNZSiIo9RUACqgsSOM0q6O5/Mg1mt+fxI8n8Jhc+xqzLF2G3ObsyW5jOVwncvRaZcYb7uqz05PSx9nQgu9xR7T9gqsGBCH8FfO61ZgNSIiSlUuKRKMmqWCx+Rqd1xFsWNvzgiDLwceDwXXDEly6e7GDBLe12ssRc8KRg0dI4y14znO7ou3PRwjVOZT2Hw3p2iStn9vyj5sdLhC+zSDYRFGqI3eB2HGaRt/1YeityntyD3N1OildUV8wz9WbNnldkMNZdrIyuSzww6yvdcprW3UwAlSkv75Kvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++WWKqxHPtPOuShZ9C+n6tM8dcE6BdIrF96tSwG9XqE=;
 b=nf7a5rgOv+UPOHZTadyLE+anwpzul7VX5pgl7FvBAksfwGOIgg4C2ONXcEvrm63sJGgeqzd3/fgwk+P7IISgPo2mPMBXqAjY8Qi8lDD1up2b0N1JPQtP35CQvg3RwiaM0tjsnE6lXhPLrAqZ2gkUr9ZgzX7g/4pgNtgiCW6TXuq8e9E3fMwwbMPYvCNNAuzhkv8v0o5silQz8DkQmEc+3yF3clzGe3G4Z3LwRMFoFOEX/ztYs4aRQ+13jB8HEs7DkLPpqTso3S7D/REFu8tGWT6Ux/g9pw1EHRUJwYpl9POJV9n7UV/Rty2IF9HgPYx8KdlusiZ7VW4U/88UcpRshA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++WWKqxHPtPOuShZ9C+n6tM8dcE6BdIrF96tSwG9XqE=;
 b=OmtZJzw0E+IRJfBDs/uBI9vKMDzYcCMcwdOdyw9UA25l1FxYNAD1tcoiKngu8SVepfALNU6DIa3ALik8yHfhQE1zbK9iaR9Ejy5ez0zrRUL+ns8G+FfMRiHqe0AgpMYi416bFi/buVI52B51hwyfve70zWf4iSqfhgBCmgrUWv4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by DB9PR04MB9578.eurprd04.prod.outlook.com (2603:10a6:10:305::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.21; Wed, 29 Nov
 2023 22:12:52 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::95f5:5118:258f:ee40]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::95f5:5118:258f:ee40%6]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 22:12:52 +0000
From: Frank Li <Frank.Li@nxp.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.li@nxp.com,
	conor.culhane@silvaco.com,
	imx@lists.linux.dev,
	joe@perches.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	miquel.raynal@bootlin.com,
	zbigniew.lukwinski@linux.intel.com
Subject: [PATCH v4 3/6] i3c: add actual_len in i3c_priv_xfer
Date: Wed, 29 Nov 2023 17:12:22 -0500
Message-Id: <20231129221225.387952-4-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231129221225.387952-1-Frank.Li@nxp.com>
References: <20231129221225.387952-1-Frank.Li@nxp.com>
X-ClientProxiedBy: BYAPR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:a03:40::16) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|DB9PR04MB9578:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b0a95dc-92c5-4ba6-89fc-08dbf128545a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LU9ldm+8pEXiKI5yIpulC0Za5ZMpklP4GoQ0jnVdV4KmKgBco9ckwHKqCI843WF7e3Ptvn/aH5PvsfGQbQCrPmv0yz4hoT/5SUZgy7nvqH8bombV3map6TQ4JGR70w+QSAcdeY4gmq1RAqxcymJtMMSz4hFCnpH1TUGsJ9PdKYA/2O3K01qUOYyRg5UT8B22SJe6f/QpnHkOIQWZ3Gcect0/BLGn+vS4t+ZLIWbeUWwXDzxxqQLbXwyMCLPk77kqd972R4mMhd7Oe+E3a5cLhYfboHDSVnw8qJ5xEt+rZiBX9Aj2aQ1Owi8PhUrKXBX3kYBd25RpaJdOhjBOT/k+TOMbViWYKul40fh8jDiDUz/Jn0DsfEj59hMt/yKPuqyr4Fg9H9dmybq7yZpuMhilmeGr2s0gAJwIZN2IcWk5gj6jawg0lFG/P1mue6+RsyWzuIiLEpz3A0IubCx7zeckRsOH+Mb9gk3qeI6KJOT2t91nH8TzFYJZBUPnNLAZsXVMstf8UgqCwP/LxiqQp1jav1eDdUW83uMED38f5eVso/go17TuacEaG0MSGaFEIS8NcOfxGHZSyk2Zs/u3M0vbt+uDQL8jrh/UzzFcYSsI3Nwy0GQ/rWBZJO95CPQyXOHzWoQyApQini0gPpQuAMxyow2fzn/oiuHvTvOMky39eyg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(202311291699003)(38350700005)(36756003)(2906002)(41300700001)(5660300002)(86362001)(6666004)(6512007)(52116002)(2616005)(1076003)(38100700002)(6506007)(26005)(316002)(66476007)(478600001)(6486002)(8936002)(66946007)(8676002)(66556008)(4326008)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VE1NRTJSeVFmcmhrUi9heUJUcUpGeWZGQkU5b3M4aEdSMlZuVDZIcXNGcFFY?=
 =?utf-8?B?T1ZlRFMzM3Z4cm1zeGZSYzhDVkhaR1o5Mm5HcGk5UmI3RXZxZVJ3WnJoSzhr?=
 =?utf-8?B?Wm5rRW5YR3pjNGFQREFhbm14TW5TMTUxU2ovdVc0UmpYYzJWM1FXL2F3Mjgv?=
 =?utf-8?B?ZHRseUN2dVhZbjEvVTF6SnJXeE5YYW1MM0pZalFaMmJNcEo0U1FNOVhaVEhZ?=
 =?utf-8?B?ampqOWpsR2xxRkYwbFF3ZTdRRG5kTXF5K09pN0VVY3YvK2FFdGNFSTE4d2li?=
 =?utf-8?B?YmdHZnRiZ0NvOEFqeGl2aFNCVWRGK0lDY05FeTFxM0VUS0MydlVKcVJKT1Jw?=
 =?utf-8?B?RjVieGNzd3VhbThsMUJDNE5jS1ExM0NkRmFpUG93YUhEeXVuZERGRGhXQ3c5?=
 =?utf-8?B?YU55ckthUElJRnNINmdhUmQrV0ZtRi9QUHpmc3ltcDdoemJCVHQwSU9qRmo0?=
 =?utf-8?B?SE9MbUpuRThaVkh4andHNkROS2laMWZQdU5JZDV6RVgwSHdLUkpzMGtwSHhk?=
 =?utf-8?B?SThDTEE3U0FBeW8rRjBDTVVDNG1qMG91cVNGQ21VZXNxd013UGp6dXQ4SEIz?=
 =?utf-8?B?UjM0aSt1bk94ZWdoTzhkVmxPTHFwU1hwTVZnV1RxL0NjR1B2K1I0U2p1ajVE?=
 =?utf-8?B?QmlUMGNUK3luZFpLbW0vWFdmVkhiM2o4aG5vTGxHMUxyaDJiWFpmQXY4N1dF?=
 =?utf-8?B?UWwzTmt6OTRJcHdrQzZpQUZSMnA1NldVVERORmU4blBFR2xjeTV2MmIyRUNw?=
 =?utf-8?B?L0pYUWZ2Nk0rdzZ4b0ZDNkVpRG9MVDd4ZHdIUjhvVm0zSStwVjhWR3BpQSs5?=
 =?utf-8?B?RHBxWWwxQU9mMUlnUWtjd1pDU1lhYTJFS0dJK0tFNDd6eGxRYmZ4bEo4a0Ro?=
 =?utf-8?B?Z3Zlc3h6My9mWnhtelh1R2d4MStWVE0zMm5VSTdjdENsNFBqellVb1FKeExR?=
 =?utf-8?B?cCtlanZreS84RFlveFZ3a2NiMWNDOHlyelJVa2VoN3RmeDZMUkNmTmpiOFpF?=
 =?utf-8?B?QWNqWE1wU2gxWGFUR3puaTZUWTlJdll0K0psd2tvTTRhQ241UE44Rk5xTHMz?=
 =?utf-8?B?bDFtd0hGcmgrZjBkaGFmeGVTSmdtMXNORi9rcUp6N1M5R3BSb2llWXhFRWdx?=
 =?utf-8?B?Y3lQOTFQcXpvMzl4aE9PR1BabytNTnorOW9nVGFJUG1XcXZrakV3S0t2Qmlr?=
 =?utf-8?B?cVBxdXIrU3JXUEdHN2pRc3ZWSlF4aWhodm5yMUx4OXdlaWNvd0ZsSUR3dDU1?=
 =?utf-8?B?Qmh6aVVmUnl4cUhwQkQrNlUwcXd1Nm1XNkcxSElCMGR0Z05QUloxNlQzTGt6?=
 =?utf-8?B?S0ZFbmdvYThKSFA5NDVIQkxhbXd1UFVUcGg2Zk1hZUtvNld5QVFhN1dQMDJh?=
 =?utf-8?B?SHFzbVZ5NUhxdVBNTDNadGEvaHRFelVFdXBhU2phOXdsUGtwM1NUanVUYzRl?=
 =?utf-8?B?Rlg0ZHN3NFlLUlJwNmEwOHIvTlRuZVZMTW8wckFSbTVRS3RCLzYwTUVlMTB1?=
 =?utf-8?B?WWRQQzBVVCtHUGJXS1VjZFZNWW1YTmhTLzdVNUE1cU1lVWQ0NGxTbmwvblA4?=
 =?utf-8?B?cmxnWGZXazZJU1crMUZQT1RuWlRxdXh1UTE2b053RWhBdlVLZjdLcGdTQ2Fl?=
 =?utf-8?B?QjNOVEM1dHU3MUo3azVWcTZkT0xtL0dBV0M4TGhjdEQrWFM5TVN2RGE4ZTZC?=
 =?utf-8?B?T0FnZnE0b1pCR00wWnhCZVkzTTk0Z2RROGJ6aHU5ZGk2M1hnSDlSQUxiZ3lQ?=
 =?utf-8?B?V3hrUW9odDlWV0pBZ3RyTXpZbjI3ZThJUWp0SnFtcDdXbUx6SDM3bVVsUldE?=
 =?utf-8?B?MFBsNGZlYmRNdHVxOHI1eWFCN25Kc1p4N2dUNVFHOUtnQ0RRMzVBNWRDR1NY?=
 =?utf-8?B?RzdYUEM2bUJTcDBPcGZWL1BVQVI4MHNwM2VhRDFiWkZKeTdxaWRYTlB1T0U4?=
 =?utf-8?B?OTZtbmROOUVvU2JsTFBkLzRIcUlEMVNDYzRyQUhPcXljNGdoT2xBMUhhczZ0?=
 =?utf-8?B?VjRsOUpDRGg5cHlDMWRyNzZ3RDh2bWIycytiTCtYZzJBMm43VEJ6TzRRTjJ0?=
 =?utf-8?B?dkFuMTBYdE0xVE52WFhDRDBIZGw5SFh3YXl2YnVUZGRjRFlwYUd6R29CRktE?=
 =?utf-8?Q?cyZ3QNSwZclYMYdO5xRSq97gC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b0a95dc-92c5-4ba6-89fc-08dbf128545a
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 22:12:52.0818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GqW7yc0q+PBmiRvVU9wojR9eEHastHvAeMhzhrSM4YuvLvhV5ROZUhkpXIA1IZ6M2QCPNYoMhWY5IAi68aHvAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9578
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_141256_056506_A6C7D898 
X-CRM114-Status: GOOD (  10.38  )
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

SW4gTUlQSSBJM0MgU3BlY2lmaWNhdGlvbjoKCiJOaW50aCBCaXQgb2YgU0RSIFRhcmdldCBSZXR1
cm5lZCAoUmVhZCkgRGF0YSBhcyBFbmQtb2YtRGF0YTogSW4gSTJDLCB0aGUKbmludGggRGF0YSBi
aXQgZnJvbSBUYXJnZXQgdG8gQ29udHJvbGxlciBpcyBhbiBBQ0sgYnkgdGhlIENvbnRyb2xsZXIu
IEJ5CmNvbnRyYXN0LCBpbiBJM0MgdGhpcyBiaXQgYWxsb3dzIHRoZSBUYXJnZXQgdG8gZW5kIGEg
UmVhZCwgYW5kIGFsbG93cyB0aGUKQ29udHJvbGxlciB0byBBYm9ydCBhIFJlYWQuIEluIFNEUiB0
ZXJtcywgdGhlIG5pbnRoIGJpdCBvZiBSZWFkIGRhdGEgaXMKcmVmZXJyZWQgdG8gYXMgdGhlIFQt
Qml0IChmb3Ig4oCYVHJhbnNpdGlvbuKAmSkiCgpJM0MgYWxsb3cgZGV2aWNlcyBlYXJseSB0ZXJt
aW5hdGUgZGF0YSB0cmFuc2Zlci4gU28gbmVlZCAiYWN0dWFsX2xlbiIgZmllbGQKdG8gaW5kaWNh
dGUgaG93IG11Y2ggZ2V0IGJ5IGkzY19wcml2X3hmZXIuCgpTaWduZWQtb2ZmLWJ5OiBGcmFuayBM
aSA8RnJhbmsuTGlAbnhwLmNvbT4KLS0tCiBpbmNsdWRlL2xpbnV4L2kzYy9kZXZpY2UuaCB8IDIg
KysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9pbmNsdWRl
L2xpbnV4L2kzYy9kZXZpY2UuaCBiL2luY2x1ZGUvbGludXgvaTNjL2RldmljZS5oCmluZGV4IDkw
ZmE4MzQ2NGYwMDMuLmVmNjIxN2RhODI1M2IgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvaTNj
L2RldmljZS5oCisrKyBiL2luY2x1ZGUvbGludXgvaTNjL2RldmljZS5oCkBAIC01NCw2ICs1NCw3
IEBAIGVudW0gaTNjX2hkcl9tb2RlIHsKICAqIHN0cnVjdCBpM2NfcHJpdl94ZmVyIC0gSTNDIFNE
UiBwcml2YXRlIHRyYW5zZmVyCiAgKiBAcm53OiBlbmNvZGVzIHRoZSB0cmFuc2ZlciBkaXJlY3Rp
b24uIHRydWUgZm9yIGEgcmVhZCwgZmFsc2UgZm9yIGEgd3JpdGUKICAqIEBsZW46IHRyYW5zZmVy
IGxlbmd0aCBpbiBieXRlcyBvZiB0aGUgdHJhbnNmZXIKKyAqIEBhY3R1YWxfbGVuOiBhY3R1YWwg
bGVuZ3RoIGluIGJ5dGVzIGFyZSB0cmFuc2ZlcnJlZCBieSB0aGUgY29udHJvbGxlcgogICogQGRh
dGE6IGlucHV0L291dHB1dCBidWZmZXIKICAqIEBkYXRhLmluOiBpbnB1dCBidWZmZXIuIE11c3Qg
cG9pbnQgdG8gYSBETUEtYWJsZSBidWZmZXIKICAqIEBkYXRhLm91dDogb3V0cHV0IGJ1ZmZlci4g
TXVzdCBwb2ludCB0byBhIERNQS1hYmxlIGJ1ZmZlcgpAQCAtNjIsNiArNjMsNyBAQCBlbnVtIGkz
Y19oZHJfbW9kZSB7CiBzdHJ1Y3QgaTNjX3ByaXZfeGZlciB7CiAJdTggcm53OwogCXUxNiBsZW47
CisJdTE2IGFjdHVhbF9sZW47CiAJdW5pb24gewogCQl2b2lkICppbjsKIAkJY29uc3Qgdm9pZCAq
b3V0OwotLSAKMi4zNC4xCgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1pM2MK
