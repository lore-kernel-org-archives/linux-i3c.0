Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C4BCC4167B
	for <linux-i3c@archiver.kernel.org>; Fri,  1 Dec 2023 22:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U2HQF1ozGghvNdfQdj6B80eDZHnJ+J3IKECpwbOenY4=; b=Sp+Zrc/p4Xpyr5
	xfKTyZ1g8FaljIEmyx61nK0KCMR0hvbgSApfT2Ux0u8PNe9rxgvHvcoMfEqhzAbbEMvgAwlKuy6z/
	NVt5cQnjcIcu+3Vldxg8nue+DJtfWGzua7zUDFjgMhbCpBhu6CtZ76rNNfajRRCn/OkYWBnAah4rg
	szYxn2HjGN7oefafOHLN9JObrl6eYnQqZZRI+W+yJtD5TqUvdU8siO1/d7iVnvNdMgNK80NOLK9QY
	obqUA2QP0Vxa3Q0PG5ps+XKTjmTC3HuEY54FADfHNpes25kQcIghyN3yaizseNCRbb0sANe/Eu+8E
	sZp5pXmqKKgllmR4ymTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9CCn-00EmRW-01;
	Fri, 01 Dec 2023 22:41:53 +0000
Received: from mail-db8eur05on20627.outbound.protection.outlook.com ([2a01:111:f400:7e1a::627] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9CCk-00EmQN-0h
	for linux-i3c@lists.infradead.org;
	Fri, 01 Dec 2023 22:41:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gI7dXhz+mYKhvnBa3ybrOW3r+AYM4CJIEfDUfaB2FdkdzJQparT5uepCVsTvOeQi76ZKEqlKcSYDJhO6nLsFYLPT2Ui307k0H292HYsv3E423koDQSTtMciPfCNFGpQcia2JCvTARfjCwTAEM/53EpXc7vbT0cip6i11C9zDSmbj3dw/n/Aigu9g25w8X/RknflevVynsqe7nmrEGRW1THmA8DhwAbgDutbrjugrS7Qi3p6z5aSkeqUY/oTyQeO0UjSg2nl4s2wcHH6Bfj/iTEpywGkZbfl9cPfTWwFV9BmsBYbhxLppjLBmCxWzWmA8pNIUGHGJUfyBSxMnKEOyFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytSmslj5oOfXj/kvlZ0mw3AYP7VbssW1sje4uneG+bA=;
 b=OOu7NicjXo4y4sfIACOBfyQ9K18eeIXJmF6Gn21M92G1L22u/e23kPXT1VSy37Lq3/OpBY53XgbXVaSOd7HFikztr6DgacLArCUd2uqQhxws01efNcPll7FUhX/PL9wtWdZRPuc1TOd+6HaoP4L9drdMiPx1+VBJux++gz/jFbUweGMgfn20zTjzSty2sg9CFYhPLabOkczCqgCIpzdDWSDhwIDnfjkm9eYeBZCQnMWPxG8SF4I72UtTc2VFAhqfrt6oeeCpqq2zUAYlj70cPeDrV9YvKUYeVe4P5o/rfMVtaYWewCwcHEMwBC5+og0E7L1Jpl+cPRU9Zj7uF4JO8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytSmslj5oOfXj/kvlZ0mw3AYP7VbssW1sje4uneG+bA=;
 b=JOunq7HbhLZHE+jT2FjBvJBXU8XQmL6FcuzAAtaNuJk1NgJMykpNoWKpj7DafQZ8vB982rtRWNwmXdW3XcKxJ/ZVx11Yo6Dv3SSmJ5m73KtyauzRwJNrOtgidbFy2Z1bR1qlCneWLIhyK2bUKIFire7aURyG82h2a6eVI41l2qo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by AS4PR04MB9573.eurprd04.prod.outlook.com (2603:10a6:20b:4fb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.13; Fri, 1 Dec
 2023 22:26:03 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::95f5:5118:258f:ee40]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::95f5:5118:258f:ee40%6]) with mapi id 15.20.7068.016; Fri, 1 Dec 2023
 22:26:02 +0000
