Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FF7D1266D
	for <linux-i3c@archiver.kernel.org>; Wed,  3 Dec 2025 07:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/aD5GJ7j/ElU/Sw1ESUbd8YRl/Okx8sXB4P96M4u0Kc=; b=iw7qBNoUvrXn6t
	NwUm5qfoM0CKOlDS8rIZH9pODxnHlh42wizQ7OhxbKPieFwsW07Y6/w2KHn0j4prGhE7mg+0zRIDy
	/T0amUcjey9anOyHAg/8V/Jyw2WifCvjRX97G/0ONSMtbPkR1r50COBYpjuxGUDlLnpSd1pRloqQh
	qQnxPhkUBTyZ1gjz+a/NPdBlQEDWDFbfSdiAT3RSJ3AymJG/H6r+TEUjY38c/UygyajxnijohFWn0
	D8UmCy68PFkZMrcpfoP/hVDD1UlgQcF4nfA8ySV8zovY8eo7nuA8+Xo4f8U7LK/P/ThZKL2V5pcOu
	NJzjj+lg06kuUMa3tzOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQhDE-00000006Fl8-22KE;
	Wed, 03 Dec 2025 07:23:44 +0000
Received: from mail-westcentralusazon11010037.outbound.protection.outlook.com ([40.93.198.37] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQhDB-00000006FkU-3kNv
	for linux-i3c@lists.infradead.org;
	Wed, 03 Dec 2025 07:23:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D5aujjR0t2zH+uY/9II5iJSlidQa6JydJ9ugXBrYONa4xWOaQoHycylPrjur2pzkGFM9aGjQEy+Ma6wZvaoQxQqHJMDxNOlZxc0buVZa3FHo87XhVRjbx5UkhG8uZXqGQheX8wKtx4zOKm/tMMquCmXWhlmxX71gtjcVWZsM7hG2aXidgKO3mmW+Akcu9vuUv1a7zDAmj2TugJacUT7qVMGgzvlsC9PrMs/L/R35fCoKxOjsdIN2FxB6bFRg847d/TfIatew30woJOSycn7lh2623sbDCX6gx7KRAPNnKmQ9IbQ6jDn8KHVZ1qhHthdx9fc51UHTZ/O+T6gcJbCY4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zrrSazd8FphN0tNhJV/DraFL3j7RDBMNj2U6pSSL3+Y=;
 b=QC/Ue6+0rc6pNdapGIElJ0wVBkmZabqnteAtAb7GOHnmIJ4/yJcL2bQ/meBuBL5ThJYvDsdCKntEIeBVBsJHTm8ZE6lQHAxpJBKkxnhx06+2HTpjdsAdC71A7IZkGzjY5p8rHcdDoR5prm7vTDj1qu7xeRCjT+rselK8GFS+w9XQKJva0xDtk68UdVrF+K5l4mPl+ET0XHExj7hLraAxf1DXgld+vwLqO78AZhHzwoBp9+1OT+hI2vJZQdprPyla8juqTe5Lv43nSJlrzfRqWXMld+xwKHXk74cUG8L3hsOPk7d4F0zd9v7VfHxcLS0hIyqJSVTDj3mXg9adzUIQow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrrSazd8FphN0tNhJV/DraFL3j7RDBMNj2U6pSSL3+Y=;
 b=CwLNcujwZ/w2dfUllDpYpr3km1x8B6EqpZqWOFpkDCd8dVvvash90E8yLsR3YVIhI01AQsDac6mt7zjg8KhvZIbggGduhc+uZzOxY9hJvwfnbJ9CRN0hToMdMZurQmRQlAMaLJCZ/B3HFNMeVgxKb2lGcUalFWISnasVJpL7p8UvuA6W2ouZLrvXH9amAe8Y3+JjEbQGhhIOoQtCxQO7Za4Y5EBTEaqYZXw0O0k54qEGe4hCtJjq8qCAmC+6kuvC93bANzWn9SfxCkx++uQGaIXsKjAd4TAHx1hWfdZRMYtd84bubShVfUbiTcq4GXiTDi3gKz4ysX7M1c1vI6AWTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 PH7PR03MB7323.namprd03.prod.outlook.com (2603:10b6:510:2f6::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.9; Wed, 3 Dec 2025 07:23:36 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 07:23:36 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v6 0/5] i3c: dw-i3c: Enable support for dw-i3c controller NACK retry sysfs and DAT restore fix
Date: Wed,  3 Dec 2025 15:21:01 +0800
Message-ID: <cover.1764746266.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
X-ClientProxiedBy: KU2P306CA0025.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:3b::16) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|PH7PR03MB7323:EE_
X-MS-Office365-Filtering-Correlation-Id: 78e0ae16-fa9f-4eea-7508-08de323cdf4e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4zU9t7N4ikKOannEtqtHqKbg+/SxvmOnEfH7P5heJ98VqQbq1fXO/i7DtRIN?=
 =?us-ascii?Q?HQE8AmLL4BtOwmD2YrvVUz1egHntNMijWRrDQzAELVdt8NVNf3Ai17gKwv06?=
 =?us-ascii?Q?Hsn7BHBZZ3RBwSXrAj8n0cEkfJc3stAvyGXvMs/9OKM6z7xM3ViZiRIdXJcp?=
 =?us-ascii?Q?C0LKUpu8PoZ2sCQ9tn0Tub4ythA1Wy1AfpKfjrgT3VsZ/p6cFm3vNProFRb7?=
 =?us-ascii?Q?SuqH+ZFfgi2Qicbbz5J+hof6O9rUvGrzuvzwklv0k//NY7ZzZwZWbwdIYdux?=
 =?us-ascii?Q?0FTAwxtaif0pp7UjelPcummQ7LZPojU2F3Z8L2dpcvQUul6td4+R/DUcD5XS?=
 =?us-ascii?Q?JkWfIwqBwcpjoDtEgAK204IzpZ/UpGTq7jAO5FR6MS8Gi5t91g1Wpgs7Vl9T?=
 =?us-ascii?Q?yjlb3scsEj4CxFdDoFd/Eg1332MTrae3TdNhq00YwNUiIYpCTFKrPv3NVQ17?=
 =?us-ascii?Q?ng4ujSc2BfAXTcE9e8s/kup7Np+hPPZQrrDo8Pn20Isnvl0jlzovjG+WgHUz?=
 =?us-ascii?Q?JF154Vn61iVGUN5EwUQrunOMm1he4KMJhQkU67jUjxsVMGQlj+Tf/pVh1uyI?=
 =?us-ascii?Q?zR2bfgorUmYKbw2A8tDHqp1oXM3nSc6/2C7pvMPAXS5LE5WEgFjNdI4AEm3g?=
 =?us-ascii?Q?I0cjBIzVROhPmY08M25TuGxSqnLcSbKF4NKDafWmSWjEbz7T62U/jtKRhsQl?=
 =?us-ascii?Q?xUrVccAVw9EwUOdGysvwOfHnRQQGVDQicqZqSyP34QE859REK6TAQ2W9iYDE?=
 =?us-ascii?Q?YTQsxNwVtezwHVM7cT7MSluV0hLdxeoeRdmjyOhyzKk83vSr06fDHK8RKP9S?=
 =?us-ascii?Q?E8XhRKUihiaVdWF0LAJf+EYmihBzd6+XMF4l3qM8jR+cmHEQk8uY+sJQxt2s?=
 =?us-ascii?Q?+IA7xfx/0bgK1TymBNqJvdGnKT+2YqpLMYXle2vtcWJD3AkHou23x4xf3BGz?=
 =?us-ascii?Q?+3KCC7c8L2/wnoosEn9j6QD7gXqbyD+7umlq80X/9CjY4RaiSrmU/xP8ibCw?=
 =?us-ascii?Q?1LrkeAmCqVJiPdXIlw3EdyNfmU0Oilc37xQtpNZiE2GwC4uYCj2BqB4ZjJTh?=
 =?us-ascii?Q?fRzv3K4ZRa9rIwSpB/vr7HXzv9rNqLN6o9uA42JzH+JDvWObz42aO4Iyiovz?=
 =?us-ascii?Q?HOwokXOShRXAzFlG3lKlUecAwdBG4jYIQwX2dUrJRa8H7Fypg+FKwsUjBgw1?=
 =?us-ascii?Q?NUTAxiSI5orVjiZc8XgHT5+89qXjZGcTU68rUj70jr8TlWimPHz+pOlgz+2S?=
 =?us-ascii?Q?9sEj67b4f31PlQcwhg3UkpopkrogSOMP7r3fPzyjGCAFV1xYGXRznApSxF71?=
 =?us-ascii?Q?K0AmIVPTkGI8fSEurymELqFrIJuYMVPvoCn4cBjz9GnlDiWKYNvehx0O8/vI?=
 =?us-ascii?Q?uoq8CuqWOfZX2lu5gQlU9j9dKc0c6CGoR5QXW3G392SIJwxNkmBYNEZVjgFG?=
 =?us-ascii?Q?eMW9bZgWQTwtVrreGYURXU+5smyM1L9/XWT6w+Ba9sXq5Zl1zemP6w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XpVxbvg5a9Ck1ftoOchQ+yH/zkJ7+W3AbHomdtRYgU2Xt95Z4Hx+HqD1ZV+r?=
 =?us-ascii?Q?AP8Ra5mbfvXk/bIGJdEdVlNijQa1qvHOFndtfDG4d3Lu3BRktjPWfOI8PxVT?=
 =?us-ascii?Q?qrxjWDx4FQZQUf+lG75WCoj83XFRCoNuNh1fiZ6m+RqWLTIO5ySbLhaNQmA4?=
 =?us-ascii?Q?LrWcmyGxOGbVWYQw1uGnlekddIi1AS3gSzm4Gr31F3hjWsE0nYz5+LWToadt?=
 =?us-ascii?Q?9/iHizkC05TtEJkhLjACIp2AktJPCBigSELbqR3Ms8Bfb1pclrmKEPZfY3T5?=
 =?us-ascii?Q?SVf95WGZXnc9MiytgzNQHTYuy02i/ySKxzF+LmHp6FBIYnUufBe4AbGzPbWd?=
 =?us-ascii?Q?qF7POcI8v804DSLSMOAJxmANRHxbznW49lDmKbf2uBnM06TrwgpPRi/uKA0c?=
 =?us-ascii?Q?QArWHEZXMP26mUyErwCa5OJrquYtOn9hj2jMYPwiP3y/10WSO/fKL2T41F6q?=
 =?us-ascii?Q?h1NhCU6PmLmRubjY1NnuwmeQUXG6Y9w8eaiZcSZ/lM6K0EVVKtQE5VUNtsf8?=
 =?us-ascii?Q?3P88mn/1ziJmRw08ihj0mtG3Js72LZvMlne0W0iC21bcRYTesfA+snOrC7n1?=
 =?us-ascii?Q?bvp5iwVetSNyoxUr4fyCTXFkqBsZ2ZnXebA7iy7hIJDLw12AdWh24QvuaXmx?=
 =?us-ascii?Q?UKrQ+bFTShpd3WM0wcPByg5PB1Av+CAUVWLjub+C4HWD9EJSUWSdWd1FLGQp?=
 =?us-ascii?Q?tB94ddfZkdZlwRLtVUFabcMvpugCj97kl42zN7zhKJ3oOvaaWlN/pyW7D1Os?=
 =?us-ascii?Q?Jj1EqxPA05eCtg7S7+0rvPuF+37Aue1dccrmhV5HWRCIgBwDVmj4QZ+NTUDv?=
 =?us-ascii?Q?I69NNTYdoQqj8okSehT5zjCM5KsjjuAKa+UWptiUevXz4pv1zuxJ73sGH+Y0?=
 =?us-ascii?Q?iNAyLHhRxN0uIhcuKUSXZ79hoFBrlPxpyuu1o4+Bn60iLXTJUS+PiAfEZAvB?=
 =?us-ascii?Q?+O3yBXPRrQ0JUfPVnJig1wjrKm+mcVACHxBw90b+CZZ+0srvbieX9iGt7RBZ?=
 =?us-ascii?Q?Ml38JHInVRGOp1c+coX39A4qSpjjUskw3UJSORxxorBrvSqZbZzrzyNxYN5B?=
 =?us-ascii?Q?cLqCBeY2Uc+v4+fznfSQgNVhelZXhZb6gwlKhJrzSd2SXhIYUCofNQe1a6XI?=
 =?us-ascii?Q?iVVK/sgwYMl+CLMPTbh0jFKegQj5ek3XISA8cPxoGyN1A+9B727kR+5SrM5k?=
 =?us-ascii?Q?Wa7lCvg95qUnRy5Z/qPJuPM1FgHriuTk3QBcPV/KeRoq9gEXEzLfW9AbLGa/?=
 =?us-ascii?Q?ZO8YqD91YceivZARcWrvO2SNGf6x1cqLZkKayZq4YjjrENpT6DG2Sv9zvtet?=
 =?us-ascii?Q?hY5oWPs+aq7xfRrXFzbbLBUQ4eEfFhkBOoMZci7egi1Stqtkp4VTOugXE+/Q?=
 =?us-ascii?Q?kJwcQQN5lSUhswuI2JcsRcXdkbGsolrYGdAN4BP3xddY6YT3bTp7WDk9sBIJ?=
 =?us-ascii?Q?tZPyx5HC6OZK01teB2EOmYHzT206WGX8ND40eXTY0y7dva7jUbvPWEr5N268?=
 =?us-ascii?Q?lSQZfbgdgw+SMTj6JHdfl9ycKU+TTwTTT8ABxm2I70jgU1eNoHqPT5gjxKMJ?=
 =?us-ascii?Q?QO+edCCajglnIZTOxvfNsQN9cVmNNaSIW3zN/x8M2WqP5R9dewYvdvTqr3LG?=
 =?us-ascii?Q?BQ=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78e0ae16-fa9f-4eea-7508-08de323cdf4e
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 07:23:36.0329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MP4hdCi6zBFo9LQpv0Pdn3Nfy98YxB6iVMk1X5ocT1AtDq604QNsjlETb65kBS9j4SiSYQGLTZR6ob+Xh8ULnXPfCNcCbjHhAFxnVZJpyt0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7323
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_232341_976329_CBF7D228 
X-CRM114-Status: GOOD (  11.19  )
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

