Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42740D609C2
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Dec 2025 17:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+n/lE0rpsqovbKiEqk5d4cPBSl6u+6AD9u5Pyo4+AOI=; b=HHBjjyvdjEpZ8m
	ap7ogKCN5I8z6R6dL6Dqp15DnOlvMNNfWIVbh1jHCpUd/yCzA0O816cZAV68ptAOolblu4ovXF0SH
	aXrFaj8/HA7ruczgGrfbPZYOEagJdv53tRB1xT1e/FFx5qbQkQzRQYQXDCteUyY+s6kK9Copuk/AJ
	x8ev4cZ4rK9KkDiyO6wgDE7lOwe8crfUA4JQzaTFvVKpfwWklIx2SElv5BWAskUBqfF7ZHj8n3D04
	ZiAa94ukmBS+e379bt+4oS+5lJVUiv+3CTC5Wv6zMgCSuGmtb0NEGcVF/xF2IB6GckyrPsiTudInn
	Pa+wVKEIWwcZ5LDSfJ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYT0-00000005aGq-05Rd;
	Tue, 16 Dec 2025 17:04:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYSy-00000005aGR-2v5j
	for linux-i3c@bombadil.infradead.org;
	Tue, 16 Dec 2025 17:04:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Y3+liaitm3l5NvwQtqfYodg4pBQYKIp5dXE8YlWCkiQ=; b=AYbYZteo31kfu407jJZeyZU2MZ
	BOE0tbNQ+6oeY/H9cv6qqzgetoMKBSN78Q9z1zH7w+6sgzl8ZHxVrdBv2uy3K7HOrq1e1AvIiACu9
	C5gnyVPEiYoP5qW0JvD48X7eo34KVWYmycDE5WHtTY9jss6UYveeRaYWG8GSHUCNdRtMHAhD4TwkO
	W7b4WZpyAwWid6kJ3nznVZBE7f5PXlwLLtDWLUcZkgDfrYpQRowM15/8OFQ4OgA2awxvmjBNhGiUN
	sTVpZoarAs9Zs0W5+TwgEdzhkPZkH1l/x7AWEQyZm4K4+OMeKt9/phB5apRu9EqTM4UzQCtgwi3g5
	xVZdO47Q==;
