Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E1F5CDB474
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Oct 2023 19:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jX9Srfix0YGrK3JpnKXyxdMp+94WvWobNLH1lCLFbSo=; b=PO5mOYAe5avYL5
	hmbwvNISt9Vuo9CzW8AvFx2Kn/dDLdNbQ7LwjTLgeNt6Dp7EDazQQaKiaaVbI9b3yclQymCaQUx/0
	5bhzPW/ddS+0FXnOPnmv77sQJscddHkRRTU1z11QNf7r2pdvjVqKbrLBFbtvJsmsVKme4kriUg02c
	zK27VoOo3bfcx6VOcMFquV3FLl92agFRzbM86PAsuod3/JjnvfCQtKIsnV1OVicH7Alx9bQiKZ9JI
	5IKfX334wasN303SAcxl01deJW2PsHzg+yBgGa3EGj7iFE4S9Yoc+7ulkk+Ki3b2bEwFIvLoU3ilh
	ak3U0t/7FAOb0iPzvcJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsq2M-00D8Lf-0M;
	Tue, 17 Oct 2023 19:47:30 +0000
Received: from mail-db8eur05on20604.outbound.protection.outlook.com ([2a01:111:f400:7e1a::604] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsq2J-00D8Ke-25;
	Tue, 17 Oct 2023 19:47:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nlVhrw3aDaguBif8afw2uCR3QLVB3asY2tBntn40sKD7fBYcf4Oy0+biOv3OMKFij/IogFcEdSqXs33FhffdNbjMP1EPOhcNj7GsueufwEezoKK9H8aUoFBGo3CgGer+H4ibuvVu9y5NbGAhFoYAtldUJIRfc9aRYfyXcIKSsPjwWaV4KJTG98wNf7vswmVTgNnI2p/c6oyZN9TwlDLz/YQIav+HG/a6SURYAxUYrMGOBNV8ftb1vBzdTCzZUHaXvlu3tcn7JXj+P+6q5FzyRZthxSQbqqCond4Q408YsRNYhWzNHdqXwI4uJnCAFkAn1ybzKeBudqAxOAYQcY4g7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ullkdJJ/EiGV/THB2JFNeF46ooxPxd0mtzetQN6b79s=;
 b=EtDEf5ujX16sVQ26EXOeqeNTQBqd9cl5uqo/gvJ5szKXg4Qh/TfJ4L3HEtraIVZ+7y2BP3xK2jvU8ckhwLN5zsKPimNjeNlQETkL1v7ApViG/yaZcHXDlEqOtwmM2AiHnln7vsjAeeAitkElRAtzRcIjbgL6TdrR0inO395VE5EB4Nb+LKCsEkQLXmQ8d7FUWTSOleFD9M7Atl4qF0InPk1+UxTQGUVr7grGc6DnBBt9QEkUrPw7TWZpyyzgOk79X8huSUV+JcMgO69gK/g1TerfLUtbdbNYXYt8iNlrenKjmNcse4cThq4L5uLkM7Wk0Pp9F0Xe7DJ9X9ArJlmPCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ullkdJJ/EiGV/THB2JFNeF46ooxPxd0mtzetQN6b79s=;
 b=dVw7gsHbsIshVOej6tXQJB1P1koNgR1DUi6yL0Mln9W8Jql84yTYxmuwhmexUi70CYHVPwIGI5vciQ3tOZY1owWgcyrrNgqAuTKNqqfx2+VHaodyECJpdndLSDcDBrUYcXq5M2c2qWS7LqAuXSwFYAHpOo/3TamgeBWUGdabmu8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by VI1PR04MB6909.eurprd04.prod.outlook.com (2603:10a6:803:13d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Tue, 17 Oct
 2023 19:47:18 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2%4]) with mapi id 15.20.6907.021; Tue, 17 Oct 2023
 19:47:17 +0000
From: Frank Li <Frank.Li@nxp.com>
To: miquel.raynal@bootlin.com
Cc: Frank.Li@nxp.com,
	alexander.stein@ew.tq-group.com,
	alexandre.belloni@bootlin.com,
	conor+dt@kernel.org,
	conor.culhane@silvaco.com,
	conor@kernel.org,
	devicetree@vger.kernel.org,
	festevam@gmail.com,
	haibo.chen@nxp.com,
	imx@lists.linux.dev,
	joe@perches.com,
	kernel@pengutronix.de,
	krzysztof.kozlowski+dt@linaro.org,
	krzysztof.kozlowski@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-i3c@lists.infradead.org,
	linux-imx@nxp.com,
	linux-kernel@vger.kernel.org,
	peng.fan@nxp.com,
	ping.bai@nxp.com,
	robh+dt@kernel.org,
	s.hauer@pengutronix.de,
	shawnguo@kernel.org,
	sherry.sun@nxp.com,
	xiaoning.wang@nxp.com
