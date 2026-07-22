Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81524C4451C
	for <linux-i3c@archiver.kernel.org>; Wed, 22 Jul 2026 06:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VHUYgpd6xbxYPeHAyhBUrGDeOkr1EZnXjA6TE3pAanc=; b=4PQIsYP6kgfBoR
	U3N1iIYscg1d3ZhKDHYdxQHJPdVkZgnAkTDS7YOz4y+T+1Cn/s14lP1RA5C3KGGgDjO5iK8sGbSFv
	Ak4sAiqe99BxPDh3QqnOZ3lyT1p1Nqb8Umn/2E8ivRD/JOMhIwj//xJQXZL8nspxqoNFKpG02eoQT
	Ck7b9G4uzamR9OmOU8eCp2ayQB4PSbxO3NcNiLDYpJ2Qi1VNqZ9JjSownNHukLpVHV4KREEueCtTP
	C9Zeh26uBk0RKF2wwEJfU/Ggau3wYepLYa7e6dCRn3fKdCnEr7iWjAHbI0JZMjTZ5PwxDI9y16EUb
	O/F04qNMrtvadr81fP9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmQN9-0000000Ay58-00Nt;
	Wed, 22 Jul 2026 06:24:03 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmQN6-0000000Ay4a-3MHA
	for linux-i3c@lists.infradead.org;
	Wed, 22 Jul 2026 06:24:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f/XLVKd6dyrQzstcpZ7znY1ZCP1AUGAOqcxChWhBrbMm5a140oetWNzCZkgDg4IblqcimM0iLdRFcy6odoEe5TkKMBaMYKKjH5rjWK1Gna2gCvmapbUHsd4wFCyUcjqJA4cklcrwvLJEE4muRJ5m/xD6uRmzePwVZZL1UgLR/gQjvmtCb7dpzlfwowDtnCaWo4FKaTXzIaYsxbC6fv4houamqDSXVzKim43PoXxvRxYa1ic6acQzWaknoJoP9m670OnpOEWk+i+pS0755vZ2LoK35aTkbcGfuT3SF+5Hj+p9AezIE4eV6rBsURflRwIcA5Udvche6IPb1GfnlyWdpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GYlqofHBNYaLyjkKdfV/pmPpm/BF2EiyA7w4LLLL7Cc=;
 b=Hl59MO9waQkOfpiF/Hmi/xu5oBz+HZyy7zUjJGHacXUeZRH7l6grWI5oNPV0QCWUXeXrtOW//Iz6L+SCmVTj/e1TuaaonlaTpD8yd8zj7jz0JuC8sn7w+LdYTCaLm2Cp/B9L7Hscj3fcFTlS7kIOzOVUfG9J0k4SAPk9l5tJQv6T4NfqSN6fKWn4b9BlaB8nLvdbTW2BUKRmVKrfQR41YfFytB47GDxc1u0DQ6AuoYbv7opJlmzrkLZM1SbGkZn0PZIyS26hA/nhMLIPSgQsZpNOZePPHdKy52KMQ/LZMJl+ff1g8zzcigDToRKz3uVGpgQ5DrShQo8a2MHAKaE5Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYlqofHBNYaLyjkKdfV/pmPpm/BF2EiyA7w4LLLL7Cc=;
 b=gzUEA5BkvWwihJOlx3tEsW7G8FnxhujVr9/Z3gR6T/2D3WIjLKOMcFhyhykfN8s64B1RIhAZVMYG5m40rUZlO13Of22jLdPtr5w+Hi4zEF5XPgIhNHrjzd+eVUMLBgpVpPYI7RLv7L2R1pt21q9PwC8umBmBSsdL7DtphHQjDo+4YZKRVY6KamxYrzIhHHRIxuC7vPeZ4BAARmtAo+qj6136Kq4OWXydA0p/a+Q6NIR1syB4193SuIoMY1v05wvyehaC0AyP0jFkYW6yK5g8bDZFG+31sUDtJdpEo3kbS9vCTDL6M+N988Jnf2dmtOwpcUjJwUPkSJ7lnTaCSKE3uQ==
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by BL1PR03MB6104.namprd03.prod.outlook.com (2603:10b6:208:311::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 06:23:54 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 06:23:54 +0000
From: "NG, TZE YEE" <tze.yee.ng@altera.com>
To: Frank Li <Frank.li@oss.nxp.com>
CC: "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"Frank.Li@kernel.org" <Frank.Li@kernel.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v2] i3c: master: dw-i3c-master: fix OD timing for first
 broadcast
Thread-Topic: [PATCH v2] i3c: master: dw-i3c-master: fix OD timing for first
 broadcast
Thread-Index: AQHdGMF+diNJ+Nb2rEy5RD2NnsH4obZ3VeMAgADc5oCAAOEHgA==
Date: Wed, 22 Jul 2026 06:23:54 +0000
Message-ID: <36e4769d-3f7f-4a28-aaaa-ac5544dd15ea@altera.com>
References: <20260721033159.11789-1-tze.yee.ng@altera.com>
 <20260721034751.35EE41F000E9@smtp.kernel.org>
 <al-lM4FdoekyTk4r@lizhi-Precision-Tower-5810>
In-Reply-To: <al-lM4FdoekyTk4r@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5950:EE_|BL1PR03MB6104:EE_
x-ms-office365-filtering-correlation-id: fad10ba1-1ed9-4f46-33b9-08dee7b9cdd7
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|4133799003|38070700021|56012099006|11063799006|4143699003|10067099003|6133799003|18002099003|22082099003|55112099003;
x-microsoft-antispam-message-info: WsThP4Lp8+0sM/z3rqwjRkuyKHwJpFmep8ppWv6qXmIWgJVQcZXEjgGlGhXYA6Um1oue2/dDiZvFJzpj4xL23Loexu8W5yOcX1hH2znngsYP91P9D+haWbHa/VrunT97CE2j4LFyXIEXJ8YsunmHvSVxdjRiGCQ/advrXCnuuUJU/5LC+yCBgJMV1FU0FqmarG0b1GDI12tATqNSsdrAjO25DHmdYoGvlI8qQHIhCeEaVWXSx3P5T1nzd8dyKSiZeAnv680Hd0V2sbb1+/3HVzfjBIb7y+tzsWCpb3iWOzaZIi3+12iHUTEI7X3SSpOozYMGq2g5L90P1t8U3vOOPc0hKgM4+cgwSP5xgwbeoZZyA/Ha0vid3oRytontI17LfRPfg7JR3K42+bl+6TZ9txbWsTynaIYO5sntBlRKlAEqKrLAbZ1w7AUHqhwzTYYRMIAiyd3fhYU42weoLZDWMFlm8CYnHcYHDb59gYArTSSnvcH1k+Aqrbln3UKyl/OAfXKFUPl+zEaETDov6qaXmXDkx4dOea5sRi/vx8eB7EGvwQ382xVXu95x3ltgBFQ6aDuZ2SLtK4RHfmKd2k1SADAvUEwvZhEiE77KiohmggQ+8yFI/3NmZRcYf8R2v8GmBMde61a7P/hEfS5lNmPN8gxoduwqErB9OlGa0dWCX9k=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(4133799003)(38070700021)(56012099006)(11063799006)(4143699003)(10067099003)(6133799003)(18002099003)(22082099003)(55112099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SngxTi95RXRIWmUrQTdkQ2JjaHFtdDREb3FnZ1FleUo1MkQraFU5RHczN09H?=
 =?utf-8?B?TUtERjlONnVLMm1sS2l3Z0FTTVZQMGRJekd0UkhOTnZDbndJR1ovMTFIalJY?=
 =?utf-8?B?WnNOa08wSk0vRkdJYkRNbDFzMWxmZnUvTG1GcUtscm5xdEg1RC9teG95V1hm?=
 =?utf-8?B?N2RUeUhtWGw5QWhraHloUXFNdzcvdnIxSndndGkrd3pIbllWaHl5YVQ3Unkx?=
 =?utf-8?B?bGtQMHhjK0FNdWNFZ09qd0ZjSDV4WkwyUDJRY1diOWt0emR4QmUwbkNDQ2Fj?=
 =?utf-8?B?UHM0NGQvTzU0dUhjUHFwYWhVUjFqQ3lCSmhnRFhKNTNQSGFtbWJ3TUZHRjNo?=
 =?utf-8?B?YWdUWXRqK3FoaWhrVmNPbTFDd0RWWmUzckVub2lRZmZwUCtLK24wOFdBaUlu?=
 =?utf-8?B?WG9HdG52TWRDNmY4QTNWUDhpREVTUlkrNmdtalZlaVIxMzlpVWJQQzRHQ0dZ?=
 =?utf-8?B?UGQzSTF1T01RVDlwN0RrTVUxZ3kvVXdOcktRdEgvT0ttRlF4NlliMjBjTWxN?=
 =?utf-8?B?dmNxbmZ4ZEFOZ2dXUjRITHRYT282UDl6M0I3ZWMvdDhtKzhJQmthRGc4K0g3?=
 =?utf-8?B?aUUveTVabzFzOTJlSVRJeGZ5UWJNSGF6ZXVhcmpOeFpaQjdWdG12WGNZSHdN?=
 =?utf-8?B?c0ZFVThvQTVWTnc0emorYUYzK0h3VmRSbkhCRDFvU0lrV2E1VVNuVGRNa1ZC?=
 =?utf-8?B?ZWZ0KzY5MUo0c3htMEtpZXFhQVd3Umhha0s1UmJHRUJkZkVncENFR1hLVjhw?=
 =?utf-8?B?aHVscnVwcmtJb0tjdzN4R0RRSGJpMlpqRTA1WkRNT3RBdnM2OHNmR1dVRHc0?=
 =?utf-8?B?RmpnRVpsTEw2aWdZRFFzMi9kVm5mYzVUYjljQStmV2ltM21XSlh5Zzc5SU9j?=
 =?utf-8?B?akpDWnpnOGV6b0tnL0FhcjVLNytIdWNHc0NrVzU0bTdudWdubmgwbUtBb0xM?=
 =?utf-8?B?ZjdSSWNWajhCU0pRaDFNclFmNlNtUEg4eXErZXkwZVE4dDNVMzZ5VFIySkM3?=
 =?utf-8?B?NVdKZGRMWkE5Vk94OVBMTkxWenVVcXRkRDliTFpOUmVjU1pEcFF2SUZFRnE5?=
 =?utf-8?B?U3J6bGtXZ2FIcVVzd0V3RjdGNDdRSWkwYUVKeEg3OUc0aFZnaDBlUHF2YTFj?=
 =?utf-8?B?dEl0MEhCZ2hYYVhYWmtsL2ZOTU02cTg0NzcwQTRyQ21yRUNTcEpWR01qUzZM?=
 =?utf-8?B?amd0dEc1RUd5WGlKWHd6NWZUbHpNazI5Y2hUZ2d6TkFna3gyNTdmNGpacmJN?=
 =?utf-8?B?YWk2NFNyWGxYVjBBWkg4Tkh0eG5Pa1BIQ29uQTFKYWJnVFUrdGNhQldSTE9O?=
 =?utf-8?B?U0g0aWxkNUo3TGVtc2wxa1k2Ulg5RTQ5M2JsaUFYNjJWdTNPeHhwTitMWFkr?=
 =?utf-8?B?MDV6dEs0YnF3NXl2REFteEszQTZLRTRuTVNNTW8vTFl3dWx0ZTFRV3lNblh0?=
 =?utf-8?B?NHZNejcyNU9ZWjlwdnJxand1ZURFUnBWelRETVE2akFEeHNPWGtSRjZlYmNV?=
 =?utf-8?B?dDFSYmI2bjBmR3ZyUStZVEZtazhySERlbDZvSDVyWkRmRFByZmMzQVJMUWMx?=
 =?utf-8?B?eFU4ZHdxRnNVSlFPZTBmODJsclA0bjRVeFNZRnRxTlZoUHdxM0I3bloycG1w?=
 =?utf-8?B?NkhkOVFCVkltL2pkRlI3VmJTbndibjNhdzQwdjhreUpoWnc2YlBEbHZsN05l?=
 =?utf-8?B?aFo0MVphRUYxUGQ5MkxKbnNZcTVIbUFyQkQ4SEJkMC9FUWVETDJuNFRWS0Jh?=
 =?utf-8?B?THlnblV6bUpqSEFwR1RMWXpwV0MwVjM2Mm1HMnk4ZmFvQllzUWZwOFlpaGpu?=
 =?utf-8?B?ak56am1HU2dpaVgxOEpMa3NPZy9BNE5PU2E4TnhyTjJoclVMRDFVVzg4cHR3?=
 =?utf-8?B?cEp6L2JTUlM1YU0wYWVYM1FtNXFFdHJWZVJBdUt6Rk5tTm10bEJVRlFmdjU2?=
 =?utf-8?B?ZGtmK05SNHdLbW9UNU5VZlJ5dVBYcUd1d0Rjb1NIOXZ4Sm1ZSUZQRUFhaFJD?=
 =?utf-8?B?bTliT3MzUENtN1R1TGRmczRmSDZiOWtzTnRWS2plbytKckw2eWUya3JOK1Mx?=
 =?utf-8?B?V0IzalBNTHRIN2lkcHM1Vk5oaHFtWWFsWXBqMGlKanF3ajc4QnkxQnNLMFRT?=
 =?utf-8?B?SktTWmJXQnNleVAxd01nbGZvWVl2MjRKeDBXVFJUTElwZnNHVVZSREVzazk4?=
 =?utf-8?B?bVlOdzJUb3FOeWJUYmxqa0NPNmZvY3paZWpHMVJIV29OcmFlRnRDVTFveFht?=
 =?utf-8?B?ak5NdllrRGR1aEQwOWxNa1g4UTR4ck4zOHhyMlI2R2t3b2puWndFb2pXYkZo?=
 =?utf-8?B?TCtqRDhJMmlHL25vdHZwczBqUC93TXdPTnNlVTZkekZXeVJkQ1BaVG5xQXFp?=
 =?utf-8?Q?NKC3Y22RK/xlFLAY=3D?=
Content-ID: <42A8A27D21B9114188331F7BF68B71E4@namprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fad10ba1-1ed9-4f46-33b9-08dee7b9cdd7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2026 06:23:54.1071
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b3MpygRjc5YCo8J9dHbDb59JsdlWq4c1OlwqKeJ9lTuxULcNdVDgTYsRNHhr5BRd5KzHNuZE+EKs6iVa7ujbjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_232400_994061_2F6AB8BE 
X-CRM114-Status: GOOD (  20.25  )
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

T24gMjIvNy8yMDI2IDEyOjU4IGFtLCBGcmFuayBMaSB3cm90ZToNCj4gT24gVHVlLCBKdWwgMjEs
IDIwMjYgYXQgMDM6NDc6NTBBTSArMDAwMCwgc2FzaGlrby1ib3RAa2VybmVsLm9yZyB3cm90ZToN
Cj4+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZv
dW5kIDIgcG90ZW50aWFsIGlzc3VlKHMpIHRvIGNvbnNpZGVyOg0KPj4gLSBbTWVkaXVtXSBUaGUg
Y2FsY3VsYXRpb24gZm9yIGBvZF9oY250YCBjYW4gc2lsZW50bHkgb3ZlcmZsb3cgaXRzIDgtYml0
IGNhcGFjaXR5IGlmIHRoZSBjb3JlIGNsb2NrIHJhdGUgZXhjZWVkcyB+MS4yOCBHSHosIHJlc3Vs
dGluZyBpbiBhbiBpbmFwcHJvcHJpYXRlbHkgZmFzdCBvcGVuLWRyYWluIHNwZWVkLg0KPj4gLSBb
TG93XSBVc2luZyBESVZfUk9VTkRfVVAoKSB3aXRoIGEgNjQtYml0IG51bWVyYXRvciBvciBkaXZp
c29yIGNhdXNlcyBhIGxpbmtlciBlcnJvciAoX191ZGl2ZGkzIHVuZGVmaW5lZCkgb24gMzItYml0
IHBsYXRmb3Jtcy4NCj4+IC0tDQo+Pg0KPj4gLS0tIFBhdGNoIFsxXTogW1BBVENIIHYyXSBpM2M6
IG1hc3RlcjogZHctaTNjLW1hc3RlcjogZml4IE9EIHRpbWluZyBmb3IgZmlyc3QgYnJvYWRjYXN0
IC0tLQ0KPj4gY29tbWl0IGI4MmYyOWE1OWFlOThiZDE4Y2JiNTQ0ZGVkOWEzYmY4ZjhkNjBmYzYN
Cj4+IEF1dGhvcjogVHplIFllZSBOZyA8dHplLnllZS5uZ0BhbHRlcmEuY29tPg0KPj4NCj4+IGkz
YzogbWFzdGVyOiBkdy1pM2MtbWFzdGVyOiBmaXggT0QgdGltaW5nIGZvciBmaXJzdCBicm9hZGNh
c3QNCj4+DQo+PiBUaGlzIGNvbW1pdCBpbXBsZW1lbnRzIC0+c2V0X3NwZWVkKCkgdG8gc3dpdGNo
IG9wZW4tZHJhaW4gdGltaW5nIGZvciB0aGUNCj4+IGZpcnN0IGJyb2FkY2FzdCBhZGRyZXNzIGFj
Y29yZGluZyB0byB0aGUgSTNDIHNwZWNpZmljYXRpb24uIEl0IGNhY2hlcyB0aGUNCj4+IG5vcm1h
bCBPRCByZWdpc3RlciB2YWx1ZSBkdXJpbmcgaW5pdCBhbmQgdXNlcyBhIHNlcGFyYXRlIG9kX2hj
bnQgZm9yIHRoZQ0KPj4gc2xvdyBwYXRoIHNvIFNEUiBleHRlbmRlZCB0aW1pbmcgcmVtYWlucyBk
ZXJpdmVkIGZyb20gdGhlIG5vcm1hbCBQUCBoY250Lg0KPj4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9pM2MvbWFzdGVyL2R3LWkzYy1tYXN0ZXIuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci9kdy1p
M2MtbWFzdGVyLmMNCj4+PiBpbmRleCA4NGZmY2IxODkzMzg5Li4wNzdmMmJmNGIwYjNmIDEwMDY0
NA0KPj4+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmMNCj4+PiArKysg
Yi9kcml2ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jDQo+Pg0KPj4gWyAuLi4gXQ0KPj4N
Cj4+PiBAQCAtMTUxMyw2ICsxNTE5LDQ4IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBkd19pM2NfbWFz
dGVyX2lycV9oYW5kbGVyKGludCBpcnEsIHZvaWQgKmRldl9pZCkNCj4+PiAgICAgcmV0dXJuIElS
UV9IQU5ETEVEOw0KPj4+ICAgfQ0KPj4+DQo+Pj4gK3N0YXRpYyBpbnQgZHdfaTNjX21hc3Rlcl9z
ZXRfc3BlZWQoc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAqbSwNCj4+PiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgZW51bSBpM2Nfb3Blbl9kcmFpbl9zcGVlZCBzcGVlZCkNCj4+
PiArew0KPj4+ICsgICBzdHJ1Y3QgZHdfaTNjX21hc3RlciAqbWFzdGVyID0gdG9fZHdfaTNjX21h
c3RlcihtKTsNCj4+PiArICAgdW5zaWduZWQgbG9uZyBjb3JlX3JhdGU7DQo+Pj4gKyAgIHUzMiBz
Y2xfdGltaW5nOw0KPj4+ICsgICB1OCBvZF9oY250LCBsY250Ow0KPj4+ICsNCj4+PiArICAgUE1f
UlVOVElNRV9BQ1FVSVJFX0FVVE9TVVNQRU5EKG1hc3Rlci0+ZGV2LCBwbSk7DQo+Pj4gKyAgIGlm
IChQTV9SVU5USU1FX0FDUVVJUkVfRVJSKCZwbSkpDQo+Pj4gKyAgICAgICAgICAgcmV0dXJuIC1F
TlhJTzsNCj4+PiArDQo+Pj4gKyAgIHN3aXRjaCAoc3BlZWQpIHsNCj4+PiArICAgY2FzZSBJM0Nf
T1BFTl9EUkFJTl9TTE9XX1NQRUVEOg0KPj4+ICsgICAgICAgICAgIGNvcmVfcmF0ZSA9IGNsa19n
ZXRfcmF0ZShtYXN0ZXItPmNvcmVfY2xrKTsNCj4+PiArICAgICAgICAgICBpZiAoIWNvcmVfcmF0
ZSkNCj4+PiArICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPj4+ICsNCj4+PiAr
ICAgICAgICAgICBsY250ID0gU0NMX0kzQ19USU1JTkdfTENOVChtYXN0ZXItPmkzY19vZF90aW1p
bmdfbm9ybWFsKTsNCj4+PiArICAgICAgICAgICBvZF9oY250ID0gRElWX1JPVU5EX1VQKCh1NjQp
STNDX0JVU19USElHSF9JTklUX09EX01JTl9OUyAqIGNvcmVfcmF0ZSwNCj4+PiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIDEwMDAwMDAwMDBVTEwpIC0gMTsNCj4+DQo+PiBbU2V2
ZXJpdHk6IExvd10NCj4+IFdpbGwgdGhpcyBjYXVzZSBhIGJ1aWxkIGZhaWx1cmUgb24gMzItYml0
IHBsYXRmb3Jtcz8NCj4+DQo+PiBVc2luZyBESVZfUk9VTkRfVVAoKSB3aXRoIGEgNjQtYml0IGRp
dmlzb3IgKDEwMDAwMDAwMDBVTEwpIHdpbGwgbGlrZWx5DQo+PiByZXN1bHQgaW4gYSBsaW5rZXIg
ZXJyb3IgZm9yIF9fdWRpdmRpMyBvbiAzMi1iaXQgYXJjaGl0ZWN0dXJlcyBsaWtlIEFSTTMyDQo+
PiBvciBpMzg2LiBTaG91bGQgdGhpcyB1c2UgRElWX1JPVU5EX1VQX1VMTCgpIGluc3RlYWQ/DQo+
Pg0KPg0KPiBtYWtlIHNlbnNlLA0KPg0KPj4gW1NldmVyaXR5OiBNZWRpdW1dDQo+PiBDYW4gb2Rf
aGNudCBzaWxlbnRseSBvdmVyZmxvdyBoZXJlPw0KPj4NCj4+IEJlY2F1c2Ugb2RfaGNudCBpcyBk
ZWNsYXJlZCBhcyBhIHU4IGF0IHRoZSB0b3Agb2YgdGhlIGZ1bmN0aW9uLCBpZiB0aGUNCj4+IGNv
cmUgY2xvY2sgcmF0ZSBleGNlZWRzIH4xLjI4IEdIeiwgdGhlIGNhbGN1bGF0aW9uIHdpbGwgZXZh
bHVhdGUgdG8gYQ0KPj4gdmFsdWUgZ3JlYXRlciB0aGFuIDI1NS4NCj4NCj4gbGVzcyBwb3NzaWJs
ZSwgYnV0IHN1Z2dlc3QgZml4IGl0Lg0KPg0KPiBGcmFuaw0KPg0KDQpIaSBGcmFuaywNCg0KVGhh
bmtzIGZvciB0aGUgcmV2aWV3Lg0KDQpBZ3JlZWQgb24gYm90aCBwb2ludHMuIFBlciB0aGUgRFdD
IE1JUEkgSTNDIGRhdGFib29rDQooU0NMX0kzQ19PRF9USU1JTkcpLCBJM0NfT0RfSENOVCBpcyBh
biA4LWJpdCBmaWVsZCAoYml0cyAyMzoxNiksIHNvDQp2YWx1ZXMgYWJvdmUgMjU1IGNhbm5vdCBi
ZSBwcm9ncmFtbWVkIGluIGhhcmR3YXJlLiBJbiB2MyBJIHdpbGw6DQoNCjEuIFN3aXRjaCB0byBE
SVZfUk9VTkRfVVBfVUxMKC4uLiwgTlNFQ19QRVJfU0VDKSBmb3IgMzItYml0IHNhZmV0eQ0KDQoy
LiBDb21wdXRlIG9kX2hjbnQgaW4gYSB3aWRlciB0eXBlIGFuZCBjbGFtcCBpdCB0byBVOF9NQVgg
c28gaXQgY2Fubm90DQogICAgc2lsZW50bHkgdHJ1bmNhdGUNCg0KQXQgY29yZSBjbG9ja3MgYWJv
dmUgfjEuMjggR0h6IHRoZSBjb250cm9sbGVyIGNhbm5vdCBtZWV0IHRISUdIX0lOSVQNCigyMDAg
bnMpIGFueXdheTsgY2xhbXBpbmcgdG8gMHhmZiBnaXZlcyB0aGUgbG9uZ2VzdCBwcm9ncmFtbWFi
bGUgaGlnaCB0aW1lLg0KDQpUaGFua3MsDQpUemUgWWVlDQoNCj4+DQo+PiBUaGlzIHdvdWxkIHRy
dW5jYXRlIHdoZW4gYXNzaWduZWQgdG8gb2RfaGNudCwgYnlwYXNzaW5nIHRoZSBtaW5pbXVtIDIw
MG5zDQo+PiByZXF1aXJlbWVudCBhbmQgcG90ZW50aWFsbHkgY2F1c2luZyBzcGlrZSBmaWx0ZXJz
IG9uIGRldmljZXMgdG8gZHJvcCB0aGUNCj4+IGJyb2FkY2FzdC4NCj4+DQo+Pj4gKyAgICAgICAg
ICAgaWYgKG9kX2hjbnQgPCBTQ0xfSTNDX1RJTUlOR19DTlRfTUlOKQ0KPj4+ICsgICAgICAgICAg
ICAgICAgICAgb2RfaGNudCA9IFNDTF9JM0NfVElNSU5HX0NOVF9NSU47DQo+Pj4gKyAgICAgICAg
ICAgc2NsX3RpbWluZyA9IFNDTF9JM0NfVElNSU5HX0hDTlQob2RfaGNudCkgfA0KPj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICBTQ0xfSTNDX1RJTUlOR19MQ05UKGxjbnQpOw0KPj4+ICsgICAg
ICAgICAgIHdyaXRlbChzY2xfdGltaW5nLCBtYXN0ZXItPnJlZ3MgKyBTQ0xfSTNDX09EX1RJTUlO
Ryk7DQo+Pj4gKyAgICAgICAgICAgbWFzdGVyLT5pM2Nfb2RfdGltaW5nID0gc2NsX3RpbWluZzsN
Cj4+PiArICAgICAgICAgICBicmVhazsNCj4+DQo+PiAtLQ0KPj4gU2FzaGlrbyBBSSByZXZpZXcg
wrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNzIxMDMzMTU5LjExNzg5LTEt
dHplLnllZS5uZ0BhbHRlcmEuY29tP3BhcnQ9MQ0KPj4NCj4+IC0tDQo+PiBsaW51eC1pM2MgbWFp
bGluZyBsaXN0DQo+PiBsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPj4gaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MNCg0KLS0gCmxpbnV4
LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
