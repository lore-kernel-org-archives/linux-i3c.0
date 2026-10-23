Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD18606A32C
	for <linux-i3c@archiver.kernel.org>; Fri, 23 Oct 2026 11:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gLxlTPin;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=PisdGXHw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+vcLAZylMMTS7Z5296eMcIZ6WzX5AdpLEXrjqXHOzv8=; b=gLxlTPinxa4Aitq1BLJKDJMakR
	iFUs9FV2jtNHe81A9fz5FzaruFgFQDf3aoZI6CQBtQBMNNVlzSJXNFhtnXOHratWR2RMdl2k0TKNH
	5jOwjKweL7lm5Y8E0JJmJWPdsUi4EZcu+F+DAFpWLTjFX5gFyUkkO1aWqrVordQjdGzHWe3yLd+uY
	Sn8CMB5AyPhB2rByCsepc6nxGSpH2CbOwULC1FK0Od+gLyOh5f0xTlNDnKRt2p6ZUm7Eoe9VMKZ8F
	OGd8PX4iqw5oTzJM4cfRBocT/JE2nYfwiLo0E/sL0hF4PKPSjR/7CCup9fJQIVkJQlxxlCm4H9Ln8
	YuA9GAjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKD4P-0000000GCep-43bD;
	Fri, 23 Oct 2026 11:04:22 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKD4M-0000000GCe0-3XL7
	for linux-i3c@lists.infradead.org;
	Fri, 23 Oct 2026 11:04:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qHsGLPSlYPY9SiR5gwHgnVc15V2PmHm/nJGtJ8dR0HvpEcPiUoKtPlZY4tgAglWbNiyqeAX7b1z6BVNkE5UNo/R3kV30s/E4auJC73zrhFMXRYREGkbfgiqnxwzxTI2jY00zCrhi/4Y11OFMbeWIIRVq+/UbB56atvJYPHquviqDfdNUfMQV8hrUE8qREVlzmx5FYvP3LCSWkaVpd916xi8QRPgTwNU3g4yzo/GLmjzD3KQba4IhOx3+sgu4coUpg9JIOlBqeLIWo5U1o4AzUGNdih3FJ9B2uzk2cnNJ86B35aVcXBx+ENhES6x2CaoGcnmjovDpl7UzzU+2l7Tg3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9vrsn39Bv8sf1TqabbN+h0rzDe4+1Jk3K3pIgwnodyo=;
 b=Z5sB1ufCkWnIAUNe7f9qY3v2LyhDGcCjuE6BVD5SEKex0N6hlpE/X2nMUH95o6rjV0qn9DLgDHuOyquu61OalIjtlNipG8+m3WAGK9IxEhG4LEiETdza64gZkOX3M3d8/x5/VsQMf8sSEF0/Ll+daNReY54sIDGdKvmSzVS5klPAviSdHLBGyJrCALA28LpZDZc6YnnkxrfYA7AFFE5qK8PPHWu4pIdKx52X/sBhiKl3qP6eLtxCGHpktj1d+uCalgZiYtAW1G4h6qz+VPWXlLe+pN7DFfw7LUygfB7WNAgsOybTJvJCcNULMvOq/SteAC+3kK12FmccCSzMpfKhYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9vrsn39Bv8sf1TqabbN+h0rzDe4+1Jk3K3pIgwnodyo=;
 b=PisdGXHw1AI94/R3RoAYoNjFjkaEhNbEgLGesvOwxKo1Fev5fDRkPhT7yw6tQIviNl2KhVAfNLYgDPXXN1BuzVGoluEkeLR579Dz9dznNVQU4cMhcSx05kBzrxqaebcqZlk95bthYzdCHhscopBrNvgT7Zlin+b2LVy7R77w8S7+oWptn2JL0o8lQj8yWlFHatrup+CoNPQrFNbJOHT4Wd8Ncun5RFeyv9J9N+p7a8ICPDUZHD7kEey5npWzT5FHoNyxVTtk4OCvlyPml5NdmM10EHjyTu2bFAtVDY04E763qZFjJ2MMtKPOaPzPGaawD59aQvjA6kqsIk7v37XQWQ==
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::9)
 by AS8PR04MB7605.eurprd04.prod.outlook.com (2603:10a6:20b:292::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Fri, 23 Oct
 2026 11:04:12 +0000
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0]) by AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0%6]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 11:04:12 +0000
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: Lakshay Piplani <lakshay.piplani@nxp.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "broonie@kernel.org" <broonie@kernel.org>,
	"mfd@lists.linux.dev" <mfd@lists.linux.dev>, "lee@kernel.org"
	<lee@kernel.org>, Frank Li <frank.li@nxp.com>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>
