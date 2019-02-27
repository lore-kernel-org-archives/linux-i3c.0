Return-Path: <SRS0=zb1T=RC=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AB43C43381
	for <linux-i3c@archiver.kernel.org>; Wed, 27 Feb 2019 18:38:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A5492183F
	for <linux-i3c@archiver.kernel.org>; Wed, 27 Feb 2019 18:38:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KfzQBpg0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="F5WRnBig";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="Nss8svf3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A5492183F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qu2TLGrHLK4qfxnK13H5YLEqGV8YqX6fkwSINqd5/Z4=; b=KfzQBpg0A3FFGV
	U2/9LLxwU9npi7wGWcU8ZFU+cudsQbidVk7VN9kRJIbRr0aFfeZprS9tLn4sqVAoaUTSrgdJZ0kvr
	9PPPb9hCQ/GWv0ajutlPq2/Tsv7GZ4NWtB0gttUNHB6J4qP2aeDhWd6nR9t7gNxiKyEV9v5AQnwzv
	UQiKx+wXG5dhrRyZFTKJMG0/4uQBYHFPa8x3lagzvCbNhTNummKXIk0byURcQ/iEiM7TIy6K691ud
	KKBktrvpusco+fN9ZuN2BUoAm7rhhMKtHLAkO10JghGiEPQSlCPMjImwDAEeye3xGGzwKHr14I4cH
	fVkQoPJkLpM1ddfcLenw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gz461-0006Mv-Kp; Wed, 27 Feb 2019 18:38:21 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gz45x-0006LO-Rs
 for linux-i3c@lists.infradead.org; Wed, 27 Feb 2019 18:38:20 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1RITiWA012624; Wed, 27 Feb 2019 10:38:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=+JSFMwcfmr50M3wJ7f4WptR5F6HEeH3hMyURqQGvdeM=;
 b=F5WRnBigWh44cWkOJsqcwpkSmIi951hH4WG8ZxOENiSbwbeFlu9m8TpS9Cw3XfZbdwyb
 wyk4pO/VhIj9xmKyLhddIse5QYGcQxP2ji69lOrksAl0FkHJl1QHyxQPII0I3Ygm52zq
 itvcO0IDD8gGbW8lqV7BaDIKrHuINPY6o1BLEVOZrNRpIrfelLEqIjK/pXstKrKYz66Y
 gcMJARhFGdM2GlUDtLe7Id70da57UNRJtT3SeHLRCKzWsZft3YI0+47+er29IYoHxbyF
 WTrr3ZPrbnK3eA7KlzDsyMHkMPq6J/96wMhhDYjvOMq0eXW28bc2DdzYyTVXoyOqxsz4 HA== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam03-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam03lp2057.outbound.protection.outlook.com [104.47.41.57])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2qw2yrqwwt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 27 Feb 2019 10:38:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+JSFMwcfmr50M3wJ7f4WptR5F6HEeH3hMyURqQGvdeM=;
 b=Nss8svf3cUuflytsha3+sOBmXnVfF4iCPgnXyLwkLXkVrunMPv+jAUt5nezE/UlzeHR5vzfHZeoUMMOuqh5Fh7fHSZUHiTToapr71wm3MfanwZxBnAfvnCPdtMWsbqgZc38ymzK1bQlkk/QQq/4FHq3Uw5zN44Q9L+MDKkXdPcI=
