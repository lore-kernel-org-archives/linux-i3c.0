Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0FAC001DF
	for <linux-i3c@archiver.kernel.org>; Thu, 19 Oct 2023 22:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i/03raLpHkFpBZHbL3x7/mxMwSA0r+c2IOm5t1zdeoI=; b=VuyOh62o2Ihorz
	L1cHMq8ed26ZGSeZF3ASBhBnfBI3Ubrf+W7Pb3sBOEPubyAQWfYT+rKM5V9lDa+r7/aFZYFfFbQnm
	JBamfnK0QRUtf7WbdqxpCHo+JtI0X/q15L8N0oIBAbunapUGfZGuL61+E3x6My5txVGsYrmpWsZ/S
	wH0LaGrccI95wF+3GLtE478ibeTwWYkmME9LBUw0lg+F4ddj8wEs05k9yZX+NbpoRP606oQB4zCes
	teqOwMJlv3gj3Xw3nTRX5/LdFBpVbnup/yts67cGOhtR2KU52VPe0p0yL1qS+apWM1dzHSede9s3L
	X6kO9b7/ObyLMtX8dlCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtbUk-000o3D-0R;
	Thu, 19 Oct 2023 22:27:58 +0000
Received: from mail-am6eur05on20611.outbound.protection.outlook.com ([2a01:111:f400:7e1b::611] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtbUh-000o1V-2h
	for linux-i3c@lists.infradead.org;
	Thu, 19 Oct 2023 22:27:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lv4cDGShXeR/1JmdmgHJ4dEt2oaDEIGFOfPICkkgr2HiiW2jswV25ppOZ4+9ReqfGmJYH4Y0SyXrfecOLWXqJbXnKLbV4qVu+CLfgS5HZWc1NmAki5dyO5AnBIOTr/qTj0t6AV8jCOfFZ3jpq8i6kSBYAvnqBIsZp6i03NUtyv20178b7l4IYA/wsl1ElhOMA5YDlwhKX1SmBzBMRLIJs5xsxijhxabLHlyrTzRatbVqZkSQhuiMFoPMZi7tMK1LBSHwXOAp03nadExsVU+UJEBJbC8CbftNfaekoxCeR20JwiKCUflgQB01rNgitA6C5/OQHGQbDca1y+l/tyNg0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nayoLnZA6AxlXnKCCet/C/KGKXlH5vBlf4Xff954ehM=;
 b=iz6226LEgDWXs93yzs8TRrEvKZ1ZQv900LHlhjGL3vSmtEI5MqcR4O0fQUjL6OdOf0E5JsP7TmtyiWOYYURsT9Wry4gckc2iGcp5NiY7W1keBE/QKigLQAesfBSSm3L5eRzuVRExL+gQNqYUVJ8GxHfpf7EHthEqYddoI3iqhCohOO1IfGsteA5sz5LzF+RnHdU4SCCJ64k6aMmolkPhzxTKNut3XpUpOlaK0/zHwXUPBGlinNExx1H21mdKiD3fYLyRTYuv3OiHbV9gIQ4AOoyCS70hSs4A3pXPwojqxBIeSUSB9zQRDtxhMWCUykyvll+u4+8Ka8Mm5+KcTD43sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nayoLnZA6AxlXnKCCet/C/KGKXlH5vBlf4Xff954ehM=;
 b=Qron0qZvzh9R9lQ10mbL+NcL3ASOLaXPFXhCutOdPb6Yi5743Jbtwab82SgotNmL5IzjauCxs87mZmSR719v0LWAWsl7BjlPn4rFtKXhybwZvgHb6+f1i6Yk3D7XonKLgK/vm3e+Ou7h7GSpDddKSpcQhRMw2QMZecNkY1vGSU4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by DBBPR04MB7708.eurprd04.prod.outlook.com (2603:10a6:10:20d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.10; Thu, 19 Oct
 2023 22:27:46 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2%4]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 22:27:46 +0000
From: Frank Li <Frank.Li@nxp.com>
To: miquel.raynal@bootlin.com
Cc: Frank.Li@nxp.com,
	alexandre.belloni@bootlin.com,
	conor.culhane@silvaco.com,
	imx@lists.linux.dev,
	joe@perches.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/6] i3c: master: svc: fix wrong data return when IBI happen during start frame