CC: Vikash Bansal <vikash.bansal@nxp.com>, Priyanka Jain
	<priyanka.jain@nxp.com>, Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Subject: RE: [PATCH v20 4/8] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub
 and on-die regulator
Thread-Topic: [PATCH v20 4/8] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub
 and on-die regulator
Thread-Index: AQHdSn42OBbw0rAzQEGMsn5hBR3yB7cLJu9g
Date: Fri, 23 Oct 2026 11:04:12 +0000
Message-ID: <AS4PR04MB9362E4F3E5E69CE45BE436E9FB642@AS4PR04MB9362.eurprd04.prod.outlook.com>
References: <20260922103551.2754613-1-lakshay.piplani@nxp.com>
 <20260922103551.2754613-5-lakshay.piplani@nxp.com>
In-Reply-To: <20260922103551.2754613-5-lakshay.piplani@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Enabled=True;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SetDate=2026-10-23T11:02:14.0000000Z;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Name=NXP
 Confidential;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_ContentBits=3;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Method=Standard
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9362:EE_|AS8PR04MB7605:EE_
x-ms-office365-filtering-correlation-id: 1f805a0b-f300-4a53-82c4-08df30f55eda
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|19092799006|366016|1800799024|23010399003|6133799003|18002099003|10067099003|22082099003|921020|38070700021|11063799006|56012099006|4143699003|261021121427099003|261022105027099003|261022075727099003|261009223027099003;
x-microsoft-antispam-message-info: JOnyCJbfVS/OCyRVkPd/orMFbh78UojJebQ+GIdELB21QtgjcsTbDxkHy905cBj6izzgifqW+HYdx9Ska5Gj4TxHgYWzwq6GnA9uoK/6kjQDpLRJL0L4At6MD6Q1cnhA/3D7AYiZ4rjMC27V6VT8K4JvHbodxTO0qBf6HFnOs3Z+XyAv1VZkqceYdxTg0+PhsCHaRtPB/e717exmU1DksnUgFiP0mVKR8ishnlkddPBbVj2HZHXEI1gTdp5olASiJYVhwb5k+K1ltbPjmiUkONtMR5gBYOyoqy6Z9zFElEwhS5HSRfkpixngfoZw/sR8PtcYCvEWvazMyu2iUKQJ80MrrQqjkzV4ViLlab5DkC4+pwbLtovU1D9UkXA7P9pbsccSDuvCuQghh1mKcXgmePewYnmc5e2vUIKLjbLZI/1MLsg3ZwS7kzIyvLKWiVi5uZ1BwTHxn/t1vVlEdyo6q7brJumgHiBjgIKpskseAcFk8NjiiQp1T2e5nKAopUC9oRfp2zlVSwOYFIlOvLypY4yGapYgr3yTgdiz33UE33pv0JuqMNaClnA+moOipzEePsMjrU2wsSU0VUL34Bq8xsxIKb7cepgHPTumcw/3AeZ/BxcSQTxOUt5qEn2VBY3sdFO6D4pisfH2k0AMyU22Pv81YfYby4YTeWDVvx10WSdcwmk6VJdtmT4iajhivMRFw4+efAPICRm2Vbkfa3Ocql1+raWNwhzwGxDjA9BvICva1EKKVZRpc4Dvis7wCypt
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9362.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(366016)(1800799024)(23010399003)(6133799003)(18002099003)(10067099003)(22082099003)(921020)(38070700021)(11063799006)(56012099006)(4143699003)(261021121427099003)(261022105027099003)(261022075727099003)(261009223027099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bkZpS0o0YmxEMEdLaHhLSGNEUWR4V0JhU25pS2NjUE1oSG8zYzAzZTUzaUFP?=
 =?utf-8?B?SG5VdFVPZjFvaEIzdGxQRlNvUkpvT3g2QlhFQkowemFaeE9IT2VzWlI2ZkZC?=
 =?utf-8?B?STlsbXFsMFpwMVRFeUI5NEhFb0tvU3BwOHhWSzV0dFZVNUx3YVl2bnBFK0tq?=
 =?utf-8?B?NnJWdjdNWG9zU0RZMTBjNFE2K3JiNkhqaG5RSHBaMTFXbE56eGQvM3JYR2Jw?=
 =?utf-8?B?cDd6MzZiTFNWU2pvKzYzRWV4eDU2aGI0cTN2L0tLVWo1NWZML1BNMGs4Tk9Q?=
 =?utf-8?B?TVpMYitqWVFOYy83Nm9udTVSS0FRSG5qdjFIYzZaNFpNcWxNd0dwQTNyKzhx?=
 =?utf-8?B?U2U2MlhTckhKRzNYMndXT2diQjlTaHBNRlVVZ2llbTRJRk9tNFl5eG5xckdI?=
 =?utf-8?B?Sjd1R3ByMnpod1pUUmVpY1lTTWU2ajRTLzZybEYzV0dPN3BCbXlUL3NHT1dP?=
 =?utf-8?B?cHNTK0tUSit1T2RVd3VsNFB4QmZvT1V6K3MxQUVsQVRoa0RQOGZOWXkzZVpw?=
 =?utf-8?B?emFkSlFFYS95OGZsOE54WWYwRDMxNksvczFqYXp0Y1QzY0ltY1VldFZZN2lI?=
 =?utf-8?B?YlNkdWVGVzFyYTFrQWFWd0M1bXhNb1ZDYTJKOTRLZzdmbGVBdFhoZ1YzeVZI?=
 =?utf-8?B?OFhkY21UcDdFbGlmUDhUcWdkZGZwc0xOZitsVmxjWEp0b2l3cmpEdDJNS2lu?=
 =?utf-8?B?R2NuWXM3Q0t0N2JsNFQ4cGlCYzBGZDFtZjlXdUgyQWNvK0VKSTZVUTA3NkhB?=
 =?utf-8?B?c0VHak5jUmdDZlIxN0Rxa2pYRUcycitDdWVVdDhkNnRkTnNZVWNCOWZWemRI?=
 =?utf-8?B?S3E3OCtQQjN1YktOOVhLZ3NHMzBSbk00eDZVTDNHUEZZMzE4cVNlb0pGdFVW?=
 =?utf-8?B?czV6dmZveG50ZTFyOExnOHhRRXoyV09heTJXSTU0YVRuek52Mmk4SWtIN0dG?=
 =?utf-8?B?RThPZ2xiaGJTU1plSFkwTTFSSkZwK2xBZW1GV0pMam9QSk9nMHB2Yjd3cjNn?=
 =?utf-8?B?bFd6ZHZzN0xKTDBodkMvZFJaOGplaUVzWUx1Q3hEcXpPK3pkMGZUVjQrSHFY?=
 =?utf-8?B?OFM0VEEwakc1Vkh4dGY2emovcWhzYWZWU1hhV1NwYlJzTmFDY0g4OWRlRW5P?=
 =?utf-8?B?VzF2WVgvN0h6SnhaY3BudmU1cGxrLys1dE5FY3BybXF5MFlDc092QXg3bjJQ?=
 =?utf-8?B?eWxKRzlucW5YbzZSSTlrQVAwcHVXZlArcnNzeUNBQjFYYkFCWlU5N0VFbW5z?=
 =?utf-8?B?RGJDWVlybm5rZUtTZ2FWQkFaY2d4UVRMNy9qaGs2MmdhYnk1ZkRHcmxZTVJY?=
 =?utf-8?B?YjdCL1FEeWRhTVlPckE1QWZLMWlWdlVoWGZEaCtXYnN3d2FCUm9CRE9oSFJB?=
 =?utf-8?B?L0JldDV1VGxGZ1JsKy93N3BXT0FqVERLcVNzMk5rQ0JuSzdIa3BlZGZ5MXd3?=
 =?utf-8?B?aCtwRXBVREUra3h5Y05sZWxvN3I5cHpoVFF1ZzZyOU5GVjRDYnpPazcyMG1V?=
 =?utf-8?B?MU51ZFUzVWZaZ1p5Y3Vyb3dDdE5xSmMxSmxrTHZrQzNZeHpnVFFuOHZaRWNG?=
 =?utf-8?B?dmFHM0FQL05TbVlCWTJtRm5IazRBc0xudEFNVDJLNStXNElSdE5sd0FiN01W?=
 =?utf-8?B?akk2SWV2aWtpdEcvODFVdnh3ZVB3RzdnQXZhNUQ4dENZNWY4bkFXUlArZEkr?=
 =?utf-8?B?MklZQWlyVkxxUUFocGc3eFJyU0J4QUpKRGtjT2RtNnRzRVd6VjlsTEgzOHRt?=
 =?utf-8?B?MDR2Nk10RUV1a0xMVGo2TThrMWQvWkFTNXJBM1VqYnBBbmtIVTd3Ynl3SXYr?=
 =?utf-8?B?WHVpbXp2V2NiVFpIRjFRczJLWTNBeEU5QTVVZ2tlMVMzRm41Skg4NWY1QkRl?=
 =?utf-8?B?T3RVUW5HNVk0V3NxanQ2VUFBODljaWp1N3pZV1lDNVJrdm1tK0FuL2xxZDMz?=
 =?utf-8?B?dDVucW5sTEQzS3RSTnlPdEMrZjZDSjZTNkFRd3FGcDhFczhPLy9VcW14SzVZ?=
 =?utf-8?B?ME9mS2ZQcm1pZkcvMDM2TG1lZTN5UjRkTmpjYi9PTmdTK0I5QnNuVHFNOFY1?=
 =?utf-8?B?ZUpacDJOczVaT1RZU0NKaEtQTjh2UEkzak1xck9WOWNEOFBGODR5M2s2blo2?=
 =?utf-8?B?K3VHKzlHMkFkWDl5VWRKRFhYa0Nra25NS0pkN2NPbmJMK3FTc2dmSWQ5cVpL?=
 =?utf-8?B?dk5wTkxtc3E4YkZsU2lBNnN2UkE4ZVpzUEkzejB5N3h2K1ZJRExidk1qWHJ5?=
 =?utf-8?B?Tlc0bVdqeFRETTdYWERmYU1IKzBndWUvMUVFTTdIOXJEUDhwMnlKMTJkMzVU?=
 =?utf-8?B?NGErUnZUbUZpcHNsMDI3cUVZdEp5U3lMMS9pd05CY0l3aW8wb0VRZz09?=
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9362.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f805a0b-f300-4a53-82c4-08df30f55eda
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 11:04:12.6182
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y1chdkd+DiMNAfK/CUj7ZaCeh1oGVLdUcO5Gqvh8W2awv9E7wuzN0lo3PD+q9khoFg1Z0ZaA3sxEdurUOfwrWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7605
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_040419_030373_5F0622DE 
X-CRM114-Status: GOOD (  23.14  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


NXP Confidential
> -----Original Message-----
> From: Lakshay Piplani <lakshay.piplani@nxp.com>
> Sent: Tuesday, September 22, 2026 4:06 PM
> To: linux-kernel@vger.kernel.org; linux-i3c@lists.infradead.org;
> alexandre.belloni@bootlin.com; krzk+dt@kernel.org; robh@kernel.org;
> conor+dt@kernel.org; devicetree@vger.kernel.org; broonie@kernel.org;
> mfd@lists.linux.dev; lee@kernel.org; Frank Li <frank.li@nxp.com>;
> lgirdwood@gmail.com
> Cc: Vikash Bansal <vikash.bansal@nxp.com>; Priyanka Jain
> <priyanka.jain@nxp.com>; Aman Kumar Pandey
> <aman.kumarpandey@nxp.com>; Lakshay Piplani
> <lakshay.piplani@nxp.com>
> Subject: [PATCH v20 4/8] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub
> and on-die regulator
>
> From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
>
> Add core MFD support for the NXP P3H2x4x
> (P3H2440/P3H2441/P3H2840/P3H2841) family of multiport I3C hub devices.
> These devices connect to a host via I3C/I2C/SMBus and expose multiple
> downstream target ports.
>
> All variants share the same register interface. Read the implemented target-
> port count from DEV_CAPAB, so no per-compatible driver data is required.
>
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
> Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> ---
> Changes in v20:
>  - No change
>
> Changes in v19:
>  - Retain only nxp,p3h2840 in the OF match table because the other
>    variants use it as their fallback compatible
>
> Changes in v18:
>  - Rebased onto v7.3-rc1; no intended driver behaviour changes
>
> Changes in v17:
>  - No change
>
> Changes in v16:
>  - Use a named initializer for struct i2c_device_id
>   ({ .name = "nxp-i3c-hub" })
>  - Keep the shared header in include/linux/mfd/ (struct p3h2x4x is shared by
>    the mfd parent and its regulator/i3c-hub children). The i3c_hub_priv
>    back-pointer is retained for IBI routing, with documented publish/clear
>    ordering
>
> Changes in v15:
>  - Read the device capability register to determine whether the device has
>    four or eight target ports
>  - Store the detected target-port count in the shared MFD data
>  - Add OF match entries for all P3H2440, P3H2441, P3H2840 and P3H2841
>    variants
>  - Add a shared hub-context pointer for use by the IBI handler without
>    overwriting the MFD parent's driver data
>
> Changes in v14:
>  - Clean up MFD driver comments, formatting, variable names and author
>    information
>  - Define and document the I3C hub DCR value in hexadecimal form
>  - Use direct regmap bit-width values instead of local macros
>  - Add a shared protected_reg_lock for protected register accesses across
>    P3H2X4X child drivers
>
> Changes in v13:
>  - Use i3c_device helpers (i3cdev_to_dev()) instead of direct struct access
>    to maintain API abstraction
>  - Avoid including internal I3C headers and use public device headers instead
>  - Ensure proper device matching by relying on manufacturer ID checks in
> probe
>
> Changes in v12:
>  - No change, added Reviewed-By tag
>
> Changes in v11:
>  - Use MFD_CELL_NAME() for child device registration
>  - Rename local variables for consistency
>  - Rename driver names to follow subsystem conventions:
>    - Use '-' instead of '_' in driver names
>    - Drop the "_drv" suffix from driver names
>
> Changes in v10:
>  - Drop redundant is_p3h2x4x_in_i3c flag
>
> Changes in v9:
>  - Renamed macros to follow consistent uppercase naming conventions
>  - Made REGMAP selects in the P3H2X4X MFD Kconfig conditional,
>    to avoid I3C/I2C dependency issues
>
> Changes in v8:
>  - No change
>
> Changes in v7:
>  - Use new config I3C_OR_I2C
>
> Changes in v6:
>  - No change
>
> Changes in v5:
>  - Corrected the ordering in the Makefile and Kconfig for MFD_P3H2X4X
>  - Updated dev_err_probe() for regmap_init failure.
>  - Updated module description
>
> Changes in v4:
>  - Split the driver into three separate patches(mfd, regulator and I3C hub)
>  - Added support for NXP P3H2x4x MFD functionality
> ---
> ---
>  MAINTAINERS                 |   2 +
>  drivers/mfd/Kconfig         |  13 +++
>  drivers/mfd/Makefile        |   1 +
>  drivers/mfd/p3h2840.c       | 164 ++++++++++++++++++++++++++++++++++++
>  include/linux/i3c/device.h  |   2 +
>  include/linux/mfd/p3h2840.h |  41 +++++++++
>  6 files changed, 223 insertions(+)
>  create mode 100644 drivers/mfd/p3h2840.c  create mode 100644
> include/linux/mfd/p3h2840.h
>

Hi Lee,

Alexandre has already applied patches 1/8, 2/8, 3/8 and 6/8 from the v20 series.

Patches 4/8, 5/8, 7/8 and 8/8 remain outstanding, with patch 4/8 providing the MFD core required by the remaining patches.

Do you plan to pick patch 4/8 through the MFD tree, or would you prefer it to go through the I3C tree with your Reviewed-by?

Thanks
Lakshay
-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