From: Frank Li <Frank.Li@nxp.com>
To: miquel.raynal@bootlin.com
Cc: Frank.li@nxp.com,
	alexandre.belloni@bootlin.com,
	conor.culhane@silvaco.com,
	imx@lists.linux.dev,
	joe@perches.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	zbigniew.lukwinski@linux.intel.com
Subject: [v5 resend 3/6] i3c: add actual_len in i3c_priv_xfer
Date: Fri,  1 Dec 2023 17:25:29 -0500
Message-Id: <20231201222532.2431484-4-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231201222532.2431484-1-Frank.Li@nxp.com>
References: <20231201222532.2431484-1-Frank.Li@nxp.com>
X-ClientProxiedBy: BY5PR17CA0022.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::35) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|AS4PR04MB9573:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ad3cd6b-5a01-4d9c-85fd-08dbf2bc808c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vKP/NnJ07gyG4MTJe2TvXhceAzuQsoxkj80mFiMAnF8jJu3dq1mXdNfEDMvnwBHZSJVNUGZAIwMajlKheXIN7dbRjhJ73S8RzPvolTceunNFOhWdsjlmJA8BgOLtnvNv1lUdcLtUoeJ8ZHaJ4MfurJ3viwnIF3g8pRjHe00TVBVXNv4WXYz4PB20LrFa6Ew6EQaMv03/N2ASke5I905P1+G08izwV/FpOCqRZ35mZ/xiUn5oBwZi8ZeksSs79ClcJuCnF7HxNvZf2JbnxylJ3Jo3ji9HRGQIk2EQj+2IPMDC6vmOe4gxGIxOMZU825xa3Asgq4cqlurTSwVWZRw2meETwbhsxEn6U4n6KKpNdeHcgCDgI7woK9u6z9mdyUF4PxiY3zMlg3BtU2F1GdGsGdAndNMOgudecJNklqffDk7Hu3twF/goyykqimkgKIpVljLoFqoA9M6LlipjNUY3uKKNuHcoGnfb/Y5Gqjp1SNdF5BTRClYGjtG5gck/cJhraXLYzFPqeeCWqvrhmDYaTPdkPw5E+sepz2Rp7eHl4zht6Vxa/2TbCbYdkRt3tOfbI1tQsZTRJx7vsfvkObIU1mqXtoBeZFkpDJUtym2T67yp5elfOFgH6g8CMw56f90s
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(376002)(136003)(396003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(86362001)(6506007)(26005)(1076003)(6666004)(52116002)(2616005)(6512007)(41300700001)(5660300002)(8936002)(8676002)(6486002)(478600001)(2906002)(4326008)(316002)(66556008)(6916009)(66476007)(36756003)(38100700002)(66946007)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHlEMVpzUkgyVU0zN2hIY0lqMjk0Z2FSRGhWSVV0U1NITGsxZXU0RmMzWW90?=
 =?utf-8?B?WWh4TmtwQmt4eVltVVoxVCt3dEs1MDlMaFQybmw5KzFZakpvbTc1elBjMm12?=
 =?utf-8?B?OWd5MEd4c2taSnNGbFl3MWNoMUgwTXY0QkpYRW1TRGFlR1lUUXZDOTZCRC9x?=
 =?utf-8?B?Z0hMaFNxZG4ycU9uRnQ3UlRvN0JnbmJKVnNWLy9oVGdkRHprdm8wRHpxZ1FC?=
 =?utf-8?B?b2UzYVo0SEx5ekZER3JjL295SWdpVmVJL09QbjY4UWpaWmtyOXkwSnRSS3BZ?=
 =?utf-8?B?dytBQzF5TFR6UXZjMUZybVVJaEtIdHJVWHhsZHFvam5jMEJZNG1OeDJwMFRr?=
 =?utf-8?B?M0J5aTJGR1lMWmxUa3k5ekZwRU0yY2hHMkcwaFh4TFgrT1F6eldYamprVVdl?=
 =?utf-8?B?Tzgvbjh2MG9pQWVweTF5TG1nZ3EwSk1QcVJseHBVZnpWS3d3WDk2VGo1NkNB?=
 =?utf-8?B?NjdPNE9ibUhyZXBuRFFPZmxIZWRwZUVkQnFWbHZBUStvRThXTzlxUzR3UEp4?=
 =?utf-8?B?SmNXVTNJR0FTU283MGJ3R29VY2xUZDhWM3Q4RnhsclpNLzNHRHRObTl5OHlY?=
 =?utf-8?B?cC9kT0pUdklCbE4vNjBOcXViclVFSndVc1hNdGpBY1BqcXdGUGVqZXFNNVFF?=
 =?utf-8?B?NUNVRUhRZXRNalZLOFNTRzVIQnB3VGZzamEzQVNsTHZwdGZCa0h0NmloY2E1?=
 =?utf-8?B?UmpVRFpVNjlGTTdBSGowS0RtOGZyT3U5UTBVM3pEdGI5N2t2YzBXamxVdmho?=
 =?utf-8?B?YUt0dCtOeUhiZWtQcWZtdWZqOFdtNUdOSUZmRTV3MWlQTGxNd09henNMZzF4?=
 =?utf-8?B?ZWJlTUY1UW1IbUFhZk90Zlh5T3dVT29kcDNBcndnVlZXd3pmaGJKejRLMEFq?=
 =?utf-8?B?T0F4N3IrdkpkZFFFVXdaNE9WN3VLNlZ6UkJoV1RjRU4xODZtZDdzc1Y3dzN3?=
 =?utf-8?B?VDBsRUdGeFVUcUNSZTh6NDF3aWt1RDBSMWoreHVlM3hkZEYrTFlpQWlYbDM1?=
 =?utf-8?B?Ymt5K2hkMVJBQ200QkpiME1aOVI2dDh0bXgyaFk1VVRpTklXcVlubURFTnRs?=
 =?utf-8?B?dUhQR01oanhCR2YxZEJleW4ybDRmMDBHaXlaQzA3SUVLNHBNWEhnNExLM256?=
 =?utf-8?B?R0VDT3FmS05OcDd6amovdFRKY1pZdHB4UDNXWG9BUlBEN0tVdzZWSldwRmU4?=
 =?utf-8?B?aHYxZzZYU3ZkTTVpV00xY3VjZER6cHRkRmpRc3MvNllsVjc2TzdVK29TdjdX?=
 =?utf-8?B?ZEtvQXI4cmtpZ0ppdERhdi9KV2o1aUlpeENYdktXdkVzYmN0by9jZzFKNlNR?=
 =?utf-8?B?R2ZCNjA2dmJFc3IvaGQ2RWRHU0g3ellvRTNFWEx4d3plTENpTG5VMUUyZVdp?=
 =?utf-8?B?ZHpnN0VHYlloKzFPNTZDZWdWY09uMVYrSXdGRW5NUkE0MDhvZ21oS1ZBVnJl?=
 =?utf-8?B?SlJEeFN2TERVTHpjNFYxKzk5akpoMm9WenZrMVdUN0xQbDhsdGlxaW8vaEJ2?=
 =?utf-8?B?SnpkYzlXZEcrdncrTktTVXRZWEZjd3kwSlhWbEcvRnQvZTR6YVdaeW9uSTRU?=
 =?utf-8?B?c09xYlJuaHl4Y1gvcjgzS3dnRVkxOWFNNWVHNk1LdVlzOWdKbzRnekR3YlB3?=
 =?utf-8?B?b0JoSStiOStuWVhWd2owbmtLZlV5emE2ekFEWlNZNkFiWjBWNXFkRWdNU2d4?=
 =?utf-8?B?UWRPbUxNd2hnaEZMZENxZjNMMlZzZjFRelJUMlRqZTZRbGVQYlRVTDZIZnli?=
 =?utf-8?B?eEVPb2U0bWRrMkQ1MFY1SEFnc2NodFdrWm15UFd5dEhBTTFEdUw1bHR4TEZ0?=
 =?utf-8?B?eDVGV3JHMG9POE9FelJaQkJ6bUtGc3hVcmdMVktKM3M3UDR4Y2RVRnkxWnd4?=
 =?utf-8?B?UlZmUzNycXN4Y2ZCNTdpeWhhODdBYVdQbVdETHJYdFUyVXRxNFVEbGVyUXh0?=
 =?utf-8?B?MUFsQk5GRjVvZTMzU3FZQk9LeGNmWjBiSFQ2cFN3S1h3aVkvamd3ei9JOXky?=
 =?utf-8?B?TngxTTBHVitSZGp0R3ZRTng5YUVWUEE4clJveDZHcjc4UVd3R1RBNGl6a1ZG?=
 =?utf-8?B?Zmp2WFdIKzRmbWdjaWtsakUwNTcrcnlLc3lCZi8wNkEyY0RDUlVxNzJPU21q?=
 =?utf-8?Q?Ysa/mhk1aQpPOfceX7qCQxfo8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ad3cd6b-5a01-4d9c-85fd-08dbf2bc808c
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 22:26:02.9291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7m/GcAvMDmJACM0jynTnXT43VoZZzdffftkZpGQ1NZrlIVHGLynb+jb92++UVN9jXtJtcE4m7n+h1zXPl7qOAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9573
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_144150_256882_98A5B205 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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
dGUgaG93IG11Y2ggZ2V0IGJ5IGkzY19wcml2X3hmZXIuCgpSZXZpZXdlZC1ieTogTWlxdWVsIFJh
eW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KU2lnbmVkLW9mZi1ieTogRnJhbmsgTGkg
PEZyYW5rLkxpQG54cC5jb20+Ci0tLQoKTm90ZXM6CiAgICBjaGFuZ2UgZnJvbSB2NCB0byB2NQog
ICAgLSBBZGQgTWlxdWVsIHJldmlldyB0YWcKCiBpbmNsdWRlL2xpbnV4L2kzYy9kZXZpY2UuaCB8
IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9pbmNs
dWRlL2xpbnV4L2kzYy9kZXZpY2UuaCBiL2luY2x1ZGUvbGludXgvaTNjL2RldmljZS5oCmluZGV4
IDkwZmE4MzQ2NGYwMDMuLmVmNjIxN2RhODI1M2IgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgv
aTNjL2RldmljZS5oCisrKyBiL2luY2x1ZGUvbGludXgvaTNjL2RldmljZS5oCkBAIC01NCw2ICs1
NCw3IEBAIGVudW0gaTNjX2hkcl9tb2RlIHsKICAqIHN0cnVjdCBpM2NfcHJpdl94ZmVyIC0gSTND
IFNEUiBwcml2YXRlIHRyYW5zZmVyCiAgKiBAcm53OiBlbmNvZGVzIHRoZSB0cmFuc2ZlciBkaXJl
Y3Rpb24uIHRydWUgZm9yIGEgcmVhZCwgZmFsc2UgZm9yIGEgd3JpdGUKICAqIEBsZW46IHRyYW5z
ZmVyIGxlbmd0aCBpbiBieXRlcyBvZiB0aGUgdHJhbnNmZXIKKyAqIEBhY3R1YWxfbGVuOiBhY3R1
YWwgbGVuZ3RoIGluIGJ5dGVzIGFyZSB0cmFuc2ZlcnJlZCBieSB0aGUgY29udHJvbGxlcgogICog
QGRhdGE6IGlucHV0L291dHB1dCBidWZmZXIKICAqIEBkYXRhLmluOiBpbnB1dCBidWZmZXIuIE11
c3QgcG9pbnQgdG8gYSBETUEtYWJsZSBidWZmZXIKICAqIEBkYXRhLm91dDogb3V0cHV0IGJ1ZmZl
ci4gTXVzdCBwb2ludCB0byBhIERNQS1hYmxlIGJ1ZmZlcgpAQCAtNjIsNiArNjMsNyBAQCBlbnVt
IGkzY19oZHJfbW9kZSB7CiBzdHJ1Y3QgaTNjX3ByaXZfeGZlciB7CiAJdTggcm53OwogCXUxNiBs
ZW47CisJdTE2IGFjdHVhbF9sZW47CiAJdW5pb24gewogCQl2b2lkICppbjsKIAkJY29uc3Qgdm9p
ZCAqb3V0OwotLSAKMi4zNC4xCgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1pM2MK
