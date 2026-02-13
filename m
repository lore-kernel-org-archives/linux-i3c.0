Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231B4EF48D3
	for <linux-i3c@archiver.kernel.org>; Fri, 13 Feb 2026 06:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5nUlfCcuXFPToNCjA2AjTuhevd/3QwUf9m+Ex3jnAc8=; b=NXMSm5IeHYAVjO
	N3YkRAJtHIUuM3/FH4VP+oIrJpXGwsO0SwBIpkRSueGcQ4b0WM7EVs2Gye8v6RwDLaOK/CRi44D8Z
	d0G4RXOy4uJPxb/Nv/7QhhIJkdzi11xxgMQzuC/5+QKI5M+w+wfjSTZSliZmPxLzjS1V8Q6hLD2l5
	7IxDP5OpkdRLN2QmggzxwDEatB1VhJ31z9QWQ0oeWIPDhZV9qtTrbaxMbypfKNmcI5BeTA0dF2iEQ
	ERI/LRsWY5KlPN4A/lTDN9oeeY/n+y3GvQKIMP3iWF3B/+zeM7wkihe/0kSoNUUGdxamCBWH6thX2
	p8zDRADpDjv/HpvyWOHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqmHd-00000003364-3aXk;
	Fri, 13 Feb 2026 06:04:05 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqmHb-0000000335i-1Jgx
	for linux-i3c@lists.infradead.org;
	Fri, 13 Feb 2026 06:04:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NZV7oJtcse12S8BQ7532/BC5o/xF5cyPOdelKKXLXn9poGDwpfbIumgNI6Jh+3P7iKlFS2pJ8LeZrWI46ZClaDmnMB8ewp7TcRRLBs2ChoVUPQkUPqvezmaPI3lw2iGhemeSBA46OsSYZVP/slQzWFw2t0aFuk3qoRQw9YjMVOA4iY//xzxg/psw6Htz19JdQpidR6VNpkAGaC9nPJBUbMHhSzPiWtxNMFkMuqbX9Q3Nhwr52y8nkpsa4/UUgP7nQtLw/csu7OFDb9PHCNKRr1ec/OhvFgWhW72qdrhL4o2B2TJg6BbZyhl0Q+dwuKUKo5d3ZQnULpnjzhb0rxaAVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=skrCOxnlxOogoOBJ0C+nCEGu1kGrejiCbQWEFgYWo4A=;
 b=vrYBTvozAsi0F3oH9bAhaXxE+0MWHAAt/UQy5Ao4YYnAonFqU5Qbii8AbIeuTX0IJHHTgefbbUq/WvrbOl70ZUNr9yIeEj7P/kk4IBNbWNU2qRbUdeqlmj+/Eer1kPLQNeU+WKDG5eV4YSxQbkOw3PjgJZQ54bn8DdGtg9KINRW99un/Bni+TxGpYCyXcnZq8clFz4wPgibuheEC90sbG1E0k4gGpsuS6ixQNwsR1qLYKHqTted9M0EfSs0zG1nbgav96qXY1R+/7lNMJl5jkFo2i1wg82GyQjf8WugplwldFJURYx//i0VVEbp6P4k6wWQBygHyUKYLHSUmuEY/Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=skrCOxnlxOogoOBJ0C+nCEGu1kGrejiCbQWEFgYWo4A=;
 b=Kp2/zKEVaB3C0X9D8TrDjB7SN/HNcPcQQuoYY0n8amxdHeo35l26cZIt/rxQ/MlXvU46lojVIZ0OW/arEfcLCNb6pVNsz3TcrCHnISJZS5n1hDqR9QzZymurfQcdNHDJW098BkT9vvkAg+jR6NwyNStnqOqYfIjLimxbYBVAdXh3EADIW3Q78JDnfmwLHlRRy25V6fnvWPg2r2cGw5+rR4LLHYEUdp8p2iytFInYXly9aZGqeoHH62rwrOwF+KYU0n4CTRfWdBnfDV+HRxdptpdb0VSKKoQxZHzlg+/44I4b7MLf/ttFg1SKKS8ATFBn7Pc2PN09l/S2gsoubg6W1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 BN8PR03MB4962.namprd03.prod.outlook.com (2603:10b6:408:7b::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.13; Fri, 13 Feb 2026 06:03:57 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%4]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 06:03:57 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v2] i3c: dw-i3c-master: Set SIR_REJECT in DAT on device attach and reattach