Date: Thu, 19 Oct 2023 18:27:21 -0400
Message-Id: <20231019222725.3598022-3-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231019222725.3598022-1-Frank.Li@nxp.com>
References: <20231019222725.3598022-1-Frank.Li@nxp.com>
X-ClientProxiedBy: PH7PR17CA0042.namprd17.prod.outlook.com
 (2603:10b6:510:323::21) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|DBBPR04MB7708:EE_
X-MS-Office365-Filtering-Correlation-Id: e3b0df36-cc2d-477f-8eca-08dbd0f29ea5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /rHP0is51NSlclkO3cW50Eri7HQoNqkzrrZJEKFKRrtuocnt9IAFlaLzerTFFAV/al+vs9PNyFKIhILf7DIYBhPbgyMlLKeGbXzmajNF88DJXkjyYR9riej1tQqPfnt2kcPYmX7hg7wOqrk2G10iEF7IjfFJ9yI8z7KptK8F9w6aoj1bMyu3mE8D/v5R/XACkpjqnhO2Al9JyPWr8DeSwEVSNpTIhsrMujddeXMlx7gPdaPKi0OlK7tbRMfYSuOCEwCwmo1sCiShKva5UEzlTySeVWV0G2IdxasjFIOWaRUWdVHnFkHh3f6NvlLZhEVys9EBQKizMulXzKbVQwL1TqRGH3/BFfFOMWQbQ79n9vZ6TwbTLKj9vZBmUjUdSti1CMecQY4xQz0VJlpYb8XyKtYtFBfF86Yk8Q409LcGgj3p/lLZ9XZ0eep1/J1rOMv1POntr8fWTNE4fYB3d71lEiWdDpGMUuukDNdzTM/DAygZDJZJBZbWGklxSHxmZXi5p65AqJuAbny/f2uXQi6NZPXblGlKFvvOZwamTjDnAQPVeDQd2O8hYqEnOwu1qHuK1AQt6MuulawyYIvxDfOxd6g8CbICnJ8e9Ft+aFDIOMF33EydA//57oFxFKl610YoyO49gXiaZC7lYuGmz8iWIjzDGZWutQmvXIMj8Vwkv80=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(366004)(346002)(39860400002)(376002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(6506007)(83380400001)(6512007)(38100700002)(478600001)(36756003)(66476007)(66556008)(66946007)(316002)(6916009)(86362001)(6486002)(52116002)(2616005)(1076003)(26005)(6666004)(5660300002)(2906002)(41300700001)(8676002)(8936002)(4326008)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnV5QWVQWTRiUk9KRUlYbVhKSTk1VGpXUzhqcU5XL0JmOTV4M0g4dmR6L2tX?=
 =?utf-8?B?MEJ0M1llMStITlpBZGtGRzVQaUZVS1owMUpySURMRWxVV1M4TWxSQ1FlMEVy?=
 =?utf-8?B?VVVGVFNWY0FrZWxoSmJVemREdlZRM1hrVks2VVdDSC9TZVVPekQxREgvOGpS?=
 =?utf-8?B?STZYTUFuRUdoMkpPTXZ5czh2YjFxUjEyN0g1ajUwejFYdUJSTmpJK20vTmJx?=
 =?utf-8?B?MDkvcmRhSWdpL0t5ZFQ3a2JOZE1ad3JSTkpDaGp6amtvSzNNd0ozaW5NQ3B5?=
 =?utf-8?B?K2o1ckVvMlFFMDM2WWhncCsyWlJ5YmMvdGZva2F0azlhckJoUExmTnZ6V0ZK?=
 =?utf-8?B?TDFRTk5Lc1NTcHU5K0lDdkhuY3cyVmEzb2JqVWluZzJub2VuRklURE9CODdS?=
 =?utf-8?B?NFFJQzdhY1kzcWpPbXNSdGljR2JpcE1SYnIvTlAwNkM4OE1NQ09jL0NQOW9Q?=
 =?utf-8?B?UlZwcnZsdGJtdFdBNnRRWmVLUmNza0FrWStiKzdtVkNtS2RiQld5cndVSVZy?=
 =?utf-8?B?UGIwRmJtaGgvcUJzUTRyN00rK3E4VERVVkRNVG5xQ2F1d2tOWm9ldU5nOVlu?=
 =?utf-8?B?S1d0RFdNUlNZVWpmZGVYVkdEM011dVlOd29rbHltTXBVTEdVZ1lkbUk5ZkUv?=
 =?utf-8?B?TXdkRnpSVzh1MHhCZVhCWEVVbENzK0R2NkYyWkx6RWZNYTdHbGM4QzNiUlAx?=
 =?utf-8?B?L2pJRG1WcDZ3UVIzblMwMnZiK0FVR0drRlVPM2IxN3B3aWlMcXdSS2hGTmda?=
 =?utf-8?B?TkViTW9KU3lHeWtZNE5SZlNBaHJ6Umxld3hjT0xpWXZhaVExcHE1b01jVlB3?=
 =?utf-8?B?Y3dIREhBV2dwVktpaWZtMnRLcUMxUm92NlB2QUNQT245dHdoRXB3ZVZzaTVR?=
 =?utf-8?B?KzhTT3R4TE1Jcy9IRGxiK0N6eWt0c004eStJUHlsTkhoMS9OZDQxLzBJVDUw?=
 =?utf-8?B?b05UUXlSWnBiUW4vZ3lBYTlVeTVWVW4zdEhNanZ6cXZrK0JIU0Z2RkRZWkJY?=
 =?utf-8?B?QW03SUpkeUx6dC9STlhaUUNJOXM1dGFEQVlHQm5YQmtxa3lPSmJPRVFObWNG?=
 =?utf-8?B?UUdQSERjYXNNTmozVjJRWFg3Y3U2cVAwZmxhM1VOK0dPbkR0OTZ4SDcvcU8x?=
 =?utf-8?B?UzgrWkFlYzZET1I2NXBTaXMvN0QxQnl5Um1Za3BMR0pZOE9NY0tQMVc5eElo?=
 =?utf-8?B?M0hBWGNGaXFUVEI5UGtaWEpjOW1WdHdZa29BZXE5ZklSbDJGMEtvOUFpNHI5?=
 =?utf-8?B?UGVuTjNOWHNJa2ZIUXkvWkFEbmFzQ1psN0F5dUcwUlJUbkhSeGNNZjd2cVY4?=
 =?utf-8?B?dXhsc0RQS3UwY0FIQURNbHlaKy9NeUtBSytJSzk0TisvQ0xYZ0Vscm9hUjNs?=
 =?utf-8?B?YlIzSUl3cjZkclN2THhDR1FjLzlOc09maU9ZbVJuaTZ6WVphbVJ3b0RrUXhJ?=
 =?utf-8?B?alQ3U3ptY0lpeUtTUUl2NjhScURDNEx4d25USThpZ2N0NVFOZVd0Njl5T0kv?=
 =?utf-8?B?YzlqSitOWWNYMktsMFFaWCtoR0NHWGJldVBFNHJzeTlGdVIwOTY1bWVMMEFX?=
 =?utf-8?B?M1RETncrTHVwYWoySTJBczZsMnF5VVJqbXhDWTlITnFhcWMrSmdJaWRtRXZ3?=
 =?utf-8?B?NmlJR0t5cUEzL1BYbkhINmEvb1BXNVEweVhEWlJ0M3NVTUloZm1DaDJYeTk4?=
 =?utf-8?B?OGdxZTZUbzJOYUVyajdNMDViS2NxTGdjTUc4alIxSVovQTllSTVyRXIyUFhy?=
 =?utf-8?B?b0E2bW5abm5YdDlFeGpUNmJvSWw1QzdvcCs1bElFQWRxczdXRzFyWWtHSDh4?=
 =?utf-8?B?YWpYbGxIZHo5Tnl6RVkyZzc4V2VUZ2o5K2Z6c29mU210UzVZRTJUVjArTVNv?=
 =?utf-8?B?UzVEQWlnV2k0d0VXS3NIZVJnVGZtSzd6bFA5ZmFCRnRkU3BMOFNUSXRiWlY1?=
 =?utf-8?B?OGFKWDNCbHFIcDVYYXM4OWNubEYzSnJadXAzNVVxY0xLaDFCbzlycGVqRU11?=
 =?utf-8?B?MWJseERUWjJZZ3lDemcvWlhKMXhCSjZIR0tpMGlqZ3JKSjY5YStkdk9Gcitm?=
 =?utf-8?B?OVkrYjQrd01ZZExZNlVISEtPclRkTkQveS9LQVcxeC9DQk1MWTFSZVRtUE9Y?=
 =?utf-8?Q?wu8k=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3b0df36-cc2d-477f-8eca-08dbd0f29ea5
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 22:27:46.6967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UjWOuI190NzS7D4LU06fTE+PcM4B2/M2KE1OyCW32WX+PrrxRmTAWWf65gJJeTK8T0vROiMQ2PRVDkh4cTEw5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7708
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_152755_883439_416DF850 
X-CRM114-Status: GOOD (  12.61  )
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