Received: from BYAPR07CA0062.namprd07.prod.outlook.com (2603:10b6:a03:60::39)
 by DM3PR07MB2250.namprd07.prod.outlook.com (2a01:111:e400:c460::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1643.15; Wed, 27 Feb
 2019 18:38:13 +0000
Received: from DM3NAM05FT008.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e51::204) by BYAPR07CA0062.outlook.office365.com
 (2603:10b6:a03:60::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1643.16 via Frontend
 Transport; Wed, 27 Feb 2019 18:38:12 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 199.43.4.28 as permitted sender)
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 DM3NAM05FT008.mail.protection.outlook.com (10.152.98.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1686.5 via Frontend Transport; Wed, 27 Feb 2019 18:38:12 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 x1RIc5n8029387
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Wed, 27 Feb 2019 13:38:10 -0500
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Wed, 27 Feb 2019 19:38:05 +0100
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Wed, 27 Feb 2019 19:38:00 +0100
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x1RIbxWT016066;
 Wed, 27 Feb 2019 18:37:59 GMT
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x1RIbxGi016065;
 Wed, 27 Feb 2019 18:37:59 GMT
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v3 2/4] i3c: master: cdns: Drop support for I2C 10 bit
 addresing in Cadence I3C master
Date: Wed, 27 Feb 2019 18:37:48 +0000
Message-ID: <20190227183750.15367-3-pgaj@cadence.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20190227183750.15367-1-pgaj@cadence.com>
References: <20190227183750.15367-1-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(376002)(39860400002)(346002)(136003)(2980300002)(199004)(189003)(36092001)(36756003)(42186006)(76176011)(14444005)(5024004)(69596002)(86362001)(1076003)(87636003)(26826003)(316002)(51416003)(50466002)(53936002)(68736007)(47776003)(6666004)(356004)(48376002)(54906003)(4326008)(305945005)(16586007)(2906002)(107886003)(2351001)(50226002)(5660300002)(486006)(6916009)(476003)(81166006)(126002)(81156014)(478600001)(8676002)(186003)(97736004)(26005)(426003)(2616005)(336012)(11346002)(446003)(106466001)(8936002)(105596002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM3PR07MB2250; H:rmmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fef89434-32c3-4871-f548-08d69ce2ba62
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060);
 SRVR:DM3PR07MB2250; 
X-MS-TrafficTypeDiagnostic: DM3PR07MB2250:
X-Microsoft-Exchange-Diagnostics: 1; DM3PR07MB2250;
 20:PJ7r5QU/9cNm3WgFeR8n96oX4ZiToxQntwcHYej+kt98+q1Y/+bUMV6M9/bTFMDBYLCe2BLyrrdRdC+USlDpRYfmSkxMvQLRWc4daFbfzONMBZ1RdQHeagKNaVqEBg0r4DiNA+UV9PMTwGJWAP+CBazMcLLjzh/7KQX8hB0psB1x+ZOzf4oomyBR0MVuGbceSR0kG2sbS58aWXZQQ/sBRhgCta5GmfuCQ/LK46+A7mg2cZJL1XGSiD1Kak+6496K5eo6mF4eaUmZ+oocglN0RebBvNdRWFmzM1b6GXbBZ4M+fUYW27oqJSpIgOzsVWS9Rwx6AwbY28yDhGt50h+i5IO8WvmiL8QiE7m0WUEJ6oGnFl++OPIMGqKOGpZT2vpUSTPMkaxd8Bejg1jxzUpEbifAKo7p8cMyIejgKgdtVn5n+2Mm5SlWP9k24fFoVVY7DnxCZmyi/xpovsOhjbfGdOS1tMHgafMuJvkYdxr+qDiMkOmrX+AZBPdfj/MWEogS