Received: from mail-northeuropeazon11011017.outbound.protection.outlook.com ([52.101.65.17] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVXbQ-00000005DcM-1Av5
	for linux-i3c@lists.infradead.org;
	Tue, 16 Dec 2025 16:08:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nf5EXWPObeviIciiwU0rZxecM0vM9RnDdFrSiLAIon9crabuPueBIvpq4j4kYhe5ETlV/ivHk2O6+sQ3dktbigJcFlm2yCG8mGrJRPqTzXzuWprVpUoIKd/r8Z5RxQdBrsvpuT7lA52OfXHSUMPJcXHPjJDJ0BgFzuFXDp5/HdIdCpU6SEWFhHwW2xIDrBPw95oQIXOdKXlMRecjKxfVHlubN3kmJda2f0hN6cBqwtZP/ctq2sHD3VI5ZNa6N8nCWuK/7/nna5zTKh4Iwqi0x+kLbeol8DJB+/CuM/+/vNpkNA/nV04bZWHHormbTxZIukOOtT43U36SWkPBNoMcDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y3+liaitm3l5NvwQtqfYodg4pBQYKIp5dXE8YlWCkiQ=;
 b=bCdUYvBmlVa81H5X6J+fYI+cf9B79EjkFN+Zl34c7Q/hdlSw3hp9VU5TEF0DIkbVtIjQ5oxFQ7oFHVbrOqXMVHcAmCKvtteu/GcPQAlXl+IWKbU9t2q6mNqa1MSajGe+d+8NXzo3VSc4GtYPiUrZi5WwIctKp9EzEGZYmIKqFPg5hTcSJLY4Bd1LaySmuJzGuAp8SO8RWtC8uONpnnY+fM/c0oqVkBEbK/jToS2Rg2uZYPz82WTP0kVB6gKYFZ1IOsu9zLOCWw5SI0UsD6LwH3axsHYtuRpJcXcU35UzT8gURoivFMVwziP3+3rK39nmC3tmV7zL/l8488oZC+1i7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y3+liaitm3l5NvwQtqfYodg4pBQYKIp5dXE8YlWCkiQ=;
 b=VE0jn77X4LyWn/8P19/tlZnldWUovs690l+lEY7Q6szW3STM+NzoarxnIm8TGdGFO7FDG6n7DTBmofnuJUoAkv3ek9N6FzP4S0JkwNzW29MY0ZxUqK15ylwTtAVLnR7/dKC1iFDDdIU80ilHZNWbSn9HFwZSBWgOHfd92qBwIGLwteJbNtkUn1PgEeZRKh6LOYUMDlfTKWAHi9LTuCxtQiCxFwv3mxIYpvALPMCgxbMur5ildTrlPamY/bcqHikxZg/dYnxGwkXnL4aXU1jfJTSQ5jXCcQ6hZLVcZijEnDgcdMWoqGj1H1SHXhbxivoDGrlKGjbL5IxQtOGN2ukHOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by VI2PR04MB10571.eurprd04.prod.outlook.com (2603:10a6:800:278::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 17:03:54 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 17:03:54 +0000
Date: Tue, 16 Dec 2025 12:03:48 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V3 05/11] i3c: mipi-i3c-hci-pci: Enable MSI support
Message-ID: <aUGQ9Kak8FXL1exD@lizhi-Precision-Tower-5810>
References: <20251216165642.164583-1-adrian.hunter@intel.com>
 <20251216165642.164583-6-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251216165642.164583-6-adrian.hunter@intel.com>
X-ClientProxiedBy: PH1PEPF000132F2.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:518:1::35) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|VI2PR04MB10571:EE_
X-MS-Office365-Filtering-Correlation-Id: 1773743b-5cc7-4bae-d4e0-08de3cc517f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|52116014|376014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4bgJmV0y7YIXEmNdB7aROEBLXAbze3Ayj2S2yyUJ0dJXZJgwKEe8A6egQHCy?=
 =?us-ascii?Q?SkV+4AKCOHVuEfLpZKGm91smTxoehlEx8GLGl6hRhO6Rn7KIkqvGlin8Xe7o?=
 =?us-ascii?Q?0UbTh0O3daEm/vF4LiyqXO5Y3iyTjyJ+RxnJeEhj4KfCkoseCvyvuZkekVCf?=
 =?us-ascii?Q?xVky2rWWPKv/rAXt3RsNAGXk5vzuJJBqLx74OWORQ4wt1Dd7pDSuocKcLTZS?=
 =?us-ascii?Q?bPbVsqluMiyUlqcFKJU6KrCcDzG8L3qIivuBCCc9Duj0dBLdbLf0D11K/vHR?=
 =?us-ascii?Q?fnP9a+6r2P7qlryRzXRn0rL9vQiHwTIyhRhtbc9Udqk/XKo3Ogi+L7ZMRzpz?=
 =?us-ascii?Q?hJmTJVRvHwBXNahekZSHawfcgnvcESKQCIoPLM4jbHlHTFwm//Fw2uwVJlDC?=
 =?us-ascii?Q?atToAWk/EBCJ6PMMb4yVPSo0RjIn3t0DLsPepM+FZ4/uopYBHhsaIezLyXKx?=
 =?us-ascii?Q?jJne2jLnTfXRBUUc7+6pSO6tllDJEaAsmxvXVNOWOixHq1/sdIpEcHxkY2d8?=
 =?us-ascii?Q?c2QbgClHI2OURyMPkqqayLd3u74vQ3UReMDiihvbj0MTnEommj8QUrcUe/on?=
 =?us-ascii?Q?qNpH0QpHQBQO9ym9rDOMaRIUibWQb+5eQpL95lhQy2oK76Xd2+Vm1fnBojg/?=
 =?us-ascii?Q?p45Qnqa4FI2JGW/FYa/YbrfytKEivk6i9igBELGFNsC1nqq/JlEWZGjqMJCm?=
 =?us-ascii?Q?GVggygffbaMh83e6dI69y7wx/Cj63QoDOFarrMPFU282J+ULVxV32/OVLny0?=
 =?us-ascii?Q?OpagA4JyZedxr1ynolqkRo7Qz0H3ahhznmk1RK4qzFRUt7gxhOgTuZWGvAVl?=
 =?us-ascii?Q?A4PccIbTsJvuWeqMtlIPirZBMlOZan7tPaz1gkP5SRVxKJGpNIQv8wsCnzD0?=
 =?us-ascii?Q?f9nPJ+yT4bFBMJMOQxWMK/r2vX/+cvxP/PlBc8QZAVHq1eCg8glsRpFuVYlV?=
 =?us-ascii?Q?8/962KoGauNT/6vYJd2+9z03KZa7bRng0Ugk9IWPYFPyCGLOHdlijLGBG6Be?=
 =?us-ascii?Q?ok/+Qk/chwE0H+I385Q+6WYkVlGHlf+hZc8+RZXxbSbYg0+VP0RrlDX6qsul?=
 =?us-ascii?Q?wv6SR5PEaIEwN+FlsmyDciuFvl2VK6WDmkUw3jjD4OzZPHnT5fQlKqHl7EXa?=
 =?us-ascii?Q?ZNJwf5fb+Nt0dfadil5YLeFvveS1uQpU0KHYoaXiJtH0RrMddiaNBEPyo05e?=
 =?us-ascii?Q?3inCWur2yGN/6BsRysstjPpPqXnp81o+Lp4D8nEBIWc735XhkY7ajggGv7J2?=
 =?us-ascii?Q?UBC59zGRfbglJ1yZUKaU5l6jadWiJzscmiEN5a7+/NhuWPVnlYMXOfYZ1cnd?=
 =?us-ascii?Q?yAMWC51e9Wtz3hStIyoiI6Pp1n9tcPXLRYXMMXGQT19MXQkDMwxhLAKAZ+hB?=
 =?us-ascii?Q?wFNYfi0GHQx++kJeiJJ/pcZY9B1SN4vxYRdhjGDue+LFrnqbGZRHKgiWx/Df?=
 =?us-ascii?Q?Vf/iuaYmuD3358YBMRvVQRGtRFtwlEqghTxtDJniWi+GuF9CuOJpsluzYs3x?=
 =?us-ascii?Q?Bo1js1LucI4rmPEHZ8pTx+eqfYt2kYZHMQiK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(376014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7wY05shAgxiwXMhfeHx8GlPG2gfI6YXl78x/0ePRZNlUKp8hpSvaXvCHc4+K?=
 =?us-ascii?Q?AeLOWMwEr57OmxAX/v6JQ7cO1yeeOBHcn46U+I7RDTzwQxr+CS7JBAZtJDAe?=
 =?us-ascii?Q?o8cqA2jbYX4kh8VXu4pczvpZDukdw0krp4uS/RTMj0Fyka6uCcd7oO2IT7pO?=
 =?us-ascii?Q?w8phKAhDsJSkezHVbDCFx7H2iBbzyAqTah0n7Z7oSmpI5ZpBjtZwV+ISd/O0?=
 =?us-ascii?Q?DqngMNyfYUj97lGXFHmi80EO9gHDOwy8RJwZ5CIBTS1MOzhvlk20D7aNsRhB?=
 =?us-ascii?Q?G40X4NtBWwt4U4/RS1J13nKYWgCOX4QkEhCoSGB2lqsP5JgdcuhFYMQ9mze6?=
 =?us-ascii?Q?MFSZMKo+faGq2Sp31EVuZa2NQWPigedSKqQoHDrWGwfCwEGwpPW8iit7yq51?=
 =?us-ascii?Q?zblYC0PVZ4Yoeb9hq0QZKphHUINIBP8r8+2Jj+WB3RDZaSrRdrlfe/omL3Uj?=
 =?us-ascii?Q?MvMWG6JiS3NpRBFuapa6o1obNFKZfCGWxG+92ptz63JOpF1cHVI1J4gitDG/?=
 =?us-ascii?Q?M1VqQfCs0nCo9T1w79+9iVfubcWmZAioiIdzRB35N1LkSD9zLH2U5gfRRGYz?=
 =?us-ascii?Q?/sUzH+cHhhbCxcP5Xp/MuLsooKioOo523zgDaxwkd28fLAJrJ1nXixZfh4h6?=
 =?us-ascii?Q?IolV7qSoejcW2MigGmaqODNZxeHOzqaz/zAgZiPoLF5SWj5mTURids30OsCD?=
 =?us-ascii?Q?gaii2k7AObI8F4Mn40z/H68s1GitGTkQGI53NZ6qg3u7w5V+piLnTgUzYvCn?=
 =?us-ascii?Q?d8Vw6zVU1VDAqZ325p3ejIzF7G8+hlmAr864VMlcr9JPz8zpk6B4mHfXAcRG?=
 =?us-ascii?Q?BGVmAjRyqZ/xY4DZwWl0GEqhcKls4CBT0luNrLax7Vv2eItUoykChP7uqx2a?=
 =?us-ascii?Q?U7/W4AXLJcbw4LpEaQIpbY715nauBx4wp5KJKIwhFqRRegX8uXh5Iu28X6Y6?=
 =?us-ascii?Q?B2MFuXW3OJd4xlMFd2ttwKQrFXXZOmOJSa74xnAUrHzM6uPLrxCESPv3Xs3I?=
 =?us-ascii?Q?dENP1M/aj5TqCRbtGW1AUz8wcvSDqngriUan7txMYcd4oh1xZJKDKE9ygElu?=
 =?us-ascii?Q?B+AXMY+Zdp03LCkNqLpwUH30wKS4/7guIzz70Hlo520hhOh1RiaYMIRw4V2c?=
 =?us-ascii?Q?v4sgoI2qR6E05WWzJ5RVN7cE4Pl6VyAw85ssM0pCLhxtR6YswHpQf2JrbuDg?=
 =?us-ascii?Q?/QE49t5EtmcPPwt5n1nOUoTJ/OV8wgWD0Zn2eMZRduV16Hn6Fg0z4LIpiyPJ?=
 =?us-ascii?Q?Kqxe7O1S+RPGQzKn3W5lM97rqZwr+PXeaEkXMvLKH4pH8+wIcvdoImaSNouv?=
 =?us-ascii?Q?jWc8t4hEvLI91UsCQe5voW/tpvon+UUmfooF6upTMAANolbJYtZV/y+UDjx0?=
 =?us-ascii?Q?t4HBJkTmQUCMAEfAYxj0ioQynV/xySq1R+Btaj0K+6HXbJlmFlBOUXEROO+Z?=
 =?us-ascii?Q?78/O8OQeUs692DKjWh6/CUyaqhq460TcMXYnD+SbZrhPj+yE0oMOpG80G0Sf?=
 =?us-ascii?Q?k3Y/p+8guqeGtbzxMkb1yWE3Jqwn8/HZnBys48oQ3+vt1sh716WIzQw7OUfT?=
 =?us-ascii?Q?oLWAiMcEIc34Sa6wl3zfQJQ0XRM7CZfZn6VpbzrR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1773743b-5cc7-4bae-d4e0-08de3cc517f8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 17:03:54.2762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QG+ItaaO4NvV0iU1dm1TAujzcQfJkTW3JDUNuTVSFa3LEBzmS8p6EtzfO2aacqhNTOyAGVS6J9NbkjLOH2iWHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10571
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_160844_544991_A0B5F30F 
X-CRM114-Status: GOOD (  19.18  )
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

On Tue, Dec 16, 2025 at 06:56:36PM +0200, Adrian Hunter wrote:
> Enable MSI support by using pci_alloc_irq_vectors() to request all
> supported IRQ types.  Do not call pci_free_irq_vectors() because for
> resource-managed devices (those initialized with pcim_enable_device()),
> IRQ vector allocation is automatically managed. See
> pci_setup_msi_context() and pcim_setup_msi_release() for details.
>
> Note: The current documentation for pci_alloc_irq_vectors() does not
> mention this behavior.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V3:
>
> 	Enhance commit message
>
> Changes in V2:
> 	New patch split from "i3c: mipi-i3c-hci-pci: Add support for
> 	Multi-Bus Instances"
>
>
>  drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> index 8ade911e3835..0fd3587671e1 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> @@ -203,6 +203,10 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>
>  	pci_set_master(pci);
>
> +	ret = pci_alloc_irq_vectors(pci, 1, 1, PCI_IRQ_ALL_TYPES);
> +	if (ret < 0)
> +		return ret;
> +
>  	memset(&res, 0, sizeof(res));
>
>  	res[0].flags = IORESOURCE_MEM;
> @@ -210,8 +214,8 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>  	res[0].end = pci_resource_end(pci, 0);
>
>  	res[1].flags = IORESOURCE_IRQ;
> -	res[1].start = pci->irq;
> -	res[1].end = pci->irq;
> +	res[1].start = pci_irq_vector(hci->pci, 0);
> +	res[1].end = res[1].start;
>
>  	dev_id = ida_alloc(&mipi_i3c_hci_pci_ida, GFP_KERNEL);
>  	if (dev_id < 0)
> --
> 2.51.0
>
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