Date: Fri, 13 Feb 2026 14:00:48 +0800
Message-ID: <53f5b8cbdd8af789ec38b95b02873f32f9182dd6.1770962368.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
X-ClientProxiedBy: KU0P306CA0078.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:2b::10) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|BN8PR03MB4962:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f7c07dd-152f-42e7-6103-08de6ac5ac7d
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mGLCzoPpVHXIrJs/6rJBJe76YunaEoXyyiv6fMKaO8ADb373RHFo44MsaMi8?=
 =?us-ascii?Q?Dz/vBLMJJ+BF3NyW0zhh6+85yci1JEwS/fNPEorSTUOJ4tgsiPYL59k/L1VB?=
 =?us-ascii?Q?wbAM1R9yUO83NmNDIL1k1PrhmrW4HanChK4bDt/w7O01FMa/lEyyNsSb3idq?=
 =?us-ascii?Q?RJ/yHE6TrUuiwBOumV+azSaFCaYPrnL4ykARRS9eQ7QZueeligMutwtcHUxe?=
 =?us-ascii?Q?u0j4B6Z7iISsWgXMezniFgs1ivahY30E0mKubUUevtFp7WNIuIk2UpJqX22y?=
 =?us-ascii?Q?tz1KKiM/PRAHcvmlQC2aEc0QQM6Q0/YBTbKNR+yLQutK9GjRva2/cO/RPsxR?=
 =?us-ascii?Q?y4o4JgD5u2xWC0qCHS86YuQd27ILJnzcVIjL3ezCBMDj9j4/SBjxMeAjc22P?=
 =?us-ascii?Q?Rk5CfsNEwcCRml+We/KjjMCtg+pjffbmLQqK2lyM2WEQgk+zGzvuDsE6PJBK?=
 =?us-ascii?Q?hKOxEMIvngmJQfeZK0cSRGq5u8qyvgAYtgBmSvTV/dFLa4/X6hNhjlTqAm0z?=
 =?us-ascii?Q?cwWZFYvzUJpkUKGJQakzr/O1PCTpiSVJ/39iShDVB7ketFNrv4ZbPO42oBHg?=
 =?us-ascii?Q?xOem3bFH7Q/Pr07pPKdyrOGho8fooyM4FkWREmfnxfbCv1jUOt9qo5v1ZrgT?=
 =?us-ascii?Q?WtOfamDHTJiUGJPy5wleEn4vhELSuw/rPqlLeIFNucpf5ZpRKLuk+KAVZx40?=
 =?us-ascii?Q?Ax9oHRDpWRJDNJFAKkpQhGEANvv0TM8xdK8W0EWv2TwfQB/lEg2kU//3Dnc2?=
 =?us-ascii?Q?CEmdss2R6x69Bo+FkUxSc6ENN6BDyFnBQnsDdXuv4cmK8HzsYJerDv1MgUDS?=
 =?us-ascii?Q?6ExwOJ01DO1roh6aU/8ywqP2KHKHudrfagcSv+HA/FSJ50jvdQ38u+xkoi7/?=
 =?us-ascii?Q?jwWDcuUwap+/BGnpsqtFKDBtBV39X17K2rL8fp54wPwn7mjwOnO4VRJ4HKvD?=
 =?us-ascii?Q?23geL+g0V4yuqBLiSXkmuCZ8YhVYJ5upPbn45+ENAjlMzUZHz1QJNgNqauSx?=
 =?us-ascii?Q?mc/Adqz/iCzgJcMEFtP2xnM1Terc9q24hJ1vP7Artjv3td6/gpIWYqYLhU/J?=
 =?us-ascii?Q?/Gtxp3TL+VibYAV87MDIcBpUrun8sitxumUytK0t5kizAExamo9m/ufPee2W?=
 =?us-ascii?Q?5K4dKb4jZ+GEKR/NNhWqjgmTzOYLHAnFtUNiFDK8s/uOtFqszP6UQUuJN21y?=
 =?us-ascii?Q?0/y4S/UHuIjvdRB1viamcoswXA2cYisq5tM0Yar8D84NVUDPVR8UFjAcuAB8?=
 =?us-ascii?Q?9NVtyqGmlsi+xxDl1UEt3l7OVQkXISFqC37M6MSgs3I++GPLJKdaWm46MS3f?=
 =?us-ascii?Q?O/4tXzdj6C807dW8ryXMEGVKcs0dxQTpImekbzBxyo9IppXTeFuG9RVQ71BD?=
 =?us-ascii?Q?sWRJY7U2iA/qyg6Qci++wMy72cSqVa06DDRwsae4E5Pf80aAOTUR3+FaSdqE?=
 =?us-ascii?Q?SSF7v+g1Ju3Bwf9DfrlRdN2pHFAAdr3N6qt78kGqmyHxqo2cDKAnVPObh1Ws?=
 =?us-ascii?Q?s4pKcfS4jN1Urdd1zeOBbAbpyoLp4XmIa1zpYPXLynl84Zss9wQ/F7ZwMi/a?=
 =?us-ascii?Q?7onK2yxrh1Fq/bRx53Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zvIt64UKpTVta3uESp9cudL/K6pwu5g/XhqVat6h4k8qNHcP0IgY4GXYVlfY?=
 =?us-ascii?Q?sDJRYzhz2sZUvxc/+YZpq2TFBZQ76eKkD6v+mg7lHLexac8BpujJDVlLso9z?=
 =?us-ascii?Q?yxEJE8SFbkvETjwlHWaAQfOGbYa3oUeyuZ7l8FElyS+fOK5kyyvcc1V5tYU3?=
 =?us-ascii?Q?4QdYXV4wZDLoTBS8EJUttU8oId4jXinX2GZig5SJ8hOMgQ7+mnto/6Y8Dtw+?=
 =?us-ascii?Q?83CJVZ7OBJi+k+aQMYVOJLB1ln9qT6+4oEhIUe5EXiM22gtXpaCBpwo399NH?=
 =?us-ascii?Q?QzXDdLR7rmxFPMyJ43S531X+yWK8UwBtFTo5jWJRa1P+uDClcxK93TR7MZVM?=
 =?us-ascii?Q?N/SdZrVbDdeeSROTWFz0IvSedTwbyb+LQl+Omu7sGVOFs6RrjXGB79IDW8Af?=
 =?us-ascii?Q?WjuZsNS9ehSG505m13XOISt15doXU528sjS/RIA4WVDhFjkQDPASdduKNowh?=
 =?us-ascii?Q?Ldr9mNdf3dO+bFHa1zNzN5a3wt3D0IOSeLIZYWWpenW0uNi2VKUFVBYfG/UO?=
 =?us-ascii?Q?cUCQYSQCbR2DBhY1U070GWq0xcuOc7smTID9Y2LVO62j4T4yHjWEh+hA+gUZ?=
 =?us-ascii?Q?cIUdrQIJ7W3436gQgLMQ6BxreClDH3qj4dG2yAXOjtkdDrwZigmwocLFiRGR?=
 =?us-ascii?Q?DHd8fNkMvyJFnMoPyonaz/DFC+BCgexPmjQD6ThrWXgnKwjL1f5JEurCnRXs?=
 =?us-ascii?Q?cTPTtTn49AzQVOnmeuEAZDGFqsEgp/9ljb215Ffyfj9ttDQd+agPO/EjNPpP?=
 =?us-ascii?Q?d66Oj3A6w3GNCmUM6BIJF+Ccv8PO0HWQfjh+SdLAMDypvD7Y97lRU2fdurWr?=
 =?us-ascii?Q?0CH549AzUQLYRvio34NQKAXZj+Ae0AMIqG1oYsQxhTDR6lGVX2iJjw5f+c8W?=
 =?us-ascii?Q?re5U8nAl+smOcek1GgJjuXRfXVvffcgS7YJqOYJumKGaczU7Joa0jNnd7UWj?=
 =?us-ascii?Q?HawLkzXjDoGCVrCR8JjHM0t7YQTcmJwYvUQvNPEkTdU6HZMeMkOGVKjRp0LI?=
 =?us-ascii?Q?ZP8eSE4PXHeWTDzc/kIzQOp1XWPJ+InPXuZWORg6/y+VelD58yE+hFkehOI/?=
 =?us-ascii?Q?EzqQgZK3rOPvGC8B52edlX4i/jjdXpTx4H4EHUH/OXwt0PYo6UTTXXxpTaG/?=
 =?us-ascii?Q?/OF/tA1/rxIz7FXkObDBixcMpHdfKkTexP4jPYl1JNlw1v6sxF72QJKjzWRQ?=
 =?us-ascii?Q?ontq5o4BpT2a+c9al/O0B0EVRstetD/+yQy0xvFJ99xxpVNZTU6X7raYh+YA?=
 =?us-ascii?Q?He6KG79SCWochuEiS7hdyXFpovcNMD+fZ2QCxyxgohpZBZsqLPOIyAhgmcCT?=
 =?us-ascii?Q?tbvBm4oIYfQ8gtqdE/pDvy9/di5keU+inMZYuSZLAXMNaOGfbSgfTE9XWUSH?=
 =?us-ascii?Q?3PCqoRJKFKDmeh0AkuQEu85DegLBRxcZT4GJrnolkrabSppSIlyQkQsKHG73?=
 =?us-ascii?Q?scEvi3UZ3AcodVL1y7TUMCzGhKjdd5B5fjBk2qe9sZH2X873on9m0m8bnWCJ?=
 =?us-ascii?Q?GNR34sJuKrGX8QPubm2J6Oiw/rK6t7RP9dcqGggLjxz08xd8Q1yt2BuOyyMc?=
 =?us-ascii?Q?Zjduu6+kVycJ2Sxy18RimYOSk8TCwA7cUsxBdBlD3ejNMgSDnHeykOvKKIIB?=
 =?us-ascii?Q?w8B1yNHPOhpFVhajTrr4WdDDJGppCzLRnyBJ7xQinNMaXwV+QiOQaE3mM8C5?=
 =?us-ascii?Q?7ra1IatOLeT0QOJv+OufWVlUX5tCySIB4zWwZb2zA4wvyfjsuBbwQKoOoRgl?=
 =?us-ascii?Q?J9j0+QCuxcuPeUm+Je5fNHIO9AoZuAs=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f7c07dd-152f-42e7-6103-08de6ac5ac7d
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 06:03:56.9740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: weICGokhcNYwBVLZag17ZNXt6c2PjzxThjbqTSw/S8XkUWcILiKo4df7/PTlTngPzKrYrfe0J9ZFPgZ9+24tCHO6wua7K5MdPnL1KamXwBE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4962
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_220403_371078_D3EDBEFC 
X-CRM114-Status: GOOD (  10.16  )
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

