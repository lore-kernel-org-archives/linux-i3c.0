Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211F7C43458
	for <linux-i3c@archiver.kernel.org>; Fri,  3 Jul 2026 10:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3D6yVvm0YHHuWIgw0yd3U+WCQsMIzlVNmrRT2gsplgw=; b=jXKrcu4RGQYlEY
	KLLx2h0EzkCX6rT/wHRXmtDzVTdy8VwA2Eeued6aXrdSr9d8ECVAR8nL3LApkcOvm0qdp/sMqDSs8
	IlkhOOCCIT24dz5mLRBhOSF23dDXwpGyrs8zJajJDJyjE4wn2y3emnvtbZ7ZSiX2NzLTqaZyHFnKR
	uV6yubamjjmcMPror5qD3QfhK/nSrIL4L1B/HFW2t9AWPfkJl9ycsgqcJZ9Jt8qNHLxsHfhT9EGSN
	FBw9w/DncnUUQvQQENCZ5OiwwkNZyCFvEvv7uP25UGR0kJRDW30fNMoBHfl2SENP/N4boHEw+OCK0
	SLVpexEmYTGLSYL7L4qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbUh-00000006ixD-3gHl;
	Fri, 03 Jul 2026 10:51:39 +0000
Received: from mail-westus2azon11010034.outbound.protection.outlook.com ([52.101.46.34] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbUf-00000006isM-23AK
	for linux-i3c@lists.infradead.org;
	Fri, 03 Jul 2026 10:51:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jjtmW/EZRutzeiV+0HIUr1/uT7e6IY1V9i+T8XrJvTcQH+FxfaUdFNqIsBErj8j+YZoqdUZMt9cB65FuyM/WkyVwa3ca3HVacV7STzpHHJTT25jVmNp/yzAi276pm8iYFI9jwEsobGtLKx1J0RfJr7mKDFb0XrW6rkWjJlXbzWYsR8eHzUbEzOa37meDFYKT/3Io6R92j5EFvXQR6cXnt6DDjzeCJDj3uZ+2vxUyVq8RI7c0i34FqnjHiPt/XLUY9ETVh7/Ki+J69A4d25ynhkEGfKShJqbYGdiyRXumz2NHMDXl5Gl+p7navzGXw2/pEtoGQ+Ojq2hDxEtaMSCRsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ieLPdAh140e1Kh6GGuXqlUdtGay08oKb+ADvbyI1jDs=;
 b=oT474bCfDNe3FkjWRDnLzaSd70XbQq3qFfyf9HKDvAVPyV4ZjOYBtCXkWrH81IkPsrxOcUA8sPrEivT0WRFpAgj5ML5zcl0227u5x2x8kUr7YVh9PFE3Jl8he8hCGyEZx6oAAmUAYIFu9dIHxuQai6nY3hBSE4BqN9lOFuXYuH7GC8nEtJzEm3lSHq+mCtVwkFviAiwKFCAHZdGAywhhn23Wfk5filbUUXTYneD4Tu7scprwSJq7637cyy4iU59V1fUiF44SCq52qBh6i7t+i9PUPhr3kTps9FVWuWB3e1E10wfyOY/AVMnKowb0POSpz2FzZ1cnsz+riOCG4fpUXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ieLPdAh140e1Kh6GGuXqlUdtGay08oKb+ADvbyI1jDs=;
 b=s36RsamcvM2piO/S4r0sQt1et86GgtMB7PDJ4m/9u8tc+30Fg34Z7VSs2DR5GEhmnSxH/DUGJTPBQGYidYwZNtHEbWHBoa0KwYFQC10yTnw47F/gkhZCrervKOYn2ibXeNlSW1hceG2DBCMsizot40eRQkZGxiR4CTrEgrkl/mP1bC2fGjKGvRNZaPzy+0iXv/5bxAipjlBIQrwHyH6un5uLxyUtX5hzKr6EsYHa+VzsXvETxt8esQ8URJDCSdT5WGmzaN8ozad9yxySku2GMehz6uGAPHBbauL4G0ogLpG8KP+E9QhhfWl3NAdqzFauqZn4ZicC/kvlZaqylkMTRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by DS0PR03MB7631.namprd03.prod.outlook.com (2603:10b6:8:202::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 10:51:29 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 10:51:29 +0000
From: tze.yee.ng@altera.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jorge Marques <jorge.marques@analog.com>,
	=?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Felix Gu <ustc.gu@gmail.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	imx@lists.linux.dev
Subject: [PATCH v5 4/5] i3c: master: Validate GET CCC payload length and retry Direct GET once
Date: Fri,  3 Jul 2026 03:51:16 -0700
Message-ID: <9fba8d67af4bb5ed41ef1df853adc05911da17fb.1783074850.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1783074850.git.tze.yee.ng@altera.com>
References: <cover.1783074850.git.tze.yee.ng@altera.com>
X-ClientProxiedBy: BY5PR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::34) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|DS0PR03MB7631:EE_
X-MS-Office365-Filtering-Correlation-Id: 427a2c82-aca4-43a4-7bfa-08ded8f106a8
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|55112099003|18002099003|22082099003|3023799007|11063799006|56012099006|921020;
X-Microsoft-Antispam-Message-Info: 9ce/weanfNttu0mk57PgqD+KlEJjIWqf2jfi0gIYdX3z2vi7VLvx7B3PBFBSBkaalJddRulmQYSGofxp2tpD8JOt1VPX0h7SWYxPOzI5X4zgiixbUzOjYk1emc/R/b1HLs2UfwY1qVbkYM7mC4K9ERqXB4soPGMPYHkvlFUbjQHM5GLYQjhVZ/g8vvyezNqAk/dftEFeyIKlvgGyRutgt/dsKHiGOCwiLZroaxRuK8Fj+McV78hCsTK2U2yeL+AHzQSrzpaVhdXVONETe6SeZX+ajr42I2IVe3DRIioCR6kpeQBT+2SXJzaU3sDES9264zraETF7R454YcEBSFbLuRJf7qHrEqMuD8/8llWpcrDq4A5uHu2ZUh0jGTnZ9XGw2oiE4YlFvXPUtvn+Tjy5NREd1xQTj65LKuiXn6H7IvdF8ZOV0HhBW8UnIjTH1lR5IQCUUetTzEbuiEfebze7Ls/K5o0VK/J+w344SrWdUvN6GdRjINgUSLlDs3oubpwj1pW2X30KHm3l6ANJZYcWaSAwNWRxi1Y+HCCKMbzaeUuf/1jlYB9PxFfj6z+tdOBRk69aAnVA87SGgB1FwBdMqlsEp27Y6jz12S+4AdRNJFmPr1HZNxqp+O37MgR/zu9TijBqoquRVkeJySBU/eR7DmwYJpHhxFfQ6ww9ZU8G2H7IxOl1R7iYQhFASeRT/T14oFDrzHQiVVmDOlyGvHxSFA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(55112099003)(18002099003)(22082099003)(3023799007)(11063799006)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2p0Qmg5eFVVZDMvcFI1QUpvbzJwWm94azlXVzVPVkVEOWcyMG90S0RnMGp3?=
 =?utf-8?B?S3hlZHdvY1BOWFRGbDFIc3JMUTBGVk9LME9Tc2RSQkRSNkNKZHdBRGNqcFFY?=
 =?utf-8?B?Wm1EbUtNZXRLV3kyK1dVV2o0OGFNckkxTkJsc1dFN09SUVZNVWx4TzI5aHlG?=
 =?utf-8?B?Q21ZVVBscEEwVmg0d2R1V2NiSld2bjlqM3VZZDZYajFxcGtEZFFsS3NUOVhM?=
 =?utf-8?B?bkJhYmhIV1RKblVjZUJGbk43NksyR3MweE8wK3VLMFl6ZER4eXdNOWdlc3E4?=
 =?utf-8?B?YjNUWVU4ays4bzRlM05UdzEyd1MwcVhPaWsrSEJlOVdDL3A1aEIySlRoMHNF?=
 =?utf-8?B?Y1Rib2lnUUFYWXJRZk8yNmpPSU5KalVTRjU3TjJIc0tJU2lST0R5OVBCRCth?=
 =?utf-8?B?VVJiUEpoQlU3OHNrQXFWcWNWSWZkTnpKeTF2UUJRY3BiVXUwTTYzYWVydVVS?=
 =?utf-8?B?OWxjUnd3WWw2VFpQWkFPMzN5RGhBYVBneUNpTElxNHZoYmk2WFljeTZIRStN?=
 =?utf-8?B?TFdrcmVxMGMwK0RhUW1vSW9SSEpacVZCTmtNaUJtSU5PMlIwUkoyaFdUTHlP?=
 =?utf-8?B?Rm9LUGR3Smw3NGdscFdDMnBpUDlNR3d3S2UxTHZqY3VEMjEvYkVTd1BCUE1H?=
 =?utf-8?B?L2RsQUROQ2tsL1dyNDhoeHI2RFNjZFFHZi9kbFhVL1pNVG9lbnVqMUZMTkc0?=
 =?utf-8?B?K2NZY0phaldMZGNYTDNmdjZIUWpoM3lkZkV6UU5xVFBITEVsUDE3R2ZNb3pU?=
 =?utf-8?B?QWJwWHdPR1VuNGh6bzhaaktORCtXUG9PU1hWNTNUOUtFM0s3amkxWCs1WGMy?=
 =?utf-8?B?VXRqUE5WK20rK2kyeHN6N2tLNFBaODB4ZmVwUEs3a0FQVHA3RUtOMzBIakxv?=
 =?utf-8?B?OGFIVlNxWTdrYW9rM28rUVdhR0VMRlNEWFJGSmNtM1dId25xdkNCanR5UFVG?=
 =?utf-8?B?am4xelArQ3I2NUN3alRBZmZMRU9yNDN3NWVvMGFib0tPTDhDN0EwZDRNQktR?=
 =?utf-8?B?OVFERWlWTkV4U3ZweHVzQjYxKzZpNERvWUFPZVB4WnlHaFpDelM0RkRIVENL?=
 =?utf-8?B?bm9heVZxWWlpOFFCT0hxM25VZ2JNYkJlakZldlRFem5tbXVOSjNnekJMcisy?=
 =?utf-8?B?YUljWFdFNVR6M3JFZTJBTzZpVW9uQVVlRUo0eTZ5QmcyUVZ6ZUVEUmxrZm5X?=
 =?utf-8?B?YjJIWnlPOVFyN0lWRXpjSzRJZmsvR3c5c3l4V0MxVzQ0VGRHT1BXOGxEOExi?=
 =?utf-8?B?WWJTVE9DMmhqcmM3bnd4eUpTR3VqTFEvMmx3YWRWMEMyRTNKTy9pdmZCWXFL?=
 =?utf-8?B?M3lhbnU0S1NRYjVlcEl4RE81aWcreWw3eE1vV1AyTklHZFFwWWwyR3RMYUkx?=
 =?utf-8?B?akZiWjY1ek9QNUp4Z3FQTzFXU2ljRThJR2N5cHZFeDFKTnVOZDBlQ2s4OHRJ?=
 =?utf-8?B?QXBLeUhmVmxDelJvRnFFWXR4QVBpK1JkQ3pRTjl6MEo3WGx2bUgvenRrcHRy?=
 =?utf-8?B?TUJ4bDdRM0pyQk9DTGkrVElRYTEwZGNLbERIRGlaTHMwS3V6R2MzZEFVR1pE?=
 =?utf-8?B?TXpQZEdSNkNyekJtQS9EMHN0SndwS2VIT0NsR2lDRExucHV4bGs2TE5hRm9Y?=
 =?utf-8?B?QmZuWDR3TnBpRnEvdWx1NzE5aDMra2w5a3RrYzRUY1RMNWpsTS9EcWlkUXFN?=
 =?utf-8?B?dVJTMy9WZTQ2NVFTYWQyL2tWSGdmRDBockFVSGVZRmZOY09iVnhQaENTU0tQ?=
 =?utf-8?B?aDhnaXhuaFlYQ3JMNEhyTDlqK0FJVzV3RnBYSFQ0K1A2dmVLdHovUjRhMlFH?=
 =?utf-8?B?Nm9weHZvRERpb3p6S1ErOUlVblBYN3c1dWZhbGUwMys0SXFoNEhvT3VvVGJE?=
 =?utf-8?B?WGpEdklTb29NOTFGVmpRWkE0OHlSU1BBMUd4aVE0Ky8wZXI3WjFFQTN3QXdO?=
 =?utf-8?B?QUhZSWNQVXZEM3c2TTU3bjZXN3oyQUNRS21KOURDdy95dzRVcEFBbTJiU05E?=
 =?utf-8?B?QlZGLzEzNGdVU1p1VmRHb1htcng5MVN1cjZLOUI2cjlpMzdSUVRVTXdBUHBS?=
 =?utf-8?B?SGhWbGZ0a0tlWW9wRENyRGF5Z1dMcEgzaGswQkM0WElGT00yNDJxL0RUbnNn?=
 =?utf-8?B?V1hqMUx0WXJsM0VVNkxOTHFuMTVmZng5aWJpVUwyUEhBd3VRcXJDbkpSdnhn?=
 =?utf-8?B?Rmp0OVB6Y2xXdXJYWlcwd1VOajJycnNYVkRpak82ZnFaVU5La0Frd2gyZFda?=
 =?utf-8?B?b29pb3lDbE9QMlIwOFo5SjZrdkVVZk15VzRJRWtiMVlkSmVvSzZsYUE3eVlV?=
 =?utf-8?B?OW13cC9LajFXQ0poM25hODNXUnQwbHpoQWNOdTNncTdMbmY5dnpkQT09?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 427a2c82-aca4-43a4-7bfa-08ded8f106a8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 10:51:24.8420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nx7lTWbxozJRJsZHQ1fExF4mW/7wcASVfbmN5YRlDD8kQqOaJA+dghvqdofMc1MHNzwNCWS8mChPQVFHfiWdCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7631
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_035137_539705_61AA3FE3 
X-CRM114-Status: GOOD (  17.62  )
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

RnJvbTogQWRyaWFuIE5nIEhvIFlpbiA8YWRyaWFuLmhvLnlpbi5uZ0BhbHRlcmEuY29tPgoKQWRk
IHJldHJpZXMgdG8gc3RydWN0IGkzY19jY2NfY21kLiBWYWxpZGF0ZSBHRVQgcGF5bG9hZCBsZW5n
dGggaW4KaTNjX21hc3Rlcl9zZW5kX2NjY19jbWRfbG9ja2VkKCkgYWZ0ZXIgYSBzdWNjZXNzZnVs
IHRyYW5zZmVyLgoKUmV0cnkgZmFpbGVkIERpcmVjdCBHRVQgQ0NDcyB1cCB0byBjbWQtPnJldHJp
ZXMgdGltZXMgd2hlbiB0aGUgZHJpdmVyCnJlcG9ydHMgZmFpbHVyZSBvciBhbiBJM0MgZXJyb3I7
IHZhbGlkYXRpb24gZmFpbHVyZXMgYXJlIG5vdCByZXRyaWVkLgpTRVQgQ0NDcyBhcmUgbm90IHJl
dHJpZWQgYnkgZGVmYXVsdC4KClNpZ25lZC1vZmYtYnk6IEFkcmlhbiBOZyBIbyBZaW4gPGFkcmlh
bi5oby55aW4ubmdAYWx0ZXJhLmNvbT4KU2lnbmVkLW9mZi1ieTogVHplIFllZSBOZyA8dHplLnll
ZS5uZ0BhbHRlcmEuY29tPgotLS0KQ2hhbmdlcyBpbiB2NToKLSBTcGxpdCBmcm9tIHY0IHBhdGNo
IDMvMzogcmV0cnkgYW5kIHN0cmljdCB2YWxpZGF0aW9uIG9ubHk7IG9wdGlvbmFsX2J5dGVzCiAg
bW92ZWQgdG8gcGF0Y2ggNS81LgotIFZhbGlkYXRlIEdFVCBwYXlsb2FkIGxlbmd0aCBhZnRlciBh
IHN1Y2Nlc3NmdWwgdHJhbnNmZXIuCi0gUmV0cnkgZmFpbGVkIERpcmVjdCBHRVQgQ0NDcyB3aGVu
IHRoZSBkcml2ZXIgcmVwb3J0cyBmYWlsdXJlIG9yIGFuIEkzQwogIGVycm9yOyB2YWxpZGF0aW9u
IGZhaWx1cmVzIGFyZSBub3QgcmV0cmllZC4KCkNoYW5nZXMgaW4gdjQ6Ci0gQWRkIG9wdGlvbmFs
X2J5dGVzIHRvIHN0cnVjdCBpM2NfY2NjX2NtZF9wYXlsb2FkIGFuZCByZXRyaWVzIHRvCiAgc3Ry
dWN0IGkzY19jY2NfY21kIChkZWZhdWx0IEkzQ19DQ0NfUkVUUklFUyBmb3IgR0VULCAwIGZvciBT
RVQpLgotIFJlcGxhY2UgQ0NDLUlELXNwZWNpZmljIHBheWxvYWQgY2hlY2tzIHdpdGggZ2VuZXJp
YyB2YWxpZGF0aW9uIHVzaW5nCiAgYWN0dWFsX2xlbiwgbGVuLCBhbmQgb3B0aW9uYWxfYnl0ZXMu
Ci0gR0VUTVJMIGFuZCBHRVRNWERTIHNldCBvcHRpb25hbF9ieXRlcyBhdCB0aGUgY2FsbCBzaXRl
IGluc3RlYWQgb2YKICBoYXJkY29kaW5nIGxlbmd0aHMgaW4gdGhlIGNvcmUuCi0gUmV0cnkgZmFp
bGVkIERpcmVjdCBHRVQgQ0NDcyBvbiBhbnkgZXJyb3IgdXAgdG8gY21kLT5yZXRyaWVzIHRpbWVz
LAogIHBlciBJM0Mgc3BlYyBEaXJlY3QgR0VUIHNpbmdsZS1yZXRyeSBtb2RlbCAowqc1LjEuOS4y
LjMpOyBkcm9wIE0wL00yLQogIGdhdGVkIHJldHJ5IGxvZ2ljLgotIERyb3AgcmVxX2xlbnMgc2F2
ZS9yZXN0b3JlIGFuZCB0aGUgc3RhY2sva21hbGxvYyBib29ra2VlcGluZyBmb3IKICBwYXlsb2Fk
Lmxlbi4KLSBVcGRhdGUgSTNDIG1hc3RlciBkcml2ZXJzIChTVkMsIENhZGVuY2UsIEFESSwgUmVu
ZXNhcywgTUlQSSBIQ0kpIHRvCiAgcG9wdWxhdGUgYWN0dWFsX2xlbiBvbiBzdWNjZXNzZnVsIEdF
VCB0cmFuc2ZlcnMuCi0gVXNlIGFjdHVhbF9sZW4gaW4gZ2V0bXJsX2xvY2tlZCgpLCBnZXRtd2xf
bG9ja2VkKCksIGdldG14ZHNfbG9ja2VkKCksCiAgYW5kIGdldGhkcmNhcF9sb2NrZWQoKS4KLS0t
CiBkcml2ZXJzL2kzYy9tYXN0ZXIuYyAgICB8IDU5ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrLS0tCiBpbmNsdWRlL2xpbnV4L2kzYy9jY2MuaCB8ICA1ICsrKysKIDIgZmls
ZXMgY2hhbmdlZCwgNjAgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2kzYy9tYXN0ZXIuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci5jCmluZGV4IDAzN2Iz
Yjk4MDcxNy4uM2I2ZDNlY2Q5ZDEyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYwor
KysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIuYwpAQCAtOTE1LDE3ICs5MTUsNDYgQEAgc3RhdGljIHZv
aWQgaTNjX2NjY19jbWRfZGVzdF9jbGVhbnVwKHN0cnVjdCBpM2NfY2NjX2NtZF9kZXN0ICpkZXN0
KQogCWtmcmVlKGRlc3QtPnBheWxvYWQuZGF0YSk7CiB9CiAKLXN0YXRpYyB2b2lkIGkzY19jY2Nf
Y21kX2luaXQoc3RydWN0IGkzY19jY2NfY21kICpjbWQsIGJvb2wgcm53LCB1OCBpZCwKLQkJCSAg
ICAgc3RydWN0IGkzY19jY2NfY21kX2Rlc3QgKmRlc3RzLAotCQkJICAgICB1bnNpZ25lZCBpbnQg
bmRlc3RzKQorc3RhdGljIHZvaWQgaTNjX2NjY19jbWRfaW5pdF9yZXRyaWVzKHN0cnVjdCBpM2Nf
Y2NjX2NtZCAqY21kLCBib29sIHJudywgdTggaWQsCisJCQkJICAgICBzdHJ1Y3QgaTNjX2NjY19j
bWRfZGVzdCAqZGVzdHMsCisJCQkJICAgICB1bnNpZ25lZCBpbnQgbmRlc3RzLCB1bnNpZ25lZCBp
bnQgcmV0cmllcykKIHsKIAljbWQtPnJudyA9IHJudyA/IDEgOiAwOwogCWNtZC0+aWQgPSBpZDsK
IAljbWQtPmRlc3RzID0gZGVzdHM7CiAJY21kLT5uZGVzdHMgPSBuZGVzdHM7CisJY21kLT5yZXRy
aWVzID0gcmV0cmllczsKIAljbWQtPmVyciA9IEkzQ19FUlJPUl9VTktOT1dOOwogfQogCitzdGF0
aWMgdm9pZCBpM2NfY2NjX2NtZF9pbml0KHN0cnVjdCBpM2NfY2NjX2NtZCAqY21kLCBib29sIHJu
dywgdTggaWQsCisJCQkgICAgIHN0cnVjdCBpM2NfY2NjX2NtZF9kZXN0ICpkZXN0cywKKwkJCSAg
ICAgdW5zaWduZWQgaW50IG5kZXN0cykKK3sKKwlpM2NfY2NjX2NtZF9pbml0X3JldHJpZXMoY21k
LCBybncsIGlkLCBkZXN0cywgbmRlc3RzLAorCQkJCSBybncgPyBJM0NfQ0NDX1JFVFJJRVMgOiAw
KTsKK30KKworc3RhdGljIGludCBpM2NfY2NjX3ZhbGlkYXRlX3BheWxvYWRfbGVuKHN0cnVjdCBp
M2NfY2NjX2NtZCAqY21kKQoreworCXVuc2lnbmVkIGludCBpOworCisJaWYgKCFjbWQtPnJudykK
KwkJcmV0dXJuIDA7CisKKwlmb3IgKGkgPSAwOyBpIDwgY21kLT5uZGVzdHM7IGkrKykgeworCQlz
dHJ1Y3QgaTNjX2NjY19jbWRfcGF5bG9hZCAqcCA9ICZjbWQtPmRlc3RzW2ldLnBheWxvYWQ7CisK
KwkJaWYgKHAtPmFjdHVhbF9sZW4gPiBwLT5sZW4pCisJCQlyZXR1cm4gLUVJTzsKKworCQlpZiAo
cC0+bGVuICYmIHAtPmFjdHVhbF9sZW4gIT0gcC0+bGVuKQorCQkJcmV0dXJuIC1FSU87CisJfQor
CisJcmV0dXJuIDA7Cit9CisKIC8qKgogICogaTNjX21hc3Rlcl9zZW5kX2NjY19jbWRfbG9ja2Vk
KCkgLSBzZW5kIGEgQ0NDIChDb21tb24gQ29tbWFuZCBDb2RlcykKICAqIEBtYXN0ZXI6IG1hc3Rl
ciB1c2VkIHRvIHNlbmQgZnJhbWVzIG9uIHRoZSBidXMKQEAgLTkzNyw2ICs5NjYsOSBAQCBzdGF0
aWMgdm9pZCBpM2NfY2NjX2NtZF9pbml0KHN0cnVjdCBpM2NfY2NjX2NtZCAqY21kLCBib29sIHJu
dywgdTggaWQsCiBzdGF0aWMgaW50IGkzY19tYXN0ZXJfc2VuZF9jY2NfY21kX2xvY2tlZChzdHJ1
Y3QgaTNjX21hc3Rlcl9jb250cm9sbGVyICptYXN0ZXIsCiAJCQkJCSAgc3RydWN0IGkzY19jY2Nf
Y21kICpjbWQpCiB7CisJdW5zaWduZWQgaW50IGF0dGVtcHQsIG1heF9hdHRlbXB0czsKKwlpbnQg
cmV0OworCiAJaWYgKCFjbWQgfHwgIW1hc3RlcikKIAkJcmV0dXJuIC1FSU5WQUw7CiAKQEAgLTk1
NCw3ICs5ODYsMjUgQEAgc3RhdGljIGludCBpM2NfbWFzdGVyX3NlbmRfY2NjX2NtZF9sb2NrZWQo
c3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAqbWFzdGVyLAogCSAgICAhbWFzdGVyLT5vcHMt
PnN1cHBvcnRzX2NjY19jbWQobWFzdGVyLCBjbWQpKQogCQlyZXR1cm4gLUVPUE5PVFNVUFA7CiAK
LQlyZXR1cm4gbWFzdGVyLT5vcHMtPnNlbmRfY2NjX2NtZChtYXN0ZXIsIGNtZCk7CisJbWF4X2F0
dGVtcHRzID0gY21kLT5yZXRyaWVzICsgMTsKKwlyZXQgPSAtRUlPOworCWZvciAoYXR0ZW1wdCA9
IDA7IGF0dGVtcHQgPCBtYXhfYXR0ZW1wdHM7IGF0dGVtcHQrKykgeworCQl1bnNpZ25lZCBpbnQg
aTsKKworCQlpZiAoY21kLT5ybncpCisJCQlmb3IgKGkgPSAwOyBpIDwgY21kLT5uZGVzdHM7IGkr
KykKKwkJCQljbWQtPmRlc3RzW2ldLnBheWxvYWQuYWN0dWFsX2xlbiA9IDA7CisKKwkJY21kLT5l
cnIgPSBJM0NfRVJST1JfVU5LTk9XTjsKKwkJcmV0ID0gbWFzdGVyLT5vcHMtPnNlbmRfY2NjX2Nt
ZChtYXN0ZXIsIGNtZCk7CisJCWlmICghcmV0ICYmIGNtZC0+ZXJyID09IEkzQ19FUlJPUl9VTktO
T1dOKQorCQkJYnJlYWs7CisJfQorCisJaWYgKCFyZXQpCisJCXJldCA9IGkzY19jY2NfdmFsaWRh
dGVfcGF5bG9hZF9sZW4oY21kKTsKKworCXJldHVybiByZXQ7CiB9CiAKIHN0YXRpYyBzdHJ1Y3Qg
aTJjX2Rldl9kZXNjICoKQEAgLTEzNzIsNiArMTQyMiw3IEBAIHN0YXRpYyBpbnQgaTNjX21hc3Rl
cl9nZXRteGRzX2xvY2tlZChzdHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9sbGVyICptYXN0ZXIsCiAJ
CSAqIHdoaWxlIGV4cGVjdGluZyBzaG9ydGVyIGxlbmd0aCBmcm9tIHRoaXMgQ0NDIGNvbW1hbmQu
CiAJCSAqLwogCQlkZXN0LnBheWxvYWQubGVuIC09IDM7CisJCWkzY19jY2NfY21kX2luaXQoJmNt
ZCwgdHJ1ZSwgSTNDX0NDQ19HRVRNWERTLCAmZGVzdCwgMSk7CiAJCXJldCA9IGkzY19tYXN0ZXJf
c2VuZF9jY2NfY21kX2xvY2tlZChtYXN0ZXIsICZjbWQpOwogCQlpZiAocmV0KQogCQkJZ290byBv
dXQ7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2kzYy9jY2MuaCBiL2luY2x1ZGUvbGludXgv
aTNjL2NjYy5oCmluZGV4IGQ4MDUyOTQ5ZTU3ZS4uMjUwNmQ4M2I4MjU1IDEwMDY0NAotLS0gYS9p
bmNsdWRlL2xpbnV4L2kzYy9jY2MuaAorKysgYi9pbmNsdWRlL2xpbnV4L2kzYy9jY2MuaApAQCAt
MTIsNiArMTIsOCBAQAogI2luY2x1ZGUgPGxpbnV4L2kzYy9kZXZpY2UuaD4KIAogLyogSTNDIEND
QyAoQ29tbW9uIENvbW1hbmQgQ29kZXMpIHJlbGF0ZWQgZGVmaW5pdGlvbnMgKi8KKyNkZWZpbmUg
STNDX0NDQ19SRVRSSUVTCTEKKwogI2RlZmluZSBJM0NfQ0NDX0RJUkVDVAkJCUJJVCg3KQogCiAj
ZGVmaW5lIEkzQ19DQ0NfSUQoaWQsIGJyb2FkY2FzdCkJXApAQCAtMzc0LDEyICszNzYsMTUgQEAg
c3RydWN0IGkzY19jY2NfY21kX2Rlc3QgewogICogQG5kZXN0czogbnVtYmVyIG9mIGRlc3RpbmF0
aW9ucy4gU2hvdWxkIGFsd2F5cyBiZSBvbmUgZm9yIGJyb2FkY2FzdCBjb21tYW5kcwogICogQGRl
c3RzOiBhcnJheSBvZiBkZXN0aW5hdGlvbnMgYW5kIGFzc29jaWF0ZWQgcGF5bG9hZCBmb3IgdGhp
cyBDQ0MuIE1vc3Qgb2YKICAqCSAgIHRoZSB0aW1lLCBvbmx5IG9uZSBkZXN0aW5hdGlvbiBpcyBw
cm92aWRlZAorICogQHJldHJpZXM6IG51bWJlciBvZiB0aW1lcyB0byByZXRyeSBhIGZhaWxlZCBE
aXJlY3QgR0VUIENDQyAoc2VlCisgKgkgICAgICZJM0NfQ0NDX1JFVFJJRVMpCiAgKiBAZXJyOiBJ
M0MgZXJyb3IgY29kZQogICovCiBzdHJ1Y3QgaTNjX2NjY19jbWQgewogCXU4IHJudzsKIAl1OCBp
ZDsKIAl1bnNpZ25lZCBpbnQgbmRlc3RzOworCXVuc2lnbmVkIGludCByZXRyaWVzOwogCXN0cnVj
dCBpM2NfY2NjX2NtZF9kZXN0ICpkZXN0czsKIAllbnVtIGkzY19lcnJvcl9jb2RlIGVycjsKIH07
Ci0tIAoyLjQzLjcKCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWkzYwo=
