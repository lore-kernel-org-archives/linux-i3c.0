Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596BD107636D
	for <linux-i3c@archiver.kernel.org>; Wed,  1 Apr 2026 05:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CI160t8gwYH95JSAKxFXR0sIk+MdA9RblW95YUGb3gY=; b=ZAPkHDBtvWstcR
	WwrDn0R4NPJ7Wo6WeeVH9eKPuU31msC802ww9K6eP/zHM9hmW4Mobfd+7iqmeVtP83YQZe7mmzxtL
	qWTcJtY3ytRa+Xu3ttsThZRAKx9WghKF/jGbv0IRkQRT3WpkhoHLOnpa3D2f9MoelpNn4W16j/0Ox
	8P5uCCgD6Mz/NO6PVXfIbD9Oq1eO1vs6yzYFIvG1I5tn0YEageMz212tMhAU5S7zd4aFUnex7OHI1
	dlLdNy49bBnnUEJoioh1EqTqaEsZ1YaL5SBKowpfhY96TbyZ3E9kz57vLpx3UYQnaicWC6hcSCh5i
	o6B/QPVIk1C8EAtShPiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7oWb-0000000E4yX-2xxs;
	Wed, 01 Apr 2026 05:53:57 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7oWa-0000000E4yQ-2dac
	for linux-i3c@bombadil.infradead.org;
	Wed, 01 Apr 2026 05:53:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=9C73ehkxJLhORm80XGUVtaYQRzuxNcQaDeJCmqTFvh4=; b=XJRhRVUQaC2AQi1Lc6H/nECfYE
	f2TjVEn8XufI9iiUAAv0mYZh8v12dPMzAKpHtrKYcR5oxqHrSgd9RmKkBzRq1x6eNyxj+zXHsrieb
	nWtxVhFl9f13VQkXYoRKHrYf39qO78sTz/KXoWKnIToGwkClSDE5kXPcNy+XMQWX5LKDDczjFHSiL
	6MgJAx5q5cQ6v+oudulMvAu1lZw99p1e7eqiXUPXU9C0Fl3s9O+4Dzf4vyrCmWiGr0cKq9TWnVy2l
	oVYvAHO3hQzGIBiJxlZsdobhMqqqK6D7WzHXUvrBA4er9To9PdrXoRoYg7lZrExfFKuZnynqARD0U
	PadsD6vA==;
Received: from mail-koreacentralazon11023088.outbound.protection.outlook.com ([40.107.44.88] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7oWW-00000009ptm-1m87
	for linux-i3c@lists.infradead.org;
	Wed, 01 Apr 2026 05:53:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GHZpj06aWBCMdmb0vOxWm9A7LjcaIiDuZI6/SUE0TYu0MhEV8RxaWjvxEDd/Hx+ljsBqFSQzuH00cwYiENmMFi//D3u7zsVnVWtF+mH6GGQRAprLp5ZKlAkP1Q8+Tcd9PMFI1Avm8N86daovosGH8DzWM7rr0Uw327QlDi1gTFFuR22LXPKVxkF8C5jjARckX/IHgXyEkJVSqSEO3zhEWbQgkU2lBqopjKVtVFpL9cJivIq8Q06WLosy36/U+I2ycyY/6C4Ham3M5JSxlMaW9PiIkqqM+aA1zac/+q7fF2a6mgu4Le0wfK2x3a8zP6fTkb3jbNj5wxoO3BYwxVMOCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9C73ehkxJLhORm80XGUVtaYQRzuxNcQaDeJCmqTFvh4=;
 b=RTO/okdjYdahy8s2nGLUTU5E1xNCv5a15U6tw1yPRT6eCquPlQ/ZhMGZFyXvXG91Fp9MKyL33YP5tbjcgx4LbIOCgQIQ3GR1TBJcdrxEPQxm7ZloZvImwsrVzZ0VmWm5UOJWTTzDxST170zvqWdaBbQ773PBZE8Poo6ZphHgBaOUduoN1HhX7an35dd9SPwLmbO2IMGMyZZvOa5YpRDLw4se58O8NzjkNHZ15Ru+8isfy2YIUCe5//wSFcFfYAHQc1H85LL+CNifWimCVDUmzXdr4zlpF/e0eox0R01KgwETgu36TksjgB8EYWSZohUpF2RtaJ7m9y77LEhWkZj4Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9C73ehkxJLhORm80XGUVtaYQRzuxNcQaDeJCmqTFvh4=;
 b=W4wZKy+3+Deux+QeFM4bA/QFec6TBWQL4CBN7yD5U7c59eSNP/bEUGLJ1MH0yW4QtqfXETMBfIQjiqe04xJMNZlAtvvIX2eDdWpQDCxwSAwKCZ490nQJvv6ThnyjfR/jzJD8TCUszOPuLbOP8h9Fb2vaVqTkQbfIuTwa1V/P5pa3Sg1c25xSJU8RFmakm4TaTamcYUKdUco6V/GZjPGvnq67mnGqP/+5LyY219BXW/H3xo2oK8rl5uRm9q7oD1O2tOKS5NVi/MjNEnz71UY+jMPyU+PUs2FEdCWZPY7mqJ9sYTMKU2N/cRtGf3qMFCLACFSQ/HmV4S7saogoB5x/Kw==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by SE1PPFF973AF9A5.apcprd06.prod.outlook.com (2603:1096:108:1::431) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 1 Apr
 2026 05:53:41 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19%4]) with mapi id 15.20.9769.015; Wed, 1 Apr 2026
 05:53:41 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Frank Li <Frank.li@nxp.com>, Adrian Hunter <adrian.hunter@intel.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, Nicolas Pitre
	<npitre@baylibre.com>, Boris Brezillon <boris.brezillon@collabora.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i3c: mipi-i3c-hci: fix atomic updates to RING_OPERATION1
 register