From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>

The DesignWare I3C master controller ACKs IBIs as soon as a valid
Device Address Table (DAT) entry is present. This can create a race
between device attachment (after DAA) and the point where the client
driver enables IBIs via i3c_device_enable_ibi().

Set DEV_ADDR_TABLE_SIR_REJECT in the DAT entry during
attach_i3c_dev() and reattach_i3c_dev() so that IBIs are rejected
by default. The bit is managed thereafter by the existing
dw_i3c_master_set_sir_enabled() function, which clears it in
enable_ibi() after ENEC is issued, and restores it in disable_ibi()
after DISEC.

Fixes: 1dd728f5d4d4 ("i3c: master: Add driver for Synopsys DesignWare IP")
Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>

---
changelog:
v1->v2:
* Update commit message for better clarity on SIR_REJECT bit clear upon
  enable ibi call.
* Add Fixes tag.

---
 drivers/i3c/master/dw-i3c-master.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 7eb09ad10171..d014f2cd6071 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1024,7 +1024,7 @@ static int dw_i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
 		master->free_pos &= ~BIT(pos);
 	}
 
-	writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(dev->info.dyn_addr),
+	writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(dev->info.dyn_addr) | DEV_ADDR_TABLE_SIR_REJECT,
 	       master->regs +
 	       DEV_ADDR_TABLE_LOC(master->datstartaddr, data->index));
 
@@ -1053,7 +1053,7 @@ static int dw_i3c_master_attach_i3c_dev(struct i3c_dev_desc *dev)
 	master->free_pos &= ~BIT(pos);
 	i3c_dev_set_master_data(dev, data);
 
-	writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(master->devs[pos].addr),
+	writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(master->devs[pos].addr) | DEV_ADDR_TABLE_SIR_REJECT,
 	       master->regs +
 	       DEV_ADDR_TABLE_LOC(master->datstartaddr, data->index));
 
-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