X-Microsoft-Antispam-PRVS: <DM3PR07MB225014279F3E332B7ABE851DC2740@DM3PR07MB2250.namprd07.prod.outlook.com>
X-Forefront-PRVS: 0961DF5286
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM3PR07MB2250;
 23:wd9kSVqOAhyz6k1yewaJLbvXCz+e32UmTnISP1mZy?=
 =?us-ascii?Q?bZs3p8qB9PUde/jfDa4fBLZQIa0NH2NQklCeuusCXohYKIqcaGRpKYzdaJwG?=
 =?us-ascii?Q?nInVlLlhEu9Vtc1tsTstAsipdA7U2n86b9NLi8MjZuaOgHKh48aSnhV9DOxG?=
 =?us-ascii?Q?lQqDyfUSd4W5Ye7IWEPkcclebrEya/t6z9i6dv8/jobcEDCWX1zBgE3+2nQx?=
 =?us-ascii?Q?TRYFqxnI4E1Yjv1MQBLjf1C7auAM/YeHZ/Ol0o6qmWcl7O4H5s98CT7vW9qU?=
 =?us-ascii?Q?k7DwmImnUpOtUGZ4SguPcx0jFiwbJIPEpnSfqiRnE/Gv0HQrzeWu4BklQrAD?=
 =?us-ascii?Q?eQWcNfLHC4fwDwkkshZthPpcq+P0ssXP/rPVRC2gjs1O6dV5whNjlG/7NUug?=
 =?us-ascii?Q?xeTAO8cGyvrpYkCsPdPCwuulaGDjgKPlj76fCzV7yW6PqRS5UI81bhVps4om?=
 =?us-ascii?Q?n4lPEfE9XU+3mJNeQ3taM7wavfns/44cLQvJKD/W+FeOUV7l/IXPIpYlLfnO?=
 =?us-ascii?Q?II82uH2cXU3P4bR4IlstvR29vCvcONV9dvjwiAVGIlXuWa0GWd3+qPVkP4kE?=
 =?us-ascii?Q?xK0VwBo3IO3GbkJkLUqOeEAQwTyqC7w9KQ4eAACJn3C4hPVx2h4UOjwvEHjb?=
 =?us-ascii?Q?d3pCEOrk3ki+ZGqDiUY+qDyqw7Y0N3BWLqayZIPtbb1yibYA5DU0f03vTpoN?=
 =?us-ascii?Q?4o0tA6TEgnvN/08+BuR6r/U5MN/OlDDvntAut83F6p8AhAxsl9pxnTjflLGT?=
 =?us-ascii?Q?kfXLqd4tWo1Y9WWwBWtPLcRcp5MTipG4QjMGU5hGDy5uUOHrtkoZloQObH/o?=
 =?us-ascii?Q?pZKrvIE1N/u14kIhzXmCeKwmAbts3Msdwz27iE5Q7MlFfNx4OA/w2SOHImWb?=
 =?us-ascii?Q?E4wxBp3kUoMOoH/8MCr4GFslqVe3XCCG0OSdlnU9E2oFgUHh8jayOzyDvM4J?=
 =?us-ascii?Q?JO6BhwMwByS8A+sUg4JjuCDbgPjVfI/gL3LVJw5+kzJvU7n2/mISEC1wAvzB?=
 =?us-ascii?Q?vL8mD6KbcfiCvSTXUbj/MtAN7gNFZb1B9ouEpWAlm5Yb3i9lnrzug/3/SlRX?=
 =?us-ascii?Q?Q+WFdTOadvQdrvhG5udOsE+D/wfSFOysxgCIJZ1yBhsiezjSw/MQo3jgotuM?=
 =?us-ascii?Q?prDOrJHIvlui5pdZxyo2Su2T1jLM0O6yTk/UtnRpHy6TYhyROgh0Vm2ckjs1?=
 =?us-ascii?Q?5EPEHtfEKsn7fEUiTpURR1irBQoPgo3/dXEcDB1pXGINc8sAGFKlTBKkF0yq?=
 =?us-ascii?Q?aserBfYCzrWuFAi43w=3D?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: gH7JT6XG99gPO2zrFw2h86Ytv5/6EC2ecqIY9JsNHyvqPl2ttWHYjnOixxp/bpqdOlQ5IUt+OwglrsEB1t1CqxUgTjYXJ14wfNMY4P6p2q7Z5oscexLhYEaFk7a8NV2TS7jtEam5BQysdzZCcqUhLKjNJuvRdIDoGRYFp1NPxa0322nWLilc5EzgN0XQmbdtQOQxbu664D26rs/JjnvzSr61U5Er6LluHy6MFccOYhJLm6FxU+9MriRFDHncG1jpM7N2F6ZJWNQcLncvvC+d0c5Uh9A2gez7W6z+K95SrdGsfqon2EsFMCoJWVEbFScolR9QXG7kL4m6iVyqUDPoV4BDZniGfTMQd5Y2WVjiYgyCCr3PjxxDmUFDSu8snllaRl/OgtGLwVH5VxEq3/jnOAq9K7equt5BS1GJF+v5J1U=
