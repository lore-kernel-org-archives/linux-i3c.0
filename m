Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B94FC5321D
	for <linux-i3c@archiver.kernel.org>; Mon, 26 Aug 2024 04:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uJpgsNs98Vy+AXdNB1Z28pi1eA9qwAj3ujFIR5KzT9E=; b=Wi3/2XxvH23He9
	xKy+IEg1XRfiBbdpYRXgKhw+vAxZBy12cGd8CB7N9BJz8A59lIc5egK/q/uk3xltcaODIL+IXfaov
	zolRyftlEmpi7onAmGklHIv8951Ga9s4gK539C+B7gcios6tqCzn/Pap/cFng9Z04C7xqLLk4IXw7
	95ENJpIkaNaLwSoBY5zyZcd8a1GNQntqD/24Ecrod9iOEhcYSbiN2h8BZxbmyVRKYHEKgV/Hw7low
	q7qT1qhujaqxQM2qWrzmafiznqfK+DCvuyL50m9FKB+zia+4IUVHB3fhhAVgj73IFodNAkjyGqyVr
	tb5q/nvTu/yiuzx5CHVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siQwL-00000005is7-3Ekr;
	Mon, 26 Aug 2024 04:02:49 +0000
Received: from mail-eastasiaazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c400::] helo=HK2PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siQwJ-00000005irI-18ri
	for linux-i3c@lists.infradead.org;
	Mon, 26 Aug 2024 04:02:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vm8+buEU+spOwPoBkjsQncqgnGYSwk3wf3rlNWEx7JRxl3L2Y3nJ8uM1aiVRdlwR23bTXVnhTL037T5M/m++RZgD6tvmcLDsnDOzYXg1CQ7SanPS8ozwOWS//lv8FUVbXFSZy6U2cG+ripoEvPmglCKRvvOk8GsrSZqeeMfe1hoKjhkVBnlseuWmm5HVaz3Y3UuZ4qDFY8N0U0toBYaGap25ORfrcRI8+VKN62qlNVbQIzFyx8T7U+8LdpdbBO1D/HL+jVjaNl45dz1HTL26S0DlYW9nUWnU/xbR49vvET+bzHoolii7O3iTx3rGyWiBZSCyD86HMC8GV0VlKnpsdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y7BjIWjbq5wh6DH6CX3RJuKET0NWxxfbiznQz6EpEMQ=;
 b=UcrSYCiYEYGA+Vmb0DDkUbRH413NF3PP9Ao/h4E81Rk/2kwIhiFeIjECQTHjAQoaOtHVQb8QlxXPOepEkUDZqlEEHkon08KubqjwRBbnurWVFtOnaqr6IWYarpFH12BkpYOix3ZO6tT9ciDbpzB+EMRtMCyoIJt4XlVIkaQTLjonJ3C7nlPd430C9tEYJo/6J6ntae4UU+DpjAF21QU8X61f/5SKp+AIkHTD4m5Pfs6+uXMpmisKmEFEZTJ7vWf3tv8Z/jA4XotQL+huKGLqQh1awwoV0QggSUIy2ywGuaXpaw2PXZzwhU/YSk0MOjepsBxsjM0mAkBEJhEfhXkuVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y7BjIWjbq5wh6DH6CX3RJuKET0NWxxfbiznQz6EpEMQ=;
 b=YYnV5Sf7OeB82elP85aM/uLDQ9H84nmg9GaULmbUPsBvOtI7v8ROiENsoWKa4WbVZ5SpvjsRbB+Os0JkEO+YlVRbE4QKqvEx1h2E2sGonZ7aRKRhi5qmzo+QR1APAvJ21zNXUOGMMqLiAPOKv1icbXzttQFm3LaoIuWX50pc3LMchDuSOqqnYiTqqukIejCFBSNV6zTsshK8S+MzmC8RK+78qApZfAPeUVizKmSBnaaPEUdZC14Fwag/4aPRk5XJCu6MWX2kqaV7o3dsSTSJ4jBxhpkB8Yc1wojwPaIoL17bLiGRuV7qVzTOR+TuEnXPO8aiIlHKs1bqEcSutzWxLA==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by JH0PR06MB6535.apcprd06.prod.outlook.com (2603:1096:990:34::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 04:02:38 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448%6]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 04:02:36 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] i3c/master: cmd_v1: Fix the rule for getting i3c mode