Subject: [PATCH v2 1/2] i3c: master: svc: fix compatibility string mismatch with binding doc
Date: Tue, 17 Oct 2023 15:46:56 -0400
Message-Id: <20231017194657.3199749-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SJ0PR03CA0203.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::28) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|VI1PR04MB6909:EE_
X-MS-Office365-Filtering-Correlation-Id: dc1cf941-bf5e-41e8-7136-08dbcf49de90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jkr0PV5q9OwIltzN9DusML80Bz3d9x3BWfinm/espudKZo2Fl8CIba6mYwtr6QmfjquLIaUDw+e3vwzrgByQ9/TObqw6HyoB9mRR9cv3eb9vRis3PgO0//DrWr084K6z0nNDPK9ajp4d00YpdPpDJPb2J3nivd0kCCz5Knz6gaRgRjqKT7mCzDwOt1CTUqMLZXozKcKdS6EZPM5AbUuENn2eHWDW05YGI77pdCMKjcecL+57tJLoomQDQf4maWT5aActL/qJRmQ+g69NjnI4oepynavXQkcjYeUeSqlhZcL4/D+TFkYGLt/CnJWVu0PLnDTO5y4AiQc4DqMABVPs+jlvLiM9Uw92cQfKmDhoXAXKo9mcSDWD8jYbpYQpH6mXy/a0Mwi/D9XQM503tGzr65WJbM1XNwW57/NxSrYGmlzNvwG4A7FQGfZ70ow3WsfKCMf8bauOUw+dnu+NkL3ZnfmJmMTmU8QfqSfan5nMEcAAinLCtB/0OgU55tOo43eNDDAUbNwzV3Mmc+FCnSKbMhTaA+bsVQiOlGi6fa2JduK2j99cc/FUnI3snOlS0ctb41ygyVUjKGaep8Sp2oWRsEwfhv7mhcVrgN/Z0cGJMU1BjnYBPmBxCRsLc9UHEDKL
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(396003)(346002)(376002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(316002)(66946007)(66476007)(6916009)(7416002)(86362001)(66556008)(2906002)(5660300002)(41300700001)(8676002)(8936002)(4326008)(36756003)(2616005)(38100700002)(1076003)(478600001)(6506007)(52116002)(6512007)(6666004)(66574015)(38350700005)(6486002)(26005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlJlWHdIdkxnNkJQRlVVTTZBYjBMbzBERXkzYkY2dGJrM05kNVZJMkFXS1lT?=
 =?utf-8?B?ME16ZmgwT3hKYTYxd0VoQkxsNm15MGd2RTJsMXk1eXFzaVJ1WmVDT2U1N3N4?=
 =?utf-8?B?ZytvSnJrTDU0WFIrUHlCM1RxbUJwNXZSQnNhY1V1cTBIVmFkZGFKbXE3R00v?=
 =?utf-8?B?K2VaSWJzT0tjTVZGbXhERmZZYUF5elhpY1hKeGFCRmNCVUhYaVdZY0lpbEZa?=
 =?utf-8?B?MWhiK2ZseEFZSUtiUTVWSUFsZ3N2dytjQlcwOHh0UHMrM05vUEhGak13N0VP?=
 =?utf-8?B?Wk5GNWlRRmVkV1FBNE02dWp0SkRpK2l4MmhQOGtmdzlHaWZWNGc1M1o5WUY4?=
 =?utf-8?B?dWJNazZIZDRZUTFpOTFBRXhsVGtxWkZ6dHpvQVRqTy9mYW1abFRQUUI3b2Jn?=
 =?utf-8?B?b3VtOXc0TnBWL3lpM3ArVm5tQXA0b3lEcDVOWWRZVkxMS0dsOCtTN1FaVXB2?=
 =?utf-8?B?djVlTUJjUC9HeTNrd1VGVGdnV3hHSjBjSklLVmJZLzl0UElla2hJTmprU0ox?=
 =?utf-8?B?azlsVHF4WllabWVYejdScjgwTk9xOGtDU2ZwZldyUUUweFdzWUM0S2JBU2tr?=
 =?utf-8?B?ZnFnVlZWTTZ1UElwdlRmL2NteUZmNm9wNkZndFc0ZjRGeDkwZXBoRW9FVi9Z?=
 =?utf-8?B?bXl2VzltOEF0alFwLzZPajJuWk9WaFhaZkNCZGM3N25oRnNiNEF5bTIrcFhF?=
 =?utf-8?B?RmNpV3I4bGZQajFZSXg1Wld2YkJVZk9hR1BRZTROblNCam1uVjlMbEk1cndv?=
 =?utf-8?B?eHBsODlXcEN6K2l5RGNpdTZlTm5RT2thWkh6ekd0WWkxb0hlUjc4MnBsU0Y2?=
 =?utf-8?B?ckNGQWVWbHZ5b1pBQ05PRlEyckJXaGl2bG80YnpKNXZ5aW9iVDB2RGVoa3lN?=
 =?utf-8?B?U2svUXdXa0R1N05WM0lmMUhraTd3eWxVZSs5UEJPajgvVW5EZTBQK0RtbURq?=
 =?utf-8?B?Z3hVTmIvSlQ4OWs3SWNRdy9kQ2NYUlZXdkhuU1VaaC95TGlmZ3gvdEJ6MUph?=
 =?utf-8?B?S0RMRVZKSW9LYlhjRmRrQmRjQ2VSRTBQNUd4L0ZDUVRoNmlmU0diVVYzUER0?=
 =?utf-8?B?QWlFeHppK25OTnNhNFlod0FXWmQ5cWlaVEV6N2xpNlBmSWswVW1NekdDMUhv?=
 =?utf-8?B?QkN5TVRYVWU2K2Y0WGlkL2NCNE4zdjJWeE5iOUdSYzBtSlo0VWFKYzUvelA4?=
 =?utf-8?B?WGFaYlhQYm1jN0xoNTZIcmpWOFRzTkZBTit6dVFQZFZoMXhXY1JnQnZaSGRR?=
 =?utf-8?B?ajRCYkl0bVBlU3BZYUNrUUJnOFJ2TVdBakpnMUtzWjdIdnFLQkdJazEvdW16?=
 =?utf-8?B?NlBpRExONm1oaUlPV1JTUTVTN1ljdytuM25DVk82QlliaDhxMHdUcS9CcWh6?=
 =?utf-8?B?MHYza1I1SUZjN0xHUUZ4OS9hWHB6aWRuYThNNzhCc0ZyV0hITjk0cjJpOFFr?=
 =?utf-8?B?bnN4em9NS3poTHRGUGdMWWlHWk5oaVpBUndsZXRpRGtVbXFUUnZoSzhsRzY1?=
 =?utf-8?B?ck10STZxUjJMOHVGa3R2WW5mVlBKK3d1K1VDdUJyc2VVTkhnQm54SzMydWFS?=
 =?utf-8?B?MjhOZVhpZ0V0MnBGVkV0N3ZmcGdJeHpDNjArRGswd1Rjb1lMVk95b2Vldm80?=
 =?utf-8?B?Z1RxV0NRRXJ2RnRDei85NnUyRy9PaFVYT3AwSVBmbDAwUTlPNVdKVXk0eXZ2?=
 =?utf-8?B?RmtEL0p5RXB5WjN4UHNBdHlWTys3NWNYREhlaHdhVTZjZlZaZ0M0eHlNaElS?=
 =?utf-8?B?enRnK0g2TllIRGY4MHBPTE1QRng2ZzhvQ1RLWTUwcVhaakx0R0JpVjViVCtN?=
 =?utf-8?B?ZlBnZ0hNY3NnVnZTUmlaZUw2NGJwcmkxb2s0ZzJET1kyNmJUMjlmZXppNEo3?=
 =?utf-8?B?a1FZeHExQ01ZSFhIRWpMaWFuTUY1c1pBSHRwd0FsMWMyS1FzWWdwZFJ6S3Uy?=
 =?utf-8?B?UlNxUXRvZUpNSzNjeFk4d1ZtSHBZZ3RlT1pXcVZhWndFSFRCYWp5VEFJZDVO?=
 =?utf-8?B?Uzh3VmUrVGt1cGRjQXRVKzNHYzVMWFcwbVl2czBRanVLL3VMdExaaXZJTTBY?=
 =?utf-8?B?U241dEZRSGNqMW5SdFNJNGFpbkFncnJVRGlycUx1U3hJc1FoTk5zNjQzZmIz?=
 =?utf-8?Q?u1E/eCLHR4+kk6GOvYCe+xnbH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc1cf941-bf5e-41e8-7136-08dbcf49de90
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 19:47:17.8639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p4dDZs5t1R42JKXXO4sjkp0ZNQVPfw0FpGmKPjbDv2ctbVWxnGiz7RK4fM6jMUaTe5dYM3XgaYUUqpNmN59i9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6909
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_124727_686136_7479F624 
X-CRM114-Status: GOOD (  12.46  )
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

SW4gdGhlIGJpbmRpbmcgZG9jdW1lbnRhdGlvbiwgdGhlIGNvbXBhdGlibGUgc3RyaW5nIGlzIHNw
ZWNpZmllZCBhcwonc2lsdmFjbyxpM2MtbWFzdGVyLXYxJywgYnV0IGluIHRoZSBkcml2ZXIsIGl0
IGlzIGRlZmluZWQgYXMKJ3NpbHZhY28saTNjLW1hc3RlcicuCgpSZW5hbWUgJ3NpbHZhY28saTNj
LW1hc3RlcicgdG8gJ3NpbHZhY28saTNjLW1hc3Rlci12MScgdG8gZW5zdXJlCmNvbXBhdGliaWxp
dHkgd2l0aCB0aGUgZG9jdW1lbnRhdGlvbi4KClNpZ25lZC1vZmYtYnk6IEZyYW5rIExpIDxGcmFu
ay5MaUBueHAuY29tPgotLS0KCk5vdGVzOgogICAgQ2hhbmdlIGZyb20gdjIgdG8gdjMKICAgIC0g
TWlxdcOobCB0aGluayBkcm9wIHNpbHZhY28saTNjLW1hc3RlciB0b3RhbGx5LiBJIGdyZXAgZHRz
IHRyZWUuIE5vCiAgICB1cHN0cmVhbSBkdHMgdXNlIHNpbHZhY28saTNjLW1hc3RlciB5ZXQuCiAg
ICAgIEkgaGF2ZSBub3QgYWRkICJSZXZpZXdlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJh
eW5hbEBib290bGluLmNvbT4iLAogICAgaXQgaXMgZGlmZmVyZW50IHNvbHV0aW9uIHdpdGggcHJl
dmlvdXMgb25lIGV2ZW4ganVzdCBvbmUgbGluZSBjaGFuZ2UuCiAgICAgIEkgdGhpbmsgdjIvdjMg
Ym90aCBpcyBnb29kLCBmZWVsIGZyZWUgdG8gcGljayBlYWNoIG9uZS4KICAgIAogICAgQ2hhbmdl
IGZyb20gdjEgdG8gdjIKICAgIC0gdXBkYXRlIGRyaXZlciBieSB1c2luZyBjb21wYXRpYmxlIHN0
cmluZyBzaWx2YWNvLGkzYy1tYXN0ZXItdjEKICAgIAogICAgQ2hhbmdlIGZyb20gdjEgdG8gdjIK
ICAgIC0gdXBkYXRlIGRyaXZlciBieSB1c2luZyBjb21wYXRpYmxlIHN0cmluZyBzaWx2YWNvLGkz
Yy1tYXN0ZXItdjEKCiBkcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYyB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jIGIvZHJpdmVycy9pM2MvbWFz
dGVyL3N2Yy1pM2MtbWFzdGVyLmMKaW5kZXggY2Y5MzJlZTA1NmVmOS4uZTMwN2JhMmI5NjVlNiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKKysrIGIvZHJp
dmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKQEAgLTE2NTAsNyArMTY1MCw3IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyBzdmNfaTNjX3BtX29wcyA9IHsKIH07CiAKIHN0
YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHN2Y19pM2NfbWFzdGVyX29mX21hdGNoX3Ri
bFtdID0gewotCXsgLmNvbXBhdGlibGUgPSAic2lsdmFjbyxpM2MtbWFzdGVyIiB9LAorCXsgLmNv
bXBhdGlibGUgPSAic2lsdmFjbyxpM2MtbWFzdGVyLXYxIn0sCiAJeyAvKiBzZW50aW5lbCAqLyB9
LAogfTsKIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIHN2Y19pM2NfbWFzdGVyX29mX21hdGNoX3Ri
bCk7Ci0tIAoyLjM0LjEKCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWkzYwo=
