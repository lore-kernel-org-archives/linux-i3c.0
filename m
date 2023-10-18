Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3764CDB484
	for <linux-i3c@archiver.kernel.org>; Wed, 18 Oct 2023 16:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yIBQ/jPcyUExkrPpqDnZaMss0PKtL7sTh++g2rOIp3w=; b=0bRFA5Lo03ULw0
	1mipyiDrGiTEj9ISqkawgfhU2mrIjPUQ+BNtE8bC4XjQLD2zCxQIrrUVhSBNPDsGMLBC/OM6Ifkm3
	MJcEZbkbUUj10+rIseHPwZCpyf6zLx3bIam+/15NI7TUNgKouj3DHv49clCKnKyQcT3pkMuJ9shQO
	TAjRGlTcK7/wEjMznFe1jk7IYlkDzYo294lbx7WpsRoFFpFPC6HI4fylfq7Js9KZx22oLzHlsnX+T
	K6LPTj+DtXs3bKf3DsIvuWQ8fgYG/EC2xMvVAWUR3fzQ/8DV3tjhU7gup9pSYcPi+u5ujG04MEHia
	Z6M/J9YiPNYFLvkng2rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt8xm-00F7tI-1X;
	Wed, 18 Oct 2023 16:00:02 +0000
Received: from mail-he1eur04on0630.outbound.protection.outlook.com ([2a01:111:f400:fe0d::630] helo=EUR04-HE1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt8xj-00F7pR-2B
	for linux-i3c@lists.infradead.org;
	Wed, 18 Oct 2023 16:00:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kDV0hPtOlQJ+7rTJ0Gpm6ns48CC2s4UrF6W+7RRs98UWmqNWRVBCPN5M5zROTMIpB+P8Jej9F9scHoZiJuWCmB6dEUc5xsEyWZ3NsS8cCQ9ImIw2A9Ar2zQ+8b9WvhBalNtbecQSOUZt8SVVa89cjnVZd2wt6Pq9VMpdaRLHQbVz1eZabFC77MVcvum0WviwBcudD4jh6EIY9250tXZQ4rVJmaN2oKi93pVEXKrNnCVlnQeJWWsM1TAm3Kea4uIs87RxRwT7ASxB1h7APa5pGFi87qU5MzTPsW1xlRutMoDn4u2ys/jWZnljVjlfBuyAoHQ1bWWP/vQwqXVQi/kiEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRiKdLELnJRJ0nyk972LH2tykiePszc/EPeBiGyUew8=;
 b=CiUgteJwKCd3F4RhILwFl1gDX93Q3mr6BOnCg0Yh0O8SdxNvYc3BtB/uk12CYxpI+n8eRFvEl3Got8mdenYhAvMXL8cIG9lW9ZbqZq4Ti+8nZ97NjMPOKoxNDkQnk09YCG9dlLllczvkmg/2x8KqXD+rfZ+ThbJwfMR/ekgdidqVqSp9fxPs+5sPfS60sZK0oDPnU7Fz/FggvZSLtPB+afjtw/L6usdZtAQU83zcNxLKmF8ZSnI/Xupae06ViPPzhR+m5+i0gED3eM7LlmZ4O9PYNt2Ff4fesx5xXyHZky8WLkGT8c5LqhwW9H+Z7Z0d7d8niiPFEhY9TWY8GkVp+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRiKdLELnJRJ0nyk972LH2tykiePszc/EPeBiGyUew8=;
 b=eFQdEt20fjK6bS9B1YSbLwYZz9NOGOSEkaaaJJnYLLKbIi7Zt7HGN8pmlO85KAi3KjES/QkmKStkRyLdTDCOjwVprLIL/wEBoUsbDNP4GX63MbWt0iMDKDlrlxWBdMaHvwtxJNm2f8pmer9gDYEsQm4jL8skXfE+kZVpCw5uk2o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by AM7PR04MB6966.eurprd04.prod.outlook.com (2603:10a6:20b:109::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Wed, 18 Oct
 2023 15:59:56 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2%4]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 15:59:56 +0000
From: Frank Li <Frank.Li@nxp.com>
To: miquel.raynal@bootlin.com
Cc: Frank.Li@nxp.com,
	alexandre.belloni@bootlin.com,
	conor.culhane@silvaco.com,
	imx@lists.linux.dev,
	joe@perches.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 Resent 5/6] i3c: master: svc: fix SDA keep low when polling IBIWON timeout happen