Thread-Topic: [PATCH] i3c: mipi-i3c-hci: fix atomic updates to RING_OPERATION1
 register
Thread-Index: AQHcwQen7pXcASnLYkm67zqKFCJtKbXIu1uAgAD3kEQ=
Date: Wed, 1 Apr 2026 05:53:40 +0000
Message-ID: <OSQPR06MB725226DC6D102631B4D3E3A28B50A@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20260331-i3c-hci-dma-lock-v1-1-708bc5848381@aspeedtech.com>
 <acvg36HWslcwTFht@lizhi-Precision-Tower-5810>
In-Reply-To: <acvg36HWslcwTFht@lizhi-Precision-Tower-5810>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|SE1PPFF973AF9A5:EE_
x-ms-office365-filtering-correlation-id: 44d41969-8361-4247-b4fc-08de8fb306d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info: wu8KQvk6CAPyM9R5XM8u7qLMo5JsknF03hMsO4jCM8HANkLmj3NrRao/lZbRzh6T6ah3qZxWdejSYJ0tSfAY5CldgNXs7hJQHVgSMxACNS3tbE2g3L0HJfl7mhpyTRujUwnAWHblmXBM+0jnC6t5wkqovbNcqyya1L+ufn+dgVnzZW+oJHh7GATfGro6DRNAV7smVEnVS8luS6BoGybJBN10Ym1UoMYQemj5Vl7zMcXS1L3E/ZTKKsimDATzIEYYRhQaDL+YX/iNtS2dmW8fsH0j2IUeUF/qxGmXYQsLFOtCcLV9tXB5pDq3bDBpMvRhH9I93S5xV3nqfo5lMPk6898k9GjHpZPPbyQjwFi8v7oRMiJGAnq+Cup1vl9ranEcanjtqESBdxbkWj3RKoWZCQfKGiTwEHdtcp4326Y2p/+IIxWttdT3FX5/kjFcAfqfCTPbAjpzWTjEszOZ/74WiqjQgL7cb9wjK8YqsCPyueVnzZ3HddDGbf7U3i8a6ayC/CHgDT81VzIAWOJhPci97mtTBqNbcOeytMRIN4wrJh5DVAYXPx+87g7fsPMegd8eXNm0ooWh/uE9RqCKkl6053ShInbt0V5kDfzRLan9uqf2CnjFa3ouo5rj7/GCIPzeecMJFnp1A9GdQopLtw9o9U73AH4owLlw/ocDBGDZWJzmjpmRrR2ott3y5JblpuvNvFxQEFv9VJHVV665PRNf/1RJLyx6P7Pvpn8udj9HHGMQJDR5tMA7qjgAVG9AxnvSDF0qqH+WwTtHN3hH3gc+A61kYxM2auFRYUB4fvcSVG4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?sBtf9HhM1Kq7Qz0lDiWm3x1V0pSgJdHy44yKudaWvxGE5yZxStVL0h9wcx?=
 =?iso-8859-1?Q?ipVT17bRdGcRsc8K+j8aMca4XDZdT25agTUpi/pzpdi4SFBKMAHohlH6Fv?=
 =?iso-8859-1?Q?Q1EnyzPcpftSHD0cqRoiXg319B8WfKLdgQrCE0q57wRPOWAS/En8TE5G/5?=
 =?iso-8859-1?Q?fEBL1nQgclZcHcV2Oxs/ji8BWZblMXcxpvhftfD8fnGrxkwTAVgN/IXg1M?=
 =?iso-8859-1?Q?nQVS6hzHsVJgGRD43Uk/834V+qddyY3Y7e4NbhP62CDw7xoJiXreF6PuCO?=
 =?iso-8859-1?Q?Y+MkTEEUHE37IqS8ts1E3HvYyfriVSKs90S/ZNvtCBF5AmooNrm1F1zPBQ?=
 =?iso-8859-1?Q?CBI3I+b0cOOzHQ22dL7yikRGUSvkfTNzE2HD7GH++PH2sJ1F4mVuKtkfQo?=
 =?iso-8859-1?Q?usASjT/6jpAdSdI+x+yHvxfjOSUOAwu8xFvs2oCzynMjbSIA7Q6wnndWox?=
 =?iso-8859-1?Q?l7h6X4IJ9BLxdJOLPcLKW2i4jmqpKIcSRCJbZXF5wVKiiHofM22HcfYJAd?=
 =?iso-8859-1?Q?V5a4cK34KIfStlUBJGNiTzVuPN+d/C8TiG4Lq3SKd2h7fJErPkXWi8Ekow?=
 =?iso-8859-1?Q?ZCttvfDfNKDYMum/NcBPhWteH5IMJqeftI1vSs2N7QZL+KXvw9Rsdjz8hR?=
 =?iso-8859-1?Q?Q84HtUl4pwQ5ki/GI0ybPL2cZQXjsH6XKNX+FoscbiWSvpyVdQ2W7Z8Ywm?=
 =?iso-8859-1?Q?zPQZbQ6+CFTbJarkp7CQZaHuemkb9sV/PaKsQyd9rYdq8kf8mlrmV43tsS?=
 =?iso-8859-1?Q?MAIv6NBQgSqADlZdFr/jHc+U4oHux8IzzHqKt4VSSAbmI9tOXi9KCr5gAS?=
 =?iso-8859-1?Q?rQHVzIVcEgtPtcxIYg+hS+SKwTt/M/AX7VLDaF5ySqyexjDMbguMLmO3xR?=
 =?iso-8859-1?Q?T/QkZDGPFQ+6HeSPzi8cF+sY8liJWi4kIUGLs9p7dbXoiMu1uwGLavqS4y?=
 =?iso-8859-1?Q?LPS6/jQ8DPMtClOs3cqn+M3FcwzMxfJ7Hy6g9sOssk7O+gLpFR2hbZF2Ud?=
 =?iso-8859-1?Q?AKFwlDgZpSLLV4rMMcqOZDJVnQn9xnCf3LpvjHpH8GbSxpM2vJS1E+NoIc?=
 =?iso-8859-1?Q?fMW5H8A/eRwXW73eSkyNkwtKAufvgVvHYG24RLZ1tNCAPhyvEbG1isKzua?=
 =?iso-8859-1?Q?/rjXG1dmwxUHg5JQqNvIV99A0sOdIQNmJufXriMKAEuq50QVYuF5AJSErO?=
 =?iso-8859-1?Q?+t0Q5JsFGRrGWhJXQzZCGpGTsILgsKVz52JoDv3r5RQJFtNPmPYTY7vYtw?=
 =?iso-8859-1?Q?93S0wIhOWTSerx5o0yJ+xJUQ+JbWxGSTOqNphJ2tvzQDw4BrLeses3ci4C?=
 =?iso-8859-1?Q?LaEw8qF9D6erzwzz/3dBPPz/u1tQ2G05uePrvita+V0vfCUmpARz+7p4I2?=
 =?iso-8859-1?Q?1QG7aUTEBVU92PwshpczCa3CsDqORmkUVPwylaFydt+VswBC1MqSHWnKk7?=
 =?iso-8859-1?Q?iXOKxW0SmoBATK+N+U/ermSCJ9jQ5meygqxFuuzZnQ3IXCmbZB6/CXd5mB?=
 =?iso-8859-1?Q?DhWIflfboOOsbYjvQiv3+AqnWBRRen4ljaY3m6JWhewaOvLgbesB79/NgR?=
 =?iso-8859-1?Q?PwlHrkIWiSxQaZOEP5tWFSNZTsKjez4dHEYscmlPBGh2opQ0IMrb4UjPmE?=
 =?iso-8859-1?Q?4CtabSNBYjpeySwCyuWMvaVJLpnADlYYZy4ct2SDumBRgDn0c/zUHGV7Km?=
 =?iso-8859-1?Q?DSv9OEIbuR0RTJS70Kn2SoCSDh0ImVInG0volmijCLuMvT8vmjOdehQWpp?=
 =?iso-8859-1?Q?Asx+TIgcmqzcXKn16Gny02hUS8y4/eH120FxAKC8I95HOvqT0H9hs3jny6?=
 =?iso-8859-1?Q?+B+ydCogXg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44d41969-8361-4247-b4fc-08de8fb306d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2026 05:53:40.9630
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /OuL8mlIlv+Nx5AovI8RRpqJYZXKBf7utPX/8vkgTx2aRftzXgTwHFZfitIWylSYxWOYTJ2Gp9l2Y0IPlGa5fx9FVFG2pILjNPFyf2o02IA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPFF973AF9A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_065353_006332_9272B378 
X-CRM114-Status: GOOD (  12.97  )
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