ICAgICDilIzilIDilIDilIDilIDilIDilJAgICAgIOKUj+KUgOKUgOKUkCAg4pSP4pSA4pSA4pSQ
ICDilI/ilIDilIDilJAgIOKUj+KUgOKUgOKUkCAg4pSP4pSA4pSA4pSQICDilI/ilIDilIDilJAg
IOKUj+KUgOKUgOKUkCAg4pSP4pSA4pSA4pSQICDilIzilIDilIDilIDilIDilIAKU0NMOiDilJgg
ICAgIOKUlOKUgOKUgOKUgOKUgOKUgOKUmyAg4pSU4pSA4pSA4pSbICDilJTilIDilIDilJsgIOKU
lOKUgOKUgOKUmyAg4pSU4pSA4pSA4pSbICDilJTilIDilIDilJsgIOKUlOKUgOKUgOKUmyAg4pSU
4pSA4pSA4pSbICDilJTilIDilIDilJgKICAgICDilIDilIDilIDilJAgICAgICAgICAgICAgICAg
ICAgICAgIOKUjOKUgOKUgOKUgOKUgOKUgOKUkCAgICAg4pSM4pSA4pSA4pSA4pSA4pSA4pSQICAg
ICDilIzilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilJAKU0RBOiAgICDilJTilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilJggICAgIOKUlOKUgOKUgOKUgOKUgOKUgOKUmCAgICAg4pSU4pSA4pSA4pSA4pSA
4pSA4pSYICAgICAgICAgICDilJTilIDilIDilIDilIDilIAKICAgICB4eHjilbEgICAg4pWy4pWx
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIOKVsuKVsSAgICDilbLilbEg
ICAg4pWy4pWxICAgIOKVsgogICA6IHh4eOKVsklCSSDilbHilbIgICAgICAgICAgICAgICBBZGRy
KDB4MGEpICAgICAgICAgICAgICAg4pWx4pWyIFJXIOKVseKVsk5BQ0vilbHilbIgUyAg4pWxCgpJ
ZiBhbiBJbi1CYW5kIEludGVycnVwdCAoSUJJKSBvY2N1cnMgYW5kIElCSSB3b3JrIHRocmVhZCBp
cyBub3QgaW1tZWRpYXRlbHkKc2NoZWR1bGVkLCBXaGVuIHN2Y19pM2NfbWFzdGVyX3ByaXZfeGZl
cnMoKSBpbml0aWF0ZXMgdGhlIEkzQyB0cmFuc2ZlciBhbmQKYXR0ZW1wdHMgdG8gc2VuZCBhZGRy
ZXNzIDB4N2UsIHRoZSB0YXJnZXQgaW50ZXJwcmV0cyBpdCBhcyBhbgpJQkkgaGFuZGxlciBhbmQg
cmV0dXJucyB0aGUgdGFyZ2V0IGFkZHJlc3MgMHgwYS4KCkhvd2V2ZXIsIHN2Y19pM2NfbWFzdGVy
X3ByaXZfeGZlcnMoKSBkb2VzIG5vdCBoYW5kbGUgdGhpcyBjYXNlIGFuZCBwcm9jZWVkcwp3aXRo
IG90aGVyIHRyYW5zZmVycywgcmVzdWx0aW5nIGluIGluY29ycmVjdCBkYXRhIGJlaW5nIHJldHVy
bmVkLgoKQWRkIElCSVdPTiBjaGVjayBpbiBzdmNfaTNjX21hc3Rlcl94ZmVyKCkuIEluIGNhc2Ug
dGhpcyBzaXR1YXRpb24gb2NjdXJzLApyZXR1cm4gYSBmYWlsdXJlIHRvIHRoZSBkcml2ZXIuCgpG
aXhlczogZGQzYzUyODQ2ZDU5ICgiaTNjOiBtYXN0ZXI6IHN2YzogQWRkIFNpbHZhY28gSTNDIG1h
c3RlciBkcml2ZXIiKQpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwpSZXZpZXdlZC1ieTogTWlx
dWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KU2lnbmVkLW9mZi1ieTogRnJh
bmsgTGkgPEZyYW5rLkxpQG54cC5jb20+Ci0tLQoKTm90ZXM6CiAgICBDaGFuZ2UgZnJvbSB2MSB0
byB2MgogICAgLSB1cGRhdGUgY29tbWl0IG1lc3NhZ2UKICAgIC0gZml4IHR5cG8geWVpbGQgYW5k
IGZhbHVyZQoKIGRyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jIHwgMjAgKysrKysr
KysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9t
YXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYwppbmRleCA4Y2Q3MDhjOTY1MDg1Li5hYmViZWY2NjZiMmJi
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYworKysgYi9k
cml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYwpAQCAtMTAxMCw2ICsxMDEwLDkgQEAg
c3RhdGljIGludCBzdmNfaTNjX21hc3Rlcl94ZmVyKHN0cnVjdCBzdmNfaTNjX21hc3RlciAqbWFz
dGVyLAogCXUzMiByZWc7CiAJaW50IHJldDsKIAorCS8qIGNsZWFuIFNWQ19JM0NfTUlOVF9JQklX
T04gdzFjIGJpdHMgKi8KKwl3cml0ZWwoU1ZDX0kzQ19NSU5UX0lCSVdPTiwgbWFzdGVyLT5yZWdz
ICsgU1ZDX0kzQ19NU1RBVFVTKTsKKwogCXdyaXRlbChTVkNfSTNDX01DVFJMX1JFUVVFU1RfU1RB
UlRfQUREUiB8CiAJICAgICAgIHhmZXJfdHlwZSB8CiAJICAgICAgIFNWQ19JM0NfTUNUUkxfSUJJ
UkVTUF9OQUNLIHwKQEAgLTEwMjgsNiArMTAzMSwyMyBAQCBzdGF0aWMgaW50IHN2Y19pM2NfbWFz
dGVyX3hmZXIoc3RydWN0IHN2Y19pM2NfbWFzdGVyICptYXN0ZXIsCiAJCWdvdG8gZW1pdF9zdG9w
OwogCX0KIAorCS8qCisJICogQWNjb3JkaW5nIHRvIEkzQyBzcGVjIHZlciAxLjEuMSwgNS4xLjIu
Mi4zIENvbnNlcXVlbmNlIG9mIENvbnRyb2xsZXIgU3RhcnRpbmcgYSBGcmFtZQorCSAqIHdpdGgg
STNDIFRhcmdldCBBZGRyZXNzLgorCSAqCisJICogVGhlIEkzQyBDb250cm9sbGVyIG5vcm1hbGx5
IHNob3VsZCBzdGFydCBhIEZyYW1lLCB0aGUgQWRkcmVzcyBtYXkgYmUgYXJiaXRyYXRlZCwgYW5k
IHNvCisJICogdGhlIENvbnRyb2xsZXIgc2hhbGwgbW9uaXRvciB0byBzZWUgd2hldGhlciBhbiBJ
bi1CYW5kIEludGVycnVwdCByZXF1ZXN0LCBhIENvbnRyb2xsZXIKKwkgKiBSb2xlIFJlcXVlc3Qg
KGkuZS4sIFNlY29uZGFyeSBDb250cm9sbGVyIHJlcXVlc3RzIHRvIGJlY29tZSB0aGUgQWN0aXZl
IENvbnRyb2xsZXIpLCBvcgorCSAqIGEgSG90LUpvaW4gUmVxdWVzdCBoYXMgYmVlbiBtYWRlLgor
CSAqCisJICogSWYgbWlzc2VkIElCSVdPTiBjaGVjaywgdGhlIHdyb25nIGRhdGEgd2lsbCBiZSBy
ZXR1cm4uIFdoZW4gSUJJV09OIGhhcHBlbiwgcmV0dXJuIGZhaWx1cmUKKwkgKiBhbmQgeWllbGQg
dGhlIGFib3ZlIGV2ZW50cyBoYW5kbGVyLgorCSAqLworCWlmIChTVkNfSTNDX01TVEFUVVNfSUJJ
V09OKHJlZykpIHsKKwkJcmV0ID0gLUVOWElPOworCQlnb3RvIGVtaXRfc3RvcDsKKwl9CisKIAlp
ZiAocm53KQogCQlyZXQgPSBzdmNfaTNjX21hc3Rlcl9yZWFkKG1hc3RlciwgaW4sIHhmZXJfbGVu
KTsKIAllbHNlCi0tIAoyLjM0LjEKCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1p
M2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWkzYwo=
