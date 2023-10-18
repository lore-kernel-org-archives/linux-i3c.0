Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 533F7CDB47E
	for <linux-i3c@archiver.kernel.org>; Wed, 18 Oct 2023 15:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i/03raLpHkFpBZHbL3x7/mxMwSA0r+c2IOm5t1zdeoI=; b=3evCbLgDe4cKgK
	fl+BDdoJ+FBFM3pRaZpRh3B5b8uWJJUvFd3yzjih5/squRYM6lPZLIlVcpMtYcRD1gVHtL8ID5Dr+
	PO8IF8io93FnRs0pqBPTnmfJPiNRpRcVuqRumFnJwQgexWxmRN+ZeqE2kt7Sfqx3RAdvXf3W1j50c
	1HS3m2oW4JNbpQnHsRHiZhQiTc/3c5gE4rV7IeoW/aRt5mMyweHvNjXeb8ZDnxBSlRiWqPyuiSsma
	MSFPeXbHS2olNryiy33j4g/ZQyU8hUAEVJHb4uouMD8AJnxqVhaOWMEBiyW9ChtJpiEd34QFU+Sr1
	gtLBF73EJg+1TnPC8q2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt8xh-00F7qg-0F;
	Wed, 18 Oct 2023 15:59:57 +0000
Received: from mail-vi1eur04on060c.outbound.protection.outlook.com ([2a01:111:f400:fe0e::60c] helo=EUR04-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt8xe-00F7oP-0o
	for linux-i3c@lists.infradead.org;
	Wed, 18 Oct 2023 15:59:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jfaWnrYpE1jAknfEuW+BVJomXqFkgPRpuH3J2xbdsIHFxoGE/rzSLPrXy8LmE1WF/Nkp0NhjX+iFgsSiqgxSwEl4zkXPU4QYlGJTLJxFk+VOrQ8lQd2Tmqef5sU1sBqhq7Ya5QtUeorgr/Gl9SwQZ56SAPiWLqVVVkS4EDSX4B3pestrYx0eYGOvvnFJUSSwGrGupapT3UDtPml3Lqb7k+oArsS21V7VlKehxW/4fUzb3h6Dr3VnqTfsLkZGTVBnfdVBpqOTv4Z5m9rbiKwp6oEZNjUQpcUzStogIwXAgmjsShUZsuG17K7iKOwM2BkfhB2ZQRhJ8XK41WqAvvk1fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nayoLnZA6AxlXnKCCet/C/KGKXlH5vBlf4Xff954ehM=;
 b=Cs6A+f+UA2MHIjh7xAS+eKueKVu4GRgxDqtIwRuftQ3y1KkWx0e75QSdSrNqOPYLevH/9w3UGr67zj6EyEjmg3o3cVCma+M9dvtetbQPpjmsBnZCHoqg3nMJXVr54o3oksLi9a0OV6wlGxjfy2PQ3cWg4jnYYsaUnE2C2r/ox/NQUDztLO5ME6/ztL0tJDzFmbZTdqzQJvPQOFVEm9kGGzpKSb4hxfLUVYGdk7jCOxH5zmOncvYg4hTdrtuizB/OmOGga7Qz0jCIfpett0PK09CdcJr0TZdmNBKXDp+vlT+43Z1wjjDfPnIVW9Ir8ULvcXpv2Pk+U4M/jaUjsHx8qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nayoLnZA6AxlXnKCCet/C/KGKXlH5vBlf4Xff954ehM=;
 b=fGsyOL39waLA/RWuJbGv8x+k6tiNcRqmdvI9gY3nxfUtRD9D4HcuT4XSWqyEvqatBdMsfryPMAzk1MuIhVU1g3PkJeRFZ0JyiGJR60pk/ht+qo6A5tM5y7JC/LdqRf6NylCrBvvO0goO0DnrqR7507nOa0lY8ayi/rdVx1HSk+E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by PA4PR04MB7694.eurprd04.prod.outlook.com (2603:10a6:102:e7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Wed, 18 Oct
 2023 15:59:48 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2%4]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 15:59:48 +0000
From: Frank Li <Frank.Li@nxp.com>
To: miquel.raynal@bootlin.com
Cc: Frank.Li@nxp.com,
	alexandre.belloni@bootlin.com,
	conor.culhane@silvaco.com,
	imx@lists.linux.dev,
	joe@perches.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 Resent 2/6] i3c: master: svc: fix wrong data return when IBI happen during start frame