Thread-Topic: [PATCH v1] i3c/master: cmd_v1: Fix the rule for getting i3c mode
Thread-Index: AQHa92luFhaBtkW4zkim60IDu6KoKLI46okH
Date: Mon, 26 Aug 2024 04:02:36 +0000
Message-ID: <OSQPR06MB7252463A7C81BF18811DB6EC8B8B2@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20240826033821.175591-1-billy_tsai@aspeedtech.com>
In-Reply-To: <20240826033821.175591-1-billy_tsai@aspeedtech.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|JH0PR06MB6535:EE_
x-ms-office365-filtering-correlation-id: dbf8d73b-296e-43d1-1d64-08dcc583ebeb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?+46fWiH1BRji+56B/nthaG79ZOobUcabqTBRwsHx71n5TkqTNMI9zQF5K9?=
 =?iso-8859-1?Q?eMNNiBHsRtdIU3EuND8GIZvSD1NP2cPAwiNRIhge0uz1thwgwMWY27zGsa?=
 =?iso-8859-1?Q?OAdMsZlpop1sJr3Svq0RUyBAcH4+ObnytmvEskpFOYhRPchk+AEbe0bMli?=
 =?iso-8859-1?Q?uBtez1OCZ51l2SOxIIrRi3TVy13xgdiQqnx/MmxFGwuoFUvxpQpOplabLE?=
 =?iso-8859-1?Q?kZQ3FDTXwiTLKOSWutV39f3H+H5jInPqh5xITTssQOxv3C3LWMylIA+jez?=
 =?iso-8859-1?Q?852Kb1cG8HL9PmnAp17nmEfCqODT0eKu+zhfOaZVNVJnW+zcLyGSlZ7QJr?=
 =?iso-8859-1?Q?EAf0C1sxhFRwKNHbtfhqsdCwOfgHug/XZQdWhx0WB5j8Qc7kYvwqVMhZon?=
 =?iso-8859-1?Q?3sMfejIEe8i/WJEqvUHm78VVt1pmtYHq9NnwalcmNrfm5bR0/kX6/AxeGy?=
 =?iso-8859-1?Q?YUweAkSQQa7EGjhsb0iPJrH7mptVf69cgHz6i6FQoCi673TL3sUPl6sruR?=
 =?iso-8859-1?Q?ssPqgD1b0Whom7V9CiHT509bKeGRiDAl5mvnZhRjtmodKVNr0la60Dmk7A?=
 =?iso-8859-1?Q?6ckonaK8hL3LcdP+ccdjNGIlZzZ/f0MShGzixifvjz+tcLM8jFYTuOpjOK?=
 =?iso-8859-1?Q?qtaCLIrnvzRoIlXYYQyVmeYoadFz4P6WFUYPTKQz1mumLu1kC/m2vQMVY2?=
 =?iso-8859-1?Q?kqdKLSo/a7WSl65alUwBt3g/yWLqvcMqbCd2OKM75opDZ91aqdFrO4Bnm9?=
 =?iso-8859-1?Q?PAJQLp3J+vQdBrY57biwgmFa5kfRVsJId5xowJbFy3kAhsIP4bg7RkjoLc?=
 =?iso-8859-1?Q?D0OBL/WotRGjaAfUaIGVc0j0u3bYKAKY+pzWBruNq7RVKwGwrTsTsYw3jP?=
 =?iso-8859-1?Q?UZItc3u1MLlVEfytFg+SY9npivJyjwRbwjdsTskDjmIa6vO5bmKcyv+iPK?=
 =?iso-8859-1?Q?wr4yqJGLvIsHDIV9x4/jx0yPnSmuhiVgLuxtJfuuyj7e5td81DoKRi8tmU?=
 =?iso-8859-1?Q?epcax7RR4giT8KezCzIQFGKwehdwrvM+qw4Z/JQ4UgTte6nJBp7E+yXL0p?=
 =?iso-8859-1?Q?F2HXnAf3FirTc7Qyh2s5efR01s/2dTF1rjkGNuR5qJE0jc5QJfvTTEqL5N?=
 =?iso-8859-1?Q?Ax3aqTdkdUQHIRCYY3wZqDejYPUWqVvPovKE0TOcpX1d2jDeoZ0N1SnYMu?=
 =?iso-8859-1?Q?0v/T6n3LW6ReTqrOrA0fCX3RHy8Lq5RlEzm1zeFtb4bqJg9oDRowBPN2+t?=
 =?iso-8859-1?Q?+jkzqxrnvk3Jq4w7MuscXdL8DTocK6HvwroyZz0D24XJfZJBn4RIp3gYOR?=
 =?iso-8859-1?Q?NBMre/9W/PCjGbQUiuLZwu3q36WLMf/pUq1CO6zN3Hn/qehgiY4WAUaJMF?=
 =?iso-8859-1?Q?Q2LJabjKSWfwjTmU2USXmZ/zJw1iJj/Vkh73brTy8gGIBLIuDtHgX1oeBk?=
 =?iso-8859-1?Q?ETWGXy2i0ZxUZQYfbm5yCE7MKVy7g9o+9/qToQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?45gnaIdWqJNNSQbhBGdmAG7zDU+VCa7WnfvftRJWw8cfa59kt5mYloPVaD?=
 =?iso-8859-1?Q?+TTa39KnfqWJRnWyb8ujcZisp5ivYckrA/3adVpvnrZbfuAAuKXajxFhXz?=
 =?iso-8859-1?Q?SiaucA03OMbuJXtno439knKpm4JG6e2jAXcqJTkQxya2pBPJ106uEddHUi?=
 =?iso-8859-1?Q?KHaS61ACURDuf9KudrhRVqHx6rAIYZZ4h+Lvt9JwYGjhgr/XW+SghYQEl9?=
 =?iso-8859-1?Q?NDD+qJpvRyi5XgtHCOhsO23qhsdBRq4cDFuvISJStLPgs7tl8cy54g3VbX?=
 =?iso-8859-1?Q?m66cV9SH791rS5bhJnNX2VubY4nbMPDDMsnm8sKQglmeDpEGhBdPKHa4mE?=
 =?iso-8859-1?Q?Dig49mXcFeCTApd3DEaoXKW+KvauVvG998UyQzA30hb1XoiPX3Yp4hlL7F?=
 =?iso-8859-1?Q?v+0AzfRfufIGKKMkkQymMZ0fYD0HWoZ5Vu20M7dwlB+spTt4WWQpa+AH1M?=
 =?iso-8859-1?Q?/3VNGwc+PL35+lcSAqBLsm5qYNgU1LhK0WkZiP2BWDoBMKz4Fati2W6tGx?=
 =?iso-8859-1?Q?hP7CKPx76tEsaBNV3sCStdJ/POGN2NWGieZt3wrQlzhd/EjNQ0HGj1UYF8?=
 =?iso-8859-1?Q?b6uPHnHoqdG/fNv+f8651dQrc/e9Zorw7k6mSB76PMTuWHGlX1yIsT/pIW?=
 =?iso-8859-1?Q?AMJ3yo2HhXZnoPS4YSr26hpTVl68xofPErVggi34YNkcNSBwqRrBmJ96EN?=
 =?iso-8859-1?Q?jc5LDHwBZ6zWKlwBlql2Z/SG2/No3VsUcB6Mx8Bj83vqnHHaZetaNeqpXr?=
 =?iso-8859-1?Q?SDdCubhJWvpyzBkqjIqqFxKz8P8A6G2FRRPARsmKFPIIjtNdIHgVr7sz86?=
 =?iso-8859-1?Q?rgpat8aa2Bcg0cwrSmDR/nyzYsyRamc5/XwKiRfgURWegrtl1epYnNdM+s?=
 =?iso-8859-1?Q?0/L2gdHDVPee0RzEYdlvmFNlCCVsiPSjFACZgE05eea4j44S84zUaQKMp3?=
 =?iso-8859-1?Q?MhJIri6VSO89smke+hpXflrdAyGTzW5wj+7zzwh3fmaGAj6rjYA3JmAVIH?=
 =?iso-8859-1?Q?o4EjXsW4/h4vCV6aluYxi3ojRdgF9Hz7C/ilSfCUaLVKW0AgCjtlkKVoVl?=
 =?iso-8859-1?Q?ueMyDLOXmkKyI7inmxG/HHLjCntN8XpiZkjsN5a2GzRLe2O9X7nHTGLxs1?=
 =?iso-8859-1?Q?LuxCwfG4Qepf3FPMiZgDviclov9KoZ0bVAyyfVRhHYuZ0ZPP0drBYqRSBY?=
 =?iso-8859-1?Q?ENsUb5XlSiDtu5SX/VNAC7AzGWv6hSbZHAn+N/pswE9Riq7XsH9KRXYhbV?=
 =?iso-8859-1?Q?xVEsapgEG7BOXqyYk/DR1zEoV0zDFyu+P8hsdCDues3kwLfIyKWMtgy61R?=
 =?iso-8859-1?Q?RVWWwDWmnwmd1Gkt2I4Ung92PU/YZAJlnZEPIDRhH0r8FIaDblESPECTih?=
 =?iso-8859-1?Q?zXyPY5zjyVLsSDobudpbHzyyfzXvZ+XQ8H8Hp+4nxTd7O7fqTXvLblzRKu?=
 =?iso-8859-1?Q?qjvZe4KSgn1Uu+BzZI3OWvQG1PzBiaTNvdFqgT5sM+rItm0eFhDuJ6F6uj?=
 =?iso-8859-1?Q?RHpILusazJxi5Mu4OHCHGvQOh38uUX+Tnd3gj7nrmiWpReiJSmyogXWUSN?=
 =?iso-8859-1?Q?lN6OVQ5VCybYOXiVVyMzks2HCTz5URDuuqWj0JoOl+vvQR3Ib8FrakT0Y3?=
 =?iso-8859-1?Q?3Dy8ad4xjfUwHiHy3qAPfatMVFNqRak2JH?=
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbf8d73b-296e-43d1-1d64-08dcc583ebeb
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2024 04:02:36.9007
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ed0n+dMl2i2nRw6GJhk1+eAX8KpsWfbQ6FXrLpeAkXYDvCHiy5r1XBuZhGIk5yV8dykNyiGo3VJdvFoBA9iTZtUa9B9maqxG8ATJYQ3rKI8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240825_210247_336896_6E1B1B02 
X-CRM114-Status: UNSURE (   6.65  )
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

> Based on the I3C TCRI specification, the rules for determining the I3C
> mode are as follows:
> I3C SCL rate > 8MHz: use SDR0, with a maximum data rate of 8MHz
> I3C SCL rate > 6MHz: use SDR1, with a maximum data rate of 6MHz
> I3C SCL rate > 4MHz: use SDR2, with a maximum data rate of 4MHz
> I3C SCL rate > 2MHz: use SDR3, with a maximum data rate of 2MHz
> Otherwise, use SDR4

Sorry, the description of the commit message is wrong.
I will change it to 
I3C SCL rate > 8MHz: use SDR0, as SDR1 has a maximum data rate of 8MHz
I3C SCL rate > 6MHz: use SDR1, as SDR2 has a maximum data rate of 8MHz
I3C SCL rate > 4MHz: use SDR2, as SDR3 has a maximum data rate of 8MHz
I3C SCL rate > 2MHz: use SDR3, as SDR4 has a maximum data rate of 8MHz
I3C SCL rate <= 2MHz: use SDR4
and send the v2 patch
-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
