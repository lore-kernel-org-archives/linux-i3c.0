Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579AA606A31E
	for <linux-i3c@archiver.kernel.org>; Tue, 24 Nov 2026 20:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P5ZmxNTx;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Xdk5s/xj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eD5htzvEhExWdQt2BQvCNwj0zQ4+APn7nDug+7r62vM=; b=P5ZmxNTxTxIR7V0jlILh+lUFXr
	PUZ135Zy99JZL0kANgfhPshx2jgBeky+pZcrpE+fcAZ2t9RqBwbBABenO7YQj/eurS2o5yAxjZdMW
	t9XasxEk4p/YdTSehJ8JKjd+yIgCX5wqRbHuA9G6cc9TdDH9+PBo+0NUu1eFeeaG9QoaJKprGB0Nn
	5mxlhK69X5ylZbwuKVwhp+zkkfhzkAiwChW+nNQKD2fa5U1wxyLd0o8sl1Ny9elXHUPQOjsTZeeDx
	i2qZ+EMgA2Wbds0YPVukeM/oMiHP7WR/GpfON6SR7MiADrfZKOeJsNw5KoiHQjyRJAV+LjMS2SwJ3
	mnfFcKOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxMk-00000007kTb-04xc;
	Tue, 24 Nov 2026 20:43:50 +0000