Date: Wed, 18 Oct 2023 11:59:22 -0400
Message-Id: <20231018155926.3305476-3-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231018155926.3305476-1-Frank.Li@nxp.com>
References: <20231018155926.3305476-1-Frank.Li@nxp.com>
X-ClientProxiedBy: SJ0PR05CA0210.namprd05.prod.outlook.com
 (2603:10b6:a03:330::35) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|PA4PR04MB7694:EE_
X-MS-Office365-Filtering-Correlation-Id: b3668cf9-f417-4413-0618-08dbcff34133
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zU8c6VPiSrcWJUHv36UOlWkRAmNu97Wq+uEKfWVjc7WOjokflQ5N6N8479ayadzuPw7/Az5xmWR4jd6LoYNGEQM8yEnoP7ZomDxKpCn3d/zxyx0CEpetz6+INS1pr8ykGDwhxIJ0GBJ7zMUdH+agXXoH2aQVMRumvWOlRZHPk/8dgnKkAcqXhsdqqg0w7SDJ680PHv4ZbiNIerxjKY14K95EWJzRTeQJK7FqY1B6wowv18PiKgSMvq/nGnKz6f7IwsL9wP0uMRvONYR80MBXYGVgO17MRDtFGiqZVj/R7zsWNJsBtqU2OoNbNwdrUGecBtyZwNtRCUcN1dQW2K4gHgl25+NwKwPiK36RWUyU8A+PhHT+hqjKWF39yhDN26xBBl3V2uxHqIyA2lmQBRV06Vawg6qXhBJdNsBnQvKoFA46Wlax2MwXV8M2OwJvr9WFyLEIu+NBpzv6UA9G19MrS0xyd1rXGvzEMrRf6tGaAHCOd1VECPULzWFC3nNicc3Guwjb++2dP8FgekNz/qhuzZE6lOtY4Aoxoh1BRDCQX18OqS4/Ka+lE1Wil3SRfdyAIEc3yiC215XFIWJJe+KJb0N+mTQ18zPTbss6T6s4mZNJZk5CPVXoCXKbNkYkz+/H
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(366004)(346002)(396003)(39860400002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(66556008)(66476007)(66946007)(6916009)(316002)(6486002)(478600001)(6666004)(2906002)(38350700005)(36756003)(86362001)(5660300002)(8676002)(8936002)(4326008)(41300700001)(26005)(1076003)(2616005)(83380400001)(38100700002)(6512007)(52116002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDdYUDFlMmwxb21DK25wU3RQMklDMTl6S0tib29la1BmYVRkL25lK09TWjh3?=
 =?utf-8?B?cWxvaU1WZ2M4NUZKUVp4THJHdlZHQVBwR3RIWHNJQXBjU2xIdUdXL2xMWjdt?=
 =?utf-8?B?L1hLMDI1c1NuTVRzU2NTSkllbEdzb2ZyMzRRSnp4UjM0bnVtbTBDUUhkVlNG?=
 =?utf-8?B?VDQvQnFZaGVMQllTTERZcmxVNmY3UTJtYWV2VmdqTnlsdUNPS3VjRTA5cGo4?=
 =?utf-8?B?VXVLT29aMk9zbHFvVEMrcEhKN0NVUHFlSG9aRlhoYlY3WXFST3JvSlYyYS91?=
 =?utf-8?B?ZlVYcXQrQWt0eEkyRjg4Q1FFUkZkUElKaVVSV1dhcjlHT1E2YkFIeEI5dUlE?=
 =?utf-8?B?U0ttdktyWWwyWFJGQzRVY1NCS2ppMVZNZUkzSzhkU3RKKzJTUnp2UmxvSkVS?=
 =?utf-8?B?NGVtZ2YrcU95VkVDRUNKYm83c1F4c21uY0loK2hHTlcxYVBvTDh5NjNRSGZL?=
 =?utf-8?B?MzZ4UWZ3RUkwN1FzVlMyTnBianEyVFJUWFJEc2lSaENZdUFiYlpEdnZ4bGNp?=
 =?utf-8?B?VG85bEVsa04rTHFueExsNnhHV2dSYThCMzNKS3BBZ25PNGdEOXdqVUtNVktp?=
 =?utf-8?B?dFVCTnBTVlRpUlIxWEpVZk4vUTZCNHUyUjN3ZGNVZk9HSnAreGxWMm14VGgv?=
 =?utf-8?B?MS8wajV1Z2R1V3hKN0JzRDJORXptSkk3ZjYzN2ZRSC9jVG9lRXlqdWFnNDBD?=
 =?utf-8?B?anBDRkE3RWRTUUxKN3k2MDI1Z1JEZnlPN3IvUE9wbFZNbkE0N016dGFXN2pu?=
 =?utf-8?B?VHBLajdSVkJEcDNOa0IwNTNJdmlMWTVjWUFZcmsyUFBJVnRodlArWkxLSERj?=
 =?utf-8?B?cnpkTWR5MkZ3UW9WMlZpanBqQnFMamY4Qys0dkhaU01Bb1hKOHdUUGtLYTBK?=
 =?utf-8?B?TGhmT1Z6R1pYc3kzWllpQzhCSXRrdUI0NUpVVHNUNGdvYUJpZzM5eU9QY3o5?=
 =?utf-8?B?dFRIN0xMU1E5cUE3QjY0elVZbGVaYTE2bGt3aFozZUk4aDY0Nm15TXVvU0h4?=
 =?utf-8?B?Z212TFF6bUxYMW1JZGdWN1dwVWdpcDd5NXJob2lxWGlZZVZSWEpwTGxoeTI5?=
 =?utf-8?B?TEx4N1IvT2V0RHpVc0ViMXJCd1hXWjdMQWRwbTJpOGdHcy9tcndST3g4Z3hp?=
 =?utf-8?B?NHFJOVpTV2Y4ZTZDQWN6UlZmb2twSnFFS05KMVJyWVgya0ZxcDRDRXp1UlR2?=
 =?utf-8?B?S3Q1Z3NvdHFvUjdrWEM4d2NXUXJqRC9QRUNGaXFKeHUyYkRBQnVIMjU1WGpR?=
 =?utf-8?B?ckpMeWdkNXJkMmh4amdDb3Q3b0lpV2sxRHdGaE1zMlRNdEpwUHYvQlI3TDZi?=
 =?utf-8?B?QWljQkpxSGxQMGdjY0I2cUtrTEtXeUZQUmE1bStnRzJTZzdsNFJzTWlmamt5?=
 =?utf-8?B?VitZNGJlR3MyL3JLckgycmdKMmxHODdXb2JtNXRXb0pVOUFtdk5BYWZLMFNH?=
 =?utf-8?B?cEU1bVBPRCsyQnJKYmxmWUQ5bjg1dUhDT0NsM0RmeTJHMXV6U3QxejB5cWhv?=
 =?utf-8?B?ZTd2WE5lOG90R3hrZ2c1K3FXUzY5V3FwQ3ROVmtGZFhTbGNjakNtU0duWWpQ?=
 =?utf-8?B?bFZhOGcrcFdnZ0RXbExVdlpRbFZUL3ZwQm5Hd1l6UWtGRFV3QnhvZUpMUHJj?=
 =?utf-8?B?UE40bDViNHFYM3VCOFVBdGZZVXRrOCt4K2tncFNFM0RFRU94a25GVXVENnJh?=
 =?utf-8?B?NkFaZFFsWFJveGIzenNJcjRqeVNFbHJCMmM0WkhPSUtOb2tFOGxOR1JTUTNh?=
 =?utf-8?B?ZlZzd0ZkTVJIWlU3dzcrd2xLSEF0emZqK0FlNlg0bG9NVHVTRHRndGRMOXJk?=
 =?utf-8?B?aUlnSGFtRW9iOU5QN09GcE1pVmdpZlJNVkNLWERVUWswRWIvemxGK2ZwNDg5?=
 =?utf-8?B?ZTFVRFV6VHJuZi92czFLZTQxNEMyTEFRTFo3dTVEVFdBTHM2cWV2S1VSM0hp?=
 =?utf-8?B?U2ZLV1VPRWplVVVKM0VzUFpQRlZYTXA3M0NkSjJFcllBRFZNTDdUaDRoRjlE?=
 =?utf-8?B?QzJ3aWJpWDBTR08vQkUxc0IrOGVTZGFodWljQzZZOTdSN0RNaWNDSGdGd2Ja?=
 =?utf-8?B?aW9MeGF6azlUS1lyd3dTWkhKMTdISGZKTEtRLzRHODhXNGJ5YjFwaUdWbUtP?=
 =?utf-8?Q?QgzfW1/VOEPaNgb8FzLp548+1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3668cf9-f417-4413-0618-08dbcff34133
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 15:59:48.2273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QRsBa7JWfzK+YweX5EuEKX7chQbGcC9JZ5hku/S09EdEHmxrHjmRdQRqP6HzUZzLUXaUrmhI+Hx+VEVuYgCBjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7694
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_085954_297303_4D37B5E6 
X-CRM114-Status: GOOD (  12.43  )
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
