Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA223C4345F
	for <linux-i3c@archiver.kernel.org>; Wed, 24 Apr 2024 19:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nnfacBlAfRLrvgYIYKk0cOK8obZ7m+3yGdajoJq+RyE=; b=cmOlFTpLUGxuc+
	OavIyJe59EdmeDFiCwk8oe1MiBIZ7tXxdrKMA1cqTjuTkNsqzsOm+oQ+1jpYKSIstkyQotLlEcNjM
	ghD0LAtZhEm1/g/G4mMNzAGWzWOpzol8WclGyDHiZChpwyElCMiRk/bmqDEV3d3/lizydT/6WDV/A
	IpXM8oclpQAxOP2OmdPDhVS6RTkMZOqFQ/0to4IT9IvuKfRAVFYnfZUEU7M4U/kP/yusfHjTCgCad
	1LYK3y1uOGGbV7E9hXTvU/0oIkxCdI1hp2Oup1GK62uv8nA6T8Yevu3j7vOppio1qnLgxeSanwb8r
	c4azqpSKWAAyGuPQ35rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzhrZ-00000005X4P-2m0B;
	Wed, 24 Apr 2024 19:01:01 +0000
Received: from mail-am6eur05on20601.outbound.protection.outlook.com ([2a01:111:f403:2612::601] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzhrW-00000005X1m-2SNv
	for linux-i3c@lists.infradead.org;
	Wed, 24 Apr 2024 19:00:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NZcjHFW5Wi+BURFylKCzZ/clDcYoXTLJKXC0x78a6dQeTvK9SNBjwCVS8ssfAfIh4PzIfoSuxw4UD4BP3zuwkOpxmYB93u2gvgCI2vBkiNv6xAPkcsuR9jpY8HoUURMKohittOSO/dJQL03/IrCmZ+Zy85JZdMOaMEWVRG3D9AGy5n1zhOW5HbsXgvvQd+AJswLa18vtZYNk7HEtV6TBfdwzlCgwUntBIIE7KM7nAMTZBk/5gP5g080aWV8G5ZUW/yAtN/swi2YJ4tkgRC5OPKee6vEcMlqwx773UVuDmzv9nlPcwAr22SkrZTFBbWlUB8vag6rov/RdU1kQ87jDZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s2UfnR2JpnWpluYB46qe3wZ9n+QawI/2Ohezc57zk+0=;
 b=Y31Qm2dMRSoPCi33NZyOZymQxN0G3PyDd/yZek0Un0HQFx6HuAi4bOLQjKob9NPFz9vbTUA+dEFbrtsH9LOVonWPX7RFtsy6LkKFbSf/8N+lupxvJv6LXOdOFmwSO4gtg7z4usKhfFS/214bADXjDxAFAhfr7VvVcsABLteiSSX+EAEsKWmeTXvkY4YQ0peDAuO2FOsZ40QDkW+XyXR18/ljlIkxIEmOOug6yg3OwQ1IMx3uzdSBkwMjplkZ9vkzhLhdiQXzS04N/uzTUPfx7lnXirAEhpPkvC1OMR4Br8j8G6RdRG/L0W2IMHzoKfN5IylSlk1VozfJrWWpOnVjOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s2UfnR2JpnWpluYB46qe3wZ9n+QawI/2Ohezc57zk+0=;
 b=r6Uasnqa7RQ8s3lWh0Cz0J11tpfdNyN7Dz4RumquibMbMn/ljWgNDkOvaYqK4HKYDEUkZnuCimYHY6F8ZTg1iXBntEPuAFERXeP7PCXubumRyX6xv8rThj583fIQf3gEPCfScopYA4lgLXOB3FnHTOB/4c3vbD/cTcTXzFNS+fA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8617.eurprd04.prod.outlook.com (2603:10a6:20b:438::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Wed, 24 Apr
 2024 19:00:48 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::1e67:dfc9:d0c1:fe58]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::1e67:dfc9:d0c1:fe58%7]) with mapi id 15.20.7472.044; Wed, 24 Apr 2024
 19:00:48 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Culhane <conor.culhane@silvaco.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org (moderated list:SILVACO I3C DUAL-ROLE MASTER),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/2] i3c: master: svc: change ENXIO to EAGAIN when IBI occurs during start frame