Date: Wed, 18 Oct 2023 11:59:25 -0400
Message-Id: <20231018155926.3305476-6-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231018155926.3305476-1-Frank.Li@nxp.com>
References: <20231018155926.3305476-1-Frank.Li@nxp.com>
X-ClientProxiedBy: SJ0PR05CA0210.namprd05.prod.outlook.com
 (2603:10b6:a03:330::35) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|AM7PR04MB6966:EE_
X-MS-Office365-Filtering-Correlation-Id: be53f2c2-92ae-46d9-09d0-08dbcff345c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EXo3zhscrBsauzK+Q6NamX0iK2PYI6J9S34Qe/JVPL9UuBPA/dCQ+DClA3fy8oUu6Q5ZpH8TAm5qkgFBI/MjThtsFGT9NgQJ4HaiqOukAkpi89myIRxlOVaMwR4OGV/9Cd9vMuIzmwFLxTsOrxN4iKrU+bLD5pCWmaMC9bgOGq7PE7InIJyhYaCrqDBBLU/LidnzlnJL5W40iJH/G08gl0/xxtEvtyh4J3ZN9b/ZdZp/sSdeMa0DeeOf5vUAf1ztUf7MLJ42Z/rZjJAIF4fHg4HmgVq74+setNO4qVwxFWHKn8DXOchRh8L4toAD3pSOgSfj9C/5+q85oxqEmta408hpuqpd1o22FFGr8xxf09trXiE4ySxZAXOiIlAgYfDbr0q1wyoyDGEWL9hehjdyf40XyNz5Ger8A0f8W/vsZE+x7XX0m5B0ad0ejALxwORQskYgInmZXgNHfM92c+e3sCZujYLkUERcKS/49QPmtZJ+oorE2BChRriZbRAJGAwxXvA91159rkZjMmgnq5F8W0LPiHoeXnyuT5lNfq80WOA3zfcatlXGjndci6hIBe5qyJLS6ma2UY+/vKwjJ4AH+07i84oyAItvCaSV38REvNF8E2IiUkQd0aRNEQGYSQvH
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(376002)(396003)(136003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(2906002)(4744005)(478600001)(6486002)(6666004)(38100700002)(8936002)(5660300002)(8676002)(66556008)(4326008)(66946007)(316002)(36756003)(66476007)(6916009)(86362001)(41300700001)(6512007)(52116002)(1076003)(6506007)(2616005)(26005)(38350700005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ydFHcasc5LkaRtZsorlH9V8tXLhyh5C0pkl3Ea4K1d52XeEi40BCZrzkMg3t?=
 =?us-ascii?Q?F0h50ulivUlvvHtm0A/qa4Zi/g43iwMBtSicz8nSpwO7jpTUGo9/jngU8PbB?=
 =?us-ascii?Q?mRZRl6N+cMMBTyLQCNN4ss7sF25vH/BtTYVd82oHGXwN5MKPc+jCwhjvmarQ?=
 =?us-ascii?Q?Rw9wAtl+KsASbQNJJvukOhdcnfXOSQKVtf7o/epo42MTaM3MdDsQRISnG3bj?=
 =?us-ascii?Q?zprMw7++irxeLUkBCvfXh87m/4NObN6tao3exOc0WirsyrDdIKKqdh12mWic?=
 =?us-ascii?Q?b9iNxkOYlBn4D6LH9WERyruXzw/7NHaul9PKRfVp4S9t+SizNsgPKHKlqMxD?=
 =?us-ascii?Q?fGhPKT5UWQwD7E6aV7MDbWxfmMPuYo9trHAJYVTpogsuIEk9USOn+zIsSx4G?=
 =?us-ascii?Q?6wy0nf08opPyIXXtzBmFvp42TX7BZttlAnqURE5g+OQwiUtFfIoAVeVwgvud?=
 =?us-ascii?Q?11+kbMqbvl1pZ2hUjRsoGSJSst5KWHn4Qutw1dOQuI93Nt6k/sPENU2QxTvP?=
 =?us-ascii?Q?mCq9vEdSTqXkprsuucRKb/WGe7QShL6A8EkpFIRYEq+18TpVECLCk9Obon3z?=
 =?us-ascii?Q?gBF8Yu41i7KjtMn+ygEt+siMoUSl8LHhol/21hbdB7G0RJvuP9jJ7HK4kfxo?=
 =?us-ascii?Q?QNVUIihcOnz+63KfLYqbhfC/n8/JsotLoDgslPKhCdHUQf0a0Vt7oFPf4TqL?=
 =?us-ascii?Q?gf7kUTJMnyoCpv7ABAa19F7OwVgO2WUP3XSDS9kCKhRHkzNuFrW+z553nNZV?=
 =?us-ascii?Q?Ud7HIkg8gtUUZ1onVwlH1EkbY7Ce8TZNHbf2CYe3Cfso1cfeOuXBQsM1A7VK?=
 =?us-ascii?Q?4DzoML10tHsWGlIWWHDoblPcEeZWrJYIXYNrgrMojCwbYOuhr6tYGT2h0GNE?=
 =?us-ascii?Q?pRxAWp2hqj0ojpQv6xJdMRc9p+qXGITY8Fh7qYm10ZuuXpyWQOe01D/a0YuP?=
 =?us-ascii?Q?QkGUkwtldRe2GNOe4T3V4zMW0fsrXmrgamMpzWCBjSNF0qlNmTbhKsDQ23ZA?=
 =?us-ascii?Q?nq2kqwOCWExwktoSYVvWAAS7Q6rKDoiS5YHGHGoHoc2XCuhCOojHnvUwRctF?=
 =?us-ascii?Q?Lerts9j/QZKSHt+28h9zsDKMq2f5XrB/GIup282wcAD2tg5IcdKr69D8Sxgf?=
 =?us-ascii?Q?YjmVdrs6mZBHfmIN4y+4xjtb2OWTsY991nbhLWv1r6IBlCOktFkPOkr7oIt4?=
 =?us-ascii?Q?ghi43gLgpGElQPZ3YY0dN22l+Wc0fM73rwVlTw5DcLGA1cp5XEGzwjB0S7D3?=
 =?us-ascii?Q?LbHBh+cpTGTUoHcjHN2yMnnBwl7Zr3CqXfN8x1lGAnKZunWeIDSEXCke1zRh?=
 =?us-ascii?Q?t0fr/RNvyJXapmYYHRjhraRdW73bawQlsQEfWe3tvCN5ReVNfCi+nOm4UNJd?=
 =?us-ascii?Q?AXyq75mqxWjKlnFdsKQ03DIs2spWSuTRgTTZxJEnQpJB3ausTYOO6SVdMCrx?=
 =?us-ascii?Q?8LQH4xMM7C/fZbScEAjd6010/BmWvQLa9eAteGO0jE8o9KXHuHINuLnh2MbQ?=
 =?us-ascii?Q?Q6IXPXh24/kOHUOeCA9DhQmkYb913lxSto5fcawqEGlICobyQMUMMcna9FTn?=
 =?us-ascii?Q?R5ZSZdFOU2pvYDMNGhjEU0LJCdYloAs8MFquLCli?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be53f2c2-92ae-46d9-09d0-08dbcff345c8
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 15:59:56.1138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zDJOlxiKPeawwY6QwaXrSwjINlntWoxxPVSVO7Nyz5rz3QjUEdkFE+4P+ujUoyJIJXj/2Vro+TmN4LRVJ7TANw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6966
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_085959_713645_53263A71 
X-CRM114-Status: UNSURE (   8.24  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

If IBIWON timeout happen, SDA line will always keep low because miss emit
stop.

Call svc_i3c_master_emit_stop() to let i3c bus come back to idle statue
when IBIWON timeout happen.

Fixes: dd3c52846d59 ("i3c: master: svc: Add Silvaco I3C master driver")
Cc: stable@vger.kernel.org
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---

Notes:
    Change from v1 to v2
    - Update commite message

 drivers/i3c/master/svc-i3c-master.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index b113460f059c3..1a57fdebaa26d 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -404,6 +404,7 @@ static void svc_i3c_master_ibi_work(struct work_struct *work)
 					 SVC_I3C_MSTATUS_IBIWON(val), 0, 1000);
 	if (ret) {
 		dev_err(master->dev, "Timeout when polling for IBIWON\n");
+		svc_i3c_master_emit_stop(master);
 		goto reenable_ibis;
 	}
 
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