X-Microsoft-Exchange-Diagnostics: 1; DM3PR07MB2250;
 20:Dd45vqgJR395OUhsDzaGhexK2Uwc2aWmd0r/Pn3OIqJRwtlAYKtE8yuk204Yl1s/bDiex2cJKqlvQM3WDJBIVTu6Nr7UJkp7M6YzYPkwL1O7TtMRHvlbuqSYJZUA4f0heEmTW8iteYTrkCPKDtVjKHlFLatDHxxhmh8f37n4cu7WIVu9deaDrKvUf0VQLKqdb5sCQuVEJh7ZUt849GWlz8HtSRdNGWZInciey4BXQKQwD9zLP8W8kbp9Yb5uLHuR
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2019 18:38:12.0261 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fef89434-32c3-4871-f548-08d69ce2ba62
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.28];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR07MB2250
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:_spf.salesforce.com
 include:mktomail.com
 include:spf-0014ca01.pphosted.com include:spf.protection.outlook.com
 include:auth.msgapp.com include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-27_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=634 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902270125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190227_103818_029636_30D16E9D 
X-CRM114-Status: GOOD (  11.48  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org, Przemyslaw Gaj <pgaj@cadence.com>,
 rafalc@cadence.com, vitor.soares@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Because this patch series dropped support for 10 bit I2C devices, support is
also dropped in Cadence I3C master driver.

Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>

---

Main changes between v2 and v3 are:
- Remove i2c_funcs() hook implementation.
---
 drivers/i3c/master/i3c-master-cdns.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index 8889a4f..237f24a 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -864,11 +864,6 @@ static int cdns_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
 	return ret;
 }
 
-static u32 cdns_i3c_master_i2c_funcs(struct i3c_master_controller *m)
-{
-	return I2C_FUNC_SMBUS_EMUL | I2C_FUNC_I2C | I2C_FUNC_10BIT_ADDR;
-}
-
 struct cdns_i3c_i2c_dev_data {
 	u16 id;
 	s16 ibi;
@@ -1010,9 +1005,7 @@ static int cdns_i3c_master_attach_i2c_dev(struct i2c_dev_desc *dev)
 	master->free_rr_slots &= ~BIT(slot);
 	i2c_dev_set_master_data(dev, data);
 
-	writel(prepare_rr0_dev_address(dev->boardinfo->base.addr) |
-	       (dev->boardinfo->base.flags & I2C_CLIENT_TEN ?
-		DEV_ID_RR0_LVR_EXT_ADDR : 0),
+	writel(prepare_rr0_dev_address(dev->boardinfo->base.addr),
 	       master->regs + DEV_ID_RR0(data->id));
 	writel(dev->boardinfo->lvr, master->regs + DEV_ID_RR2(data->id));
 	writel(readl(master->regs + DEVS_CTRL) |
@@ -1518,7 +1511,6 @@ static const struct i3c_master_controller_ops cdns_i3c_master_ops = {
 	.send_ccc_cmd = cdns_i3c_master_send_ccc_cmd,
 	.priv_xfers = cdns_i3c_master_priv_xfers,
 	.i2c_xfers = cdns_i3c_master_i2c_xfers,
-	.i2c_funcs = cdns_i3c_master_i2c_funcs,
 	.enable_ibi = cdns_i3c_master_enable_ibi,
 	.disable_ibi = cdns_i3c_master_disable_ibi,
 	.request_ibi = cdns_i3c_master_request_ibi,
-- 
2.8.3


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