> > The RING_OPERATION1 register contains multiple bitfields (enqueue,
> > software dequeue, and IBI dequeue pointers) that are updated from
> > different contexts. Because these updates are performed via
> > read-modify-write sequences, concurrent access from process and IRQ
> > contexts can lead to lost updates.
> >
> > Example:
> > CPU 0 (hci_dma_queue_xfer): reads RING_OPERATION1 (enq=5, deq=2)
> > CPU 1 (hci_dma_xfer_done): reads RING_OPERATION1 (enq=5, deq=2)

> Add Adrian Hunter <adrian.hunter@intel.com>, who add lock at equeue.

> https://lore.kernel.org/linux-i3c/20260306072451.11131-6-adrian.hunter@intel.com/

> Dose above patch fix your problem ?

Thank you for pointing out the patch 
4decbbc8a8cf ("i3c: mipi-i3c-hci: Fix race in DMA ring enqueue for parallel xfers") from Adrian Hunter.

While that patch addresses the parallel enqueue issue in hci_dma_queue_xfer(), it does not fully
resolve the race conditions affecting the RING_OPERATION1 register and the overall ring state
consistency. Specifically, I have identified several remaining vulnerabilities:

  1. Atomic RMW Race on RING_OPERATION1
  The RING_OPERATION1 register bundles three distinct pointers: Command Enqueue, Software Dequeue,
  and IBI Dequeue. Adrian's patch protects the RMW sequence in hci_dma_queue_xfer(), but it misses
  the IBI completion path:
   * Missing IBI Path: hci_dma_process_ibi() updates the IBI_DEQ_PTR field in RING_OPERATION1 without
     taking the hci->lock.
   * Race Scenario: If hci_dma_queue_xfer() (Process context) and hci_dma_process_ibi() (IRQ context)
     execute simultaneously on different CPUs, they will both perform unsynchronized RMW operations on
     the same register. The last writer will overwrite the pointer update of the first, leading to ring
     corruption.

  1. Unsynchronized Completion Path
  In hci_dma_xfer_done(), the patch 4decbbc8a8cf reads rh->done_ptr and enters the processing loop outside
  of the spinlock. Furthermore, the RMW update of RING_OPERATION1 at the end of the function is only
  partially protected. For full atomicity, the entire sequence from reading the current pointers to writing
  back the updated pointers must be inside the critical section to prevent inconsistent state views between
  the IRQ and Process contexts.

  1. Lack of Protection for Dequeue/Abort
  The hci_dma_dequeue_xfer() path, which modifies rh->src_xfers and resets ring entries during a transfer
  abort, remains unprotected by the spinlock in the existing upstream code. This leads to potential race
  conditions where a completion interrupt might attempt to process a descriptor that is simultaneously being
  cleared by the dequeue path.

  Conclusion:
  My proposed patch provides a more comprehensive fix by expanding the lock coverage to ensure that all paths
  accessing RING_OPERATION1 and shared ring state (Enqueue, SW Dequeue, and IBI Dequeue) are fully synchronized.
  This ensures the structural integrity of the DMA rings under heavy, concurrent I/O and IBI loads.

  I believe both Adrian's improvements (like xfer_space management) and the expanded locking from my patch are
  necessary for a robust fix.

Note: My based branch of this patch is i3c/fixes.

Billy Tsai

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