Received: from mail-westeuropeazon11011001.outbound.protection.outlook.com ([52.101.70.1] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxMh-00000007kSa-2mg8
	for linux-i3c@lists.infradead.org;
	Tue, 24 Nov 2026 20:43:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LM4I3CncEY8l11bChkpktfDfeCq1UOFHEWZQe9GVnMCBcqbpXC7ixFssz5azgWpMyXA8pSD+qSkmdNVkUTNM9qTBD7HtyPQdUvcUeB6E/cky4puR954TdhW7AAjWkbb0cR0A9rlbsKbUHSMPpEAzjIRM4ZnHzYth5GptbevFstlxzGYx2Q5wDtkhgiuIosoI2SqS2i2Qpdd0KzixJpiJ6pFQAncKiA28zOc/HF1UtXZaPLZV3EaZNqCY/5YHF99NKpek/9iFAez34Gzqp4Xo2iREuln4DwqljEv1rCNUxfdMKsgfxpBqShNSLfY8SC2SQ4g5gseOpQsH56kDUPGbSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=daKaTJKTCDupfb+oz62CP7fxi7hPT4L6Mh1U9/Dqh/k=;
 b=I0dQbq9c+WsqkGe0FqwDBO0jlRjxyyzriuFB9Tv/wybIHzNQ2la4ysQVfJqUPs0ikI/C9xJIzUQ5OyUOeQsIhnkDvrWPVC/714TLwQhvQvOStV91K0/15bPxwItkG0zkOgxHUAF7rbkWBeYeGtcoH58bv834M6WjL0p+IKtdgXo9rYZSW2uyGuLikQMxN5sD6WR/J7rwmKn7dG1qt/ioSHyQr3ddsxUigwpn8k2VeIBFWkYdGWKYDSablKLe6nM+spBJrsMNt+CwDEMm9qrNVIb7uGTAO/KIUB28sq0CiKQlPlQbS1WGytX1HtxaKrouB1d8dI6U3rNsRcm8lz8CjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=daKaTJKTCDupfb+oz62CP7fxi7hPT4L6Mh1U9/Dqh/k=;
 b=Xdk5s/xj9k+b13Fxg8KX1gCimTsSFfBY+knTCjD86S2usClEnRzX1Xb7yMYQAro+bbU0syoIYA300yV/Tn94qesQn+n5PXRXycHYUb1eazAV3PA2haN7TJOmwOPBGzU+FfcAnzNz7hNVSvm8hEWZW/s1cdlrWsm1vjAuigWgvni7ZZtuFHWsqq1T8HrpUlYcbY1JUA9cFxsf6ljfVt6q/wSOzSWWXu4TE9NEuTU7l0mEhbN3pB6QlFoT1cUI4Xh1eYrK9R0KFgNoIO8vK/RK6xtog30BbK9jBs2jiNAqs9v+aeFHYmVdPyU7k3YdjVtQnVEF8OgyT0coCt8ySsKTpw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GV1PR04MB10275.eurprd04.prod.outlook.com (2603:10a6:150:1ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.5; Tue, 24 Nov
 2026 20:43:42 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Tue, 24 Nov 2026
 20:43:42 +0000
Date: Tue, 24 Nov 2026 15:43:35 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Dineshkumar Parameswaran <Dineshkumar.Parameswaran@synopsys.com>
Cc: "Frank.Li@nxp.com" <Frank.Li@nxp.com>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] i3c: master: dw-i3c-master: Add HDR-DDR support to
 Designware Controller.
Message-ID: <awX299zNo7DKYPs4@lizhi-Precision-Tower-5810>
References: <20261111021151.58380-1-parame@synopsys.com>
 <20261119135703.22729-1-parame@synopsys.com>
 <awSg5WQFw6NktkEi@lizhi-Precision-Tower-5810>
 <DM6PR12MB4074F28613C2DBF99889D2DDBD442@DM6PR12MB4074.namprd12.prod.outlook.com>
Content-Disposition: inline
In-Reply-To: <DM6PR12MB4074F28613C2DBF99889D2DDBD442@DM6PR12MB4074.namprd12.prod.outlook.com>
X-ClientProxiedBy: PH5P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::17) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GV1PR04MB10275:EE_
X-MS-Office365-Filtering-Correlation-Id: 889ee6de-ba5f-4963-d4c3-08df4a6ba04e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|19092799006|4143699003|56012099006|10067099003|11063799006|261021121427099003|261022105027099003|261026140227099003|261028144727099003|261102123227099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 9Mg3tDx9/OUPKBHED/qQCwLn4+vHhhx25pFFeRtcZVCu0C/EYshbP2NxBim+1O74Z4QCNTJefYvEBZdMHrxRZgOFI+Z6aRTkhu5XIf1GTCxoIzEI8Ab05c+1mGLjV4zHmuIFDjbhRTLdG7ap2ioxkk6B3HdKzEtMyKl11280RxQH0OpP8rP62OSF5RKtnmaQkiMZGFiNp/APJK7Xu+1KT+mdALMSA7byI0KmwdeKlY357Ep0YRYLjhgyNHqBwdLBTtA+u0NFSoiH66rDY9hN3Jq4+J8ihG3JIffV+n1AhkTUUwBWAhRWWtG/XsKjktI4cWH2486SLPZD8RDedwv1Xm+V+N8NZ/6JffMOuxTOGGA3Olm8rxebUp8xAAwLXBXcf8GrOugnfjqNf2eJOoV0/lA8sfk+Pz/2T6IdZ/CiAU3BOmFo3yZ4v1luye4MSGYtce3ap0Qcoe1xKSer3bOuhyDkIf9sVOSTi5t9ohXcCZlAsVKXUSo0K8UwFPpDJFkaHS5h66We7A7aTrKAo6E7/tSmZoOE5oZGC7k5TiJG7ENSufkW+BPRkzAB0TFiWA9pySARBOwAN4XFhFGTxIl8VgpR4CSRRFs0Ez+hAfAvXU5n0eHDsl/mzY4+k7Sy5RgEFPGna0FohdQDII+IsKHvWdqBQH2R+hpUcyicLEE/DQs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(19092799006)(4143699003)(56012099006)(10067099003)(11063799006)(261021121427099003)(261022105027099003)(261026140227099003)(261028144727099003)(261102123227099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6JfM9+W3gyhB/lyP7sN/CQEKZTrnuv1qrpxn/3MdlD98QhM9a538t4bFKkTX?=
 =?us-ascii?Q?d66keYT67mxvyRPGNSipfayzkivp03VEbgKq9ItX4nNLxlfOhr1KhRqjCZdi?=
 =?us-ascii?Q?T4G8aiTPwXfr5kRbx+6IzD+ktkDbING6lE8JArP0qYrgELnVQg2rqIrl7X3q?=
 =?us-ascii?Q?j6STdY6yM099ozbbsKcd4YgLVP2bl4JQa6pweh4ySz5M/hgLkd0qbZ0C1RHi?=
 =?us-ascii?Q?YLfzTWYVwaUo38edVgTIkoSApIKmnWZoKHjqtjIwO+efWKY73PleYMg57xth?=
 =?us-ascii?Q?ezBkqsX6fiDoo/VmiMH9CYFc5CUCF+uEtmujW/wNKYBDC5N7GBLfQAfkxo0/?=
 =?us-ascii?Q?6IrLNQ0RW27msyh1qvUATM+YYlEJEqvswLStMfHHTn3cAFAUJEF+YEkYK+qj?=
 =?us-ascii?Q?HOpfBW8NyaDbNZH3CAQjRDGoUg6JWL0ioT63lhXtQJiGjoA0nSMVyQUapMvl?=
 =?us-ascii?Q?Ho0JM+QpZTjQBFUxcQE/LJiKW+t87vMX1/FccR80cDhi29SLVLEhebeJPAoj?=
 =?us-ascii?Q?lv0mRDIyMy+ovUfW3YTVzwcCwZLanWYNgIxYhp6MQSvmIb0ctBZCouge5CNg?=
 =?us-ascii?Q?oJiMvuLAGgWsiExwptZL53v39n+jPTRQklEzBTwJslS+MoLa2zIFxadEIU4l?=
 =?us-ascii?Q?SkzyUkEC4ObiqOs/mcrRBLlEZwXdKLRIGsLa+qHR0ftQ1LPvSN8Kf8bviBgI?=
 =?us-ascii?Q?WFExzXZZG7yIldyUvgjwGNw4nkpCYC82G3Fc3WMYxSumvClmRQMqHQhV39rs?=
 =?us-ascii?Q?NURysQtZPP4YEsdswyYECYwYQCcuLIhA5KTUNcynREoPrsFP154xlQwbh9Bv?=
 =?us-ascii?Q?bLjFATZ0ikgDfRpWVmpfGCGcV4RzqDg5Yj1HoCGUmGl8TX+OYDKYXWgVEWLd?=
 =?us-ascii?Q?k6cQ85pbhDArhl/4Hr3kDqVZy8c5WQ1U0spwOeemI/sTavxFRs6hyFdl1MXE?=
 =?us-ascii?Q?GTK5JZb6tzysms+8PpWUtfF5FQ4oyFoRUd2Doqr2kSF3Z5T4XZuwV19V/8E8?=
 =?us-ascii?Q?EtcX8WGpabKLszK2t4OGR8ZCtTVxl3Z+lTz+WaHeT94v30nmyOK7Uu3SOQYF?=
 =?us-ascii?Q?oY9Lxnsw/j5oQ7XDhrYQFyNg8tA6VKy0mA576bdxthB7uwi5m0gqWlQRWfNS?=
 =?us-ascii?Q?ypzB3w+cvolFN6X+qmFjZkWXTICWT22+rvFTjivzFlbPxw7WVVLgIfu9waTK?=
 =?us-ascii?Q?xYncniyLH/1okTfly1S+vXPL7f0HO+/VShqeRA8dTvMs8IuBlwCvZ/hIMIxi?=
 =?us-ascii?Q?F8dmcFAkF5JgfTtcgR6y7JuZv13SvkOcS3vsNUH+xu4xlcn1QcXb4n5Bej9i?=
 =?us-ascii?Q?sXNcx2JexieYFzGY/M303GaL6GmSwhEnWSCRR7eP8ih98V9OBr3g5jZU04Cj?=
 =?us-ascii?Q?SlNJOXwpMUkh8F6LnH/sPVl+L3G7s7Q7b7WKyoJKZr38qmKzgwcEMdOze/qZ?=
 =?us-ascii?Q?dP1UEx5ggWRuPaaXLIHfwGqtOBfuHQylqyxRqgq9H7noCCjzoiJtFXw6OAtv?=
 =?us-ascii?Q?+mYph09wUdNHYepW0BtvaNPxgvEDnjpWr/AyhRp3zXQNxO0zUtixgxcRGEN+?=
 =?us-ascii?Q?XYQiJCCQnQrumoMVdBtbpYqr2zup87HNHHd00YD+BCFw2TaYwt2ZtnG9uxKP?=
 =?us-ascii?Q?apcCvLtwEFFm3PomTuXGPjb8aXL1jtvFW/qVD8bK1hlKBZlrkE/UM8LkFhly?=
 =?us-ascii?Q?r8svXX9ewN40xUQo06n6FxVvAIOyTxWvoqyGmG9VoNIkg/0THQWtKIITuE1E?=
 =?us-ascii?Q?Whjx6lRfERG8s3+reGOBiYhtBNFTsFjTmvH1zKu5Y1MojvtkrLMw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 889ee6de-ba5f-4963-d4c3-08df4a6ba04e
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 20:43:42.2102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HIVeMJ3JL5LGd61QyKZEuCTqQjMyjaZLHVq2fFJR1IfMwWVzkDnx0M4M0O9yr5/SJcy7Rs1YzBbMhrpt4Hx1LyDpuKuI2ndXWhbpn5Gk4AzVe39KEdHos17zXbB3CzkX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10275
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_124347_703492_E6A930E4 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 02:59:50AM +0000, Dineshkumar Parameswaran wrote:
> Hi Frank Li,
>
> This is not the new patch or feature. For the same feature addressing the comments. That's why created in the same thread. Are you willing to create new thread for this patch and ignore the old thread.

Avoid top post. that is kernel community email conversion. and wrap your
message.

Alway create new thread for new version.  Post to old thread will cause
problem for some tools. The b4 can auto detect old thread and put old
thread link in new post.

Please follow linux patch submit conversion.

Frank

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