Date: Wed, 24 Apr 2024 15:00:29 -0400
Message-Id: <20240424190030.857632-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: BY3PR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:a03:217::7) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8617:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e1ef884-1b0a-45e0-4cdf-08dc6490da75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007|52116005|38350700005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?J7IOojdnNV+Kl/EZQwN+Mo6flOfX4YdRtQ7c33lwGFQs/PfxE9aCivSZTtZD?=
 =?us-ascii?Q?+MLCKAgk698yDum061xh9q9e/6p4k1rxky9PK9s2E2AHY29oQZJRrR9Toz/W?=
 =?us-ascii?Q?dAENW6NHTF7MW1k/z/lgSrUyujpqmYHWWaPEI7NOBa4qLiwFY+09J6Oj89h3?=
 =?us-ascii?Q?axVoEKNreR7SG4Oy+ckRf2o6dQSt+0i7C8MOQXElwnExrp7BuuQ85SvOe3a/?=
 =?us-ascii?Q?w/hH0CDtZeJ6HtH8WJudUfgjw0cp0yPmBufBYtaF9rpglDw0B+0JfpCsRXoT?=
 =?us-ascii?Q?fV6AJ3Tk2vD6wz4ilO7dSqEzpDtj7hs4uJ6BfDP3QMZbjyYFHgBrtryFp/oS?=
 =?us-ascii?Q?aVEVBd/7iOwb3yH49qzMDWe0c6OK/aXAfRuy1uoAgKVNvKfOH3WiAVqAJL3y?=
 =?us-ascii?Q?gSYHiAitunSmxoVqvvOrIo3LfxQVBTU7xIPMTQNrgvfi/iVvUyzF4dJc2Qx2?=
 =?us-ascii?Q?aB8lI6dwT8USd2r2IqI2B3586P1mkKx/5uyF8zLtGXbc3evplEfDzU3Gb5a7?=
 =?us-ascii?Q?b9MTaFabKO5QIV+PJoPzMu4s5lzhOK96tpNaciZxaRWhgGre0vkGNVbOSMsk?=
 =?us-ascii?Q?/l8n+ZQ+gTtbu2c9hzvDe5fzp/+x+O7rCVUfVlL+qAXVd4snwDrS2bUgrSUf?=
 =?us-ascii?Q?Lf07Jv4X2yPD1mJLaslWGuhwwsLDH8VeP9FtJSUth7/Suys513iFlTsQbltR?=
 =?us-ascii?Q?VDKnp4kd6IBpBr7wtdaTPb8ZuhVO17gDI0Mc2HKYcP48gUK7L8Vdsx50Qpfl?=
 =?us-ascii?Q?w7SuKh6g5FY/2gnC93la1XZ9H4TMR11n22fXQyHqyxB6yyboJeKCjxotSLpM?=
 =?us-ascii?Q?NPjqBi5RLAa+2Z6jLxRBvX9BvGReqSyIM7nX9+UV1cGXKzuqffly0v298GiG?=
 =?us-ascii?Q?xgDx6GCv3vDkdBWMn7aFomT1/wauGjB44XmIlgZ/mR4vo5lrwdeXOEIA8FCV?=
 =?us-ascii?Q?EgiydDZEcFiPRhJIMXwfblqfd+2f+zeDd6vBAJbPN6pH2GhpNXJ/1CkiM7vS?=
 =?us-ascii?Q?Q5rk7CadhOKhgwKsTYxBZtC24LNj/aiEkdzqCf9qJ0t5LOr9k5fHgCo5KG1H?=
 =?us-ascii?Q?a1iwQJ44g3fgsTDWcUgNYXQbmQ9Xp8p6aawitLliEobRiYD7XyYGOGxWegx5?=
 =?us-ascii?Q?UbqWkEjNbWg/dwyrtjoeb4KfGcl5+H215VdEyNqZCHtxBLYBCsQh9aLmOXgO?=
 =?us-ascii?Q?KykMp6w2enrAhSo98vU2Ad49lGVx4NuepH72rcIxmmUVH5yEAkP2FYHIO8Ax?=
 =?us-ascii?Q?DLjY6Wxd4N4w4rKM00tmBLnKpIxu0xEKku6a5k3/tdZtgj4Xel0oLi6NoRDh?=
 =?us-ascii?Q?3pxVHt02dJuitavk8WZOm0qrTWy1Tmljk5BQ/90HZRZLCQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(52116005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A/CX55deS69WDcQgQZdGSZwH24cRQWry29QelLy05gRZAPjuN/NTMAYYUNXb?=
 =?us-ascii?Q?1dJP1KylTHSLlDnF15Q+FSjKEDJvusxPnzshey2inbOHo8Stqurlr4m8Lly0?=
 =?us-ascii?Q?bj7vU6/AEI5oXh+nZkgGxYYjwtIAOsJAx8n6BH0N3ZMRX/YAnjL+K306/jIf?=
 =?us-ascii?Q?dqQsa3LiSBDZ65ZGAMdWQ7fM97CLmAHYLsgo0xpSfHuth9hQ3tk1rBYwd626?=
 =?us-ascii?Q?Z72Db7y8RKMr2pWB6Slukqi258gkCkbE49hyDnqeKRsV7KIJxO3g+PLL8o4M?=
 =?us-ascii?Q?ysNRWhGBVdhRt1rgfAiolXBc+TLo+LRucBbuFenlSGSHQdlil3LxSPOMk904?=
 =?us-ascii?Q?0G5AEDRRg8VYVrg5wCsL4u/ppnyQJXUZwNMdjj5E9BcoGBw9S2bJXQdw324e?=
 =?us-ascii?Q?QJMMNy8NLMO76/xNZarsbMHnlkozDLF7j3T0OUKXeXzrAwGHAeDzolJmKd+A?=
 =?us-ascii?Q?vtOI39R0bm5pFA0I8YcEsqOS40HTuhDERoLMG+4IzkuWCPanBkVGxcgyjgbh?=
 =?us-ascii?Q?/YhjgqyhvSafML26eG/X4fqp5M25S/OtapSgu4b1DO5lxQ8nt1SZH5hflTzw?=
 =?us-ascii?Q?qOyH95JpjKXX2mIRePKgLT5x3prTXnLySgaBlFNvvCdgIcDTz7O4Z2NTynfc?=
 =?us-ascii?Q?MBVtp7atZjj+VBF+kAEVURiOXK+dRdSFfy5FQLQgRRTG1jTuZG5YZ9AdMB+x?=
 =?us-ascii?Q?arhMZJFYWAizGKOjMk8vb7LkeT447clfmRn5zp/zGsxdCL4d7KLEU+zAbiM6?=
 =?us-ascii?Q?WoMNkk/QSrgCy+zY0s2dCBlWbww0Q0SAHFE6TQ7LNWqyB+BYhNFvVQteRto2?=
 =?us-ascii?Q?zaEVEm4RUpxdePqrfRZkLmhGUXnRV5QX3PlhE2zChLOBXuu8yNRXWLC3QTa/?=
 =?us-ascii?Q?mIDu+NVYqedcxxlYrAXD21TATssSkvGzedNFoGuJZBtcvz3+WUXlr2PMdEoA?=
 =?us-ascii?Q?GMCFnl+YA5eM+CFtZanNgl6vjcxKgEZWCvEnmkmBLjeohJH2ydNvevbhGS1M?=
 =?us-ascii?Q?SLROpCcNLdt6Ia83bN9QrBPko+3siUgcMTY2vcSW9rzl5B1ayVIzn+Am/KJK?=
 =?us-ascii?Q?vE47B3j6yPwwmwDaDUzrgXJfOtcRJY9s/aBh77/9FU84cuVpVSVELj6Rgekc?=
 =?us-ascii?Q?2FICZYiKYaM7AsiGOV37+OlPWTOJ/6MUVkyBWOLNa/cDjFWxAiULCxR2pDc5?=
 =?us-ascii?Q?JYT9FSW7HnrDooX3/cx+A7WuvuzimMuvUwVTak4O0Qqh7oM53wZZItMtF+xq?=
 =?us-ascii?Q?gAUDYSBheX+I0Q7ewNYx49JoWGTGI7ljl5qpDNPTgbNRxnSkc8wgISdbQ7qH?=
 =?us-ascii?Q?CHd+MzH/coLuI1HrYVfcPxOlqiHb4i8bZCtV9GInXmMbc54fyZdH5NWJVi3F?=
 =?us-ascii?Q?oDJSGqWhyCevjTSt2px2v+4Y0gfUAuZocpgKVYu+UyKgorew4F85LD6mcPjk?=
 =?us-ascii?Q?zgvLlm9RatiX7t6GNJm0cFdWvIJUOkd1lDbO2b2thcsr2uktTAWtafBMaYLA?=
 =?us-ascii?Q?fZhCUBfIW96uJZvK7xmcoxeMPSfi4Lq+Z9O39rPZ9fSGfGsc1QGIxX4A7gjM?=
 =?us-ascii?Q?JVAStR3mR5kn3HbjUOnPquhiArJJl6ySMY8XxO2e?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e1ef884-1b0a-45e0-4cdf-08dc6490da75
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 19:00:48.6146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g3L2tkAm3k5wlCTNG3fYQMaVuoGz9Eq47Lyp20/Ssnj7401pUAweEglg9lM5UpK0D/QU1JBu4TktPaQ5Y3Ngdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8617
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_120058_728579_DFC8FCF9 
X-CRM114-Status: GOOD (  10.91  )
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

svc_i3c_master_xfer() returns error ENXIO if an In-Band Interrupt (IBI)
occurs when the host starts the frame.

Change error code to EAGAIN to inform the client driver that this
situation has occurred and to try again sometime later.

Fixes: 5e5e3c92e748 ("i3c: master: svc: fix wrong data return when IBI happen during start frame")
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/i3c/master/svc-i3c-master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 5ee4db68988e2..a2298ab460a37 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -1080,7 +1080,7 @@ static int svc_i3c_master_xfer(struct svc_i3c_master *master,
 	 * and yield the above events handler.
 	 */
 	if (SVC_I3C_MSTATUS_IBIWON(reg)) {
-		ret = -ENXIO;
+		ret = -EAGAIN;
 		*actual_len = 0;
 		goto emit_stop;
 	}
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