This patch series adds a controller-wide sysfs attribute
dev_nack_retry_count for the DesignWare I3C controller, allowing runtime
control of the automatic retry mechanism when a device NACKs. Some I3C
slave devices may temporarily be busy and unable to respond immediately;
automatic retries improve robustness in such cases. Writes are clamped to
the hardware maximum of 3, and the value is applied to all active DAT
entries.

The series also fixes dw_i3c_master_restore_addrs() to preserve existing
DAT entry bits, preventing overwrites during runtime PM resume.
---
changelog:
v5->v6
* Use dev_to_i3cmaster to get i3cmaster insteasd of direct assignment.
* Remove redundant set_dev_nack_retry callback function check.
* Update kernel doc for set_dev_nack_retry.
* Add macro for dev nack retry mask.

v5 patch link:
https://lore.kernel.org/all/cover.1764663888.git.adrianhoyin.ng@altera.com/

v4->v5
* Revert changes that made bus_maintenance_lock and
  bus_maintenance_unlock helpers public.
* Move dev_nack_retry sysfs attribute to master.c; create it only if
  the master implements the dev_nack_retry callback.
* Add dev_nack_retry field to i3c_master_controller; updates are applied
  under bus maintenance lock.
* Add optional ops to configure dev_nack_retry in the DAT entry in
  dw-i3c-master.

v4 patch link:
https://lore.kernel.org/all/cover.1764571045.git.adrianhoyin.ng@altera.com/

v3->v4
* Make bus_maintenance_lock and bus_maintenance_unlock helpers public.
* Replace taking spinlock during DAT update with bus_maintenance_lock.
* Add macro for static and dynamic addr for device addr table.
* Replace GENMASK calls with the appropriate macros when updating addr
  table.

v3 patch link:
https://lore.kernel.org/all/cover.1763747151.git.adrianhoyin.ng@altera.com/

v2->v3
* Update commit message for better clarity
* Update function name to maintain consistency.
* Update store function to return error when retry value exceeds hw limit.
* Add lock to protect DAT to avoid concurrent during transfers.
* Clear the address field in the DAT entry before setting new values to
  ensure correct dynamic/static address configuration

v2 patch link:
https://lore.kernel.org/all/cover.1763703573.git.adrianhoyin.ng@altera.com/

v1->v2
* Drop dev_nack_retry_cnt binding and device tree changes.
* Update commit message for better clarity.
* Update to use controller wide sysfs attribute that configures
  dev_nack_retry_cnt during runtime.

v1 patch link:
https://lore.kernel.org/all/cover.1762245890.git.adrianhoyin.ng@altera.com/
---

Adrian Ng Ho Yin (5):
  i3c: add sysfs entry for Device NACK Retry count
  i3c: add sysfs attribute for device NACK retry
  i3c: dw: Add support for Device NACK Retry configuration
  i3c: dw: use FIELD_PREP for device address table macros
  i3c: dw: Preserve DAT entry bits when restoring addresses

 Documentation/ABI/testing/sysfs-bus-i3c | 12 +++++
 drivers/i3c/master.c                    | 41 +++++++++++++++++
 drivers/i3c/master/dw-i3c-master.c      | 58 ++++++++++++++++++++++---
 include/linux/i3c/master.h              |  5 +++
 4 files changed, 110 insertions(+), 6 deletions(-)

-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
