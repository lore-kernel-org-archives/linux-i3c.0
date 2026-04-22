Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A22AF9B5F5
	for <linux-i3c@archiver.kernel.org>; Wed, 22 Apr 2026 09:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VWUenVhgU2U++x6J8sLgzc1YZ2Tmco+XS7FDyqc1jis=; b=CIDZuNbmO6J9oG
	jAMdxKlyRjOW5aWYIn4K5Mwe4/uDo1ypX/Zy3b2+g2SB3j8dCD44o/yg+z7HPI7vDDm4jG/dPVegh
	O1ITxuehx4GUGi1Gbf1h0d2zcA9/31pnAd7G/sd+0ns4hy/P2Q4jp5ZpKWfmh8ZJ16FOOXrm1wogZ
	7bhOgaKWjbDH/MPMr90EH/9m44eF4uBvEnLXon7rOK27RpAPmOHNZWIC8gFRyMSQ9HsV/8z1pt9EK
	VRYNJPeFyzK9F/Oj+CbKgrCvWRFPjVnNcXen6t5i0DmVEj957IaVSYUcmfVtSd3L9653+jLqIVtyN
	b037pLtn/LOgO1+8gtHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFTk5-00000009phd-3LVw;
	Wed, 22 Apr 2026 09:19:33 +0000
Received: from mail-swedencentralazon11013035.outbound.protection.outlook.com ([52.101.83.35] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFTk3-00000009pgp-3qPr
	for linux-i3c@lists.infradead.org;
	Wed, 22 Apr 2026 09:19:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=frozXALvzgkZ7wqFO7tWZYnJw1e9reF2oyf0yRusHlje3jN5Qq2gQpyCs2R1vvZal9gWlaA/lYln1sRw7xj50iTXcGEsCTQy7eQijdFSIxs/7uzg9mdgl0ita675GXWq6eJsOvCnpuouxxKMADEHFMQMHhks/4szKTo0f6dExuwAnPavqtQZvkB4EadPUfaVg0Q14vNJaAuDCsgcnsm6QFJYbX7Ik/Sn0Kwm4dPRtInwy2oEulhkMkAaCuSo/vvtTa6hyvwv0eHH4ArS0CyAf1W1WM4R3iiNY6vviY7lrxN4vSASOkYxg/wRDPmVypSZKj1ON8m1Kxpv72dvb2aZ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=72Pk1el29vfmwWP9UIADy5S22FfgDeaIbiRfzczC0x4=;
 b=zDMVg4Eby6bhuWizQUtUJTfFsruCwJ3790wXfEs9YOSUlKqQxh8Bd8siFR4npeX9rar9h9YqlSXIaOu2Te21Vp1oLZzs/vXqBOR69h6YRqyNBclNbC/N6WpWLM1ZRCq6McprpwG5siKcnC6ws+2ZwNTOKdHFcDi3gaqRl8vvsN1v3aeFnMLaR4W0ODujyfT3rLI1yRKaP1rQVBcl7f1Nt+Cgz+AC0ESAK02TVhr3AME9KKWhjyiLknpA5Fxh4wB1/F+g1haaNdY79vLCcTSmjGlN5ZUY6XJ8Olh/uA9uCogz1MdZCK5AH8jHg40/ZwXYxddHwfJ7lQWAWaM+J8z8hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=72Pk1el29vfmwWP9UIADy5S22FfgDeaIbiRfzczC0x4=;
 b=bY+SnAURcPw0Sh96cBV0bTA+3SnUztWuDhJyP1ek9fYOwQhQ1zkYtRjIQKP1PXLH6ZBZz8dFonNDTLXUPBdo63GaCwviiPZkyJOgYOwiM3/OTuXJRH2wvPnCZYPv4tbFP+LGaKRW0UPiIysSFEbe8Flx2pVVinwZ5EyFouOSzBfpx4EbcPA3fzBZ4XWMtykao2Wl2vf9I8QTUpGWv8D7doQi56dDBUUDkAbISqtJTcU2oVJII4QH7S0LgGjXoLWCmIGit8edgS6Va/ollbBGv3ntoVLxTSw4oPZbbeEvCaNfjpKkdRWJEvi2omLWmZvLC8HPNafm2a0QElh1t6Nk9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB8612.eurprd04.prod.outlook.com (2603:10a6:20b:427::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Wed, 22 Apr
 2026 09:19:25 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 09:19:25 +0000
Date: Wed, 22 Apr 2026 05:19:16 -0400
From: Frank Li <Frank.li@nxp.com>
To: Stanley Chu <stanley.chuys@gmail.com>
Cc: miquel.raynal@bootlin.com, alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	tomer.maimon@nuvoton.com, kwliu@nuvoton.com, yschu@nuvoton.com
Subject: Re: [PATCH v1 1/2] i3c: master: svc: Fix missed IBI after false
 SLVSTART on NPCM845
Message-ID: <aeiSlFVfSrzd2fSC@lizhi-Precision-Tower-5810>
References: <20260413005040.1211107-1-yschu@nuvoton.com>
 <20260413005040.1211107-2-yschu@nuvoton.com>
 <adxD10wsP7hJdR9y@lizhi-Precision-Tower-5810>
 <CAPwEoQPsp6mEqHaztnjKvh9qd49H7jKbq0EGBBR_fa70e-iR=g@mail.gmail.com>
 <adxcMiW7HWr4KutC@lizhi-Precision-Tower-5810>
 <CAPwEoQNy7yMhfP-7rZevenwnasy2u_=nm0f4hReAbUbCc4-J1g@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAPwEoQNy7yMhfP-7rZevenwnasy2u_=nm0f4hReAbUbCc4-J1g@mail.gmail.com>
X-ClientProxiedBy: BY1P220CA0042.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59e::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB8612:EE_
X-MS-Office365-Filtering-Correlation-Id: b91f4980-8638-482b-fec4-08dea0503f50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|366016|19092799006|1800799024|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: uCGjsKIdzvKFhjUO3mHaNcxnuIhk+K7RmQHROpRZJRcA4dk9w+dvZm9+lWrAkUc0WLkP5r/jlNckuYGSueV+3PLPPGyGIO0n9jESJlOYm3k1JTbq7/JndRsRIjj/8Ub4tYcCo9HoGS1+VjG1mmXWSOxTym+k4qfjMDsYAoqRd9tTGnurcaWRX3/Aweb2RYElDK2tj1k/3jxlpD55/d0/NGV4So1iTSfCr7HKR2narI+i8rCOKxLMP8lf+PPoBgEpNsR/1qzkuTUbzMvC+XTW/bMN71a/Qzb+4LQvZhIsJX/RzImba+tAo7erONEQJZn4HuLhPAcxDDiuHYwob1orYQ0b2iLmk4En4qJqp23KeXfQHwzVmHzX3AW7IThwxewRg8fGCFN7t6o+8EECRbbHiTrgUXUJKFqMwnVQ9wA7FELJisul/khJAAKM04DFezymzGFKUlvW3KqpEHkz1bdJZ97KiMW+wSq6eKRpVGyD3vfF/vtLIIpLWIGVjpVEFVVsm1tnaDCfd+ZeNUowymWGw+u/387805pCckNZSEZLzPixqvH6sBzNYxWz1VjQP/GDhyzQ9rHyewKPwd4WSB+yMeVxPFF8OiML3EOTFXxesA+kTbWSs1shLvQ/KbEnHqgjm2Y+fFa5G9dyP1SsR/nbd/eCLNttBNOCVyY00o0dcb2SZAjW+zK08Nmk+EW1vA5SSctZzsZrJNhaJDZPykf6RnPIFyXH0YPBE32pD7YFeqbQdpKC9U6zbU+HwD14sgrtgRMlVgCWex2s0RLzTx8vvUhyJWHP/jHXg834+QOv8RI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(19092799006)(1800799024)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWxHUmJTalo0NVhhdHJibm5neTFSYzFGYUV0MmJrcEFYNkJDaWlXaFdvckRY?=
 =?utf-8?B?d3IvS1pDL2Q4Q2kzWVZYMFVYdGRzdHBoL1Z4STQzVXFha3l0NDNhcVBlTWti?=
 =?utf-8?B?cG9lcnNjMTJhRVQrMm5Md1lBVU1USEVqbUpoTWRHS2JiNG1rNVdXd0NWN2Nm?=
 =?utf-8?B?NVJYa3ZSc2ZnbnJGT1NIbU0wUzRoKzZzSHBGcVdmWlM1NXoyUUhBbVNSekpz?=
 =?utf-8?B?VWlHSm5tQ0N2cXgxRGdRK0NteGRyUEV1NHJvVEI2ZXUrTm5NU0xuQUVGQ0Ez?=
 =?utf-8?B?cFNhVnBHaGd5aVFLQ0E5Y0hFQzdiRlhIVjBDZEgxZ1JyVFJ3amkxaU9Yai9W?=
 =?utf-8?B?VTMrMzgwMzNwb0llTWV6aXVMbG5YM0FrSFRlbmNBcGJxc0gwSEM3SmxHTVAv?=
 =?utf-8?B?QkdzakNYRGhteWNhYm9vM3RtSWN4djB0Z2hVWTEvejNaMFp2MTltSXNiVzd0?=
 =?utf-8?B?Vmk5ZG00MElVUlZSd0tZRzhPSi96WVRWeXJEeGc4bDNwbktLOGlxR2Vaa2tM?=
 =?utf-8?B?dkxFcVRhZ0hmYlBLR3kzclZYL1RkR2hJYXUyWHRXa3d5ZGdab2FXczU1dHln?=
 =?utf-8?B?VTY3UmRZS1F6SVVhdlF0c3VqVUVIYTc2dzVib1MxWXBoUGRBNWRZbzBsdzFz?=
 =?utf-8?B?bW5uNjJQRThjVmdhT2RyRWIzc1FwaWVVaFBpYWZ2TDk4c1lVZU9NdXdnMDcy?=
 =?utf-8?B?VFprTlF2N0Y1eFdad3Z6ZXpEZDFibmd6NUdSeCtmTzdQM2JmMk40dzRPOENx?=
 =?utf-8?B?Z0REYWg1c2FmKzRONzJybEUxSEJwK2RmNnd1M3pqNE9lQkF4eFdQQXZ2V2Yv?=
 =?utf-8?B?ZlliK2RKdHY2QUJ6Z0JLVkg5OUhocVdpbEViOVhHTzRZdVM4NVVnOFRGWnov?=
 =?utf-8?B?c3JYeWNBWjk1Qk40ZzdpVWM5NEtteEtkVWp1RUhFNlZLYnNvWGd0RDgvU1E4?=
 =?utf-8?B?bWU4elQ0aVp4anAwWkRGYzI5V2dScHFqTXlLbUUwaXFyZERYMmVLNFkyOTl6?=
 =?utf-8?B?aGQ1Vlh3bEpJQktxd3FzMmZSWjV4aE9UckRxbjcrMTVkOU42dGl5dWRVL0Z2?=
 =?utf-8?B?T3VBS3FSdVZLdWhtTVdmeW1xT1VUMEl1MGtuWG1tS2VrRUs5eFZidEtkaGl1?=
 =?utf-8?B?S1VJeGtSa2dFN0ZSNThPM2dBcVVESFVMc3gvRFNJWkhIMTQzTy81dEp0VHVr?=
 =?utf-8?B?ZUQvVEdUTjBXc0J3T1dvSEpWYm9laDhEOFFueEM4K1p3RlRZWUVjM1BTQ1dE?=
 =?utf-8?B?S2xXbXEyVWZWUVpCTGhaR3NOZlk1bkdWbWhOb1NpR2JPaktXd3NZeDNGQ1ZJ?=
 =?utf-8?B?NG1VQnZFVnREY0gwcE0vWHhSMCsxemlZZStXSzVtLzFyM0wvcDZuWUxzUndB?=
 =?utf-8?B?UWxOTGtlaXAydWJQMVNabE1yMTZwdis3ZjBHTVNTMmd2VkFWbDFsUGM4WlRr?=
 =?utf-8?B?cXM1M0FxVVozS29ubXJBcUFiQ3pyb1crV3FhN3pGUlM5ZVcwMGtKUUZBWHVp?=
 =?utf-8?B?bjM3QUd4N2pRQ3ZzQ0FMQnpxcm10dGZxMWJPMVl3NDZEMmxkYlJoQ1hqaFIw?=
 =?utf-8?B?WkVKZ0taQ3NQeCtXMWloRnlRMUdaM0ZpVEJJYXFuWHkvMzdLQ3EvODhuQkV0?=
 =?utf-8?B?TEZ1Q1FveEFTSzc4MVo0OWtoUU1sUHUwbVQvN3pCNXY4ZVdxaFNiQkxPTDhy?=
 =?utf-8?B?NkhTV25CaTBBcjNLTlRSazlDSVFLYlorSDBGWkdsNVhONTRrN0lkVDNsZm0v?=
 =?utf-8?B?ODBqQUR4aFArT2tJWHBPcUJIejhDVmhXdXVKMjB1OHk2YURjZmJQeVRIc1FJ?=
 =?utf-8?B?Rnp6OVRqVlIvcGMvMmVoaEhmUVREU2JzaFFoRFNwdktYY09mcW9PemFmOFBF?=
 =?utf-8?B?WnB3andWV3I3N29RU1lqM2o5VW5vS0dPQmFBUXErRU1JQlFEWURYLzFkTVAr?=
 =?utf-8?B?Wm5YVnA3N3p3RzRDRHdXK2o2M0lTZFQ5QXBmOWdxM3hjTDg1MFkwM29zc2pB?=
 =?utf-8?B?cmdYbGU4cllUSHZFQ2x1ZDkrSnpHamJkblJHdkpxK0l0SWJsQjV5VkR4K0hz?=
 =?utf-8?B?MFJoSklRQnArdTBOSm1scXU0UTdxK2Z6cnFrTEsxUFlrODVDWWlaM0dxVU42?=
 =?utf-8?B?cUFqNG51NUh5dE1BSGhIN3M5VDkzTlgxdDg3aFd0eFY1MmthTHJKSS8xRk1n?=
 =?utf-8?B?UWgrSnF4SlF0eFdwbGJlTjBEVjNWRS92T2lCdldONkRwaWx5ZXZvMnlGWkFq?=
 =?utf-8?B?WnpyVVNOMll0a2FuN3lvc3d4N1VmLzRDUG50RllmdnRwRm1tOW41Z1VWYkJ4?=
 =?utf-8?B?cEFNcFdBYTJWLytteTFxUWlEUkVIcGFkY0dqZk1rN1R5Skk1akJ1Zz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b91f4980-8638-482b-fec4-08dea0503f50
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 09:19:25.5310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j7o7XAVPaDePpFYkYz0/nFG74BLH8Pl6eZ3lbeLIP5tdV/Blky63NBOpSWqmQxufS8YTUEFHzPaPp9SrYhbijg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8612
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_021932_065612_D80B6407 
X-CRM114-Status: GOOD (  36.08  )
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

T24gTW9uLCBBcHIgMTMsIDIwMjYgYXQgMTE6NTk6NTlBTSArMDgwMCwgU3RhbmxleSBDaHUgd3Jv
dGU6Cj4gT24gTW9uLCBBcHIgMTMsIDIwMjYgYXQgMTE6MDDigK9BTSBGcmFuayBMaSA8RnJhbmsu
bGlAbnhwLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gTW9uLCBBcHIgMTMsIDIwMjYgYXQgMDk6NDA6
MDJBTSArMDgwMCwgU3RhbmxleSBDaHUgd3JvdGU6Cj4gPiA+IE9uIE1vbiwgQXByIDEzLCAyMDI2
IGF0IDk6MTbigK9BTSBGcmFuayBMaSA8RnJhbmsubGlAbnhwLmNvbT4gd3JvdGU6Cj4gPiA+ID4K
PiA+ID4gPiBPbiBNb24sIEFwciAxMywgMjAyNiBhdCAwODo1MDozOUFNICswODAwLCBTdGFubGV5
IENodSB3cm90ZToKPiA+ID4gPiA+IEZyb206IFN0YW5sZXkgQ2h1IDx5c2NodUBudXZvdG9uLmNv
bT4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGUgTlBDTTg0NSBJM0MgY29udHJvbGxlciBtYXkgcmFp
c2UgYSBmYWxzZSBTTFZTVEFSVCBpbnRlcnJ1cHQuIFRoZQo+ID4gPiA+ID4gaGFuZGxlciBmaXJz
dCBsYXRjaGVzIE1TVEFUVVMgYW5kIHRoZW4gY2xlYXJzIFNMVlNUQVJULiBJZiBhIHJlYWwgSUJJ
Cj4gPiA+ID4gPiByZXF1ZXN0IGFycml2ZXMgYWZ0ZXIgdGhlIGhhbmRsZXIgbGF0Y2hlcyBNU1RB
VFVTIGJ1dCBiZWZvcmUgaXQgY2xlYXJzCj4gPiA+ID4gPiB0aGUgU0xWU1RBUlQgaW50ZXJydXB0
IHN0YXR1cywKPiA+ID4gPgo+ID4gPiA+IEhvdyB0aGlzIGhhcHBlbj8gSWYgaXJxIGhhbmRsZXIg
cnVubmluZywgaGFyZHdhcmUgKHJlYWwgSUJJKSB3aWxsIHRyaWdnZXIKPiA+ID4gPiBpcnEgbGlu
ZSBiZWZvcmUgaXQuCj4gPiA+ID4KPiA+ID4gPiBEbyB5b3UgZW5hYmxlIG90aGVyIHR5cGUgaXJx
Pwo+ID4gPiA+Cj4gPiA+ID4gRnJhbmsKPiA+ID4KPiA+ID4gSGkgRnJhbmssCj4gPiA+Cj4gPiA+
IE9ubHkgU0xWU1RBUlQgaW50ZXJydXB0LiBCZWxvdyBpcyB0aGUgc2VxdWVuY2U6Cj4gPiA+IC0g
SFcgcmFpc2VzIGEgZmFsc2UgU0xWU1RBUlQgaW50ZXJydXB0Lgo+ID4gPiAtIFRoZSBJUlEgaGFu
ZGxlciBsYXRjaGVzIHRoZSBNU1RBVFVTIHJlZ2lzdGVyLgo+ID4gPiAtIEJlZm9yZSB0aGUgaGFu
ZGxlciBjbGVhcnMgdGhlIFNMVlNUQVJUIHN0YXR1cywgYSByZWFsIElCSSByZXF1ZXN0IGFycml2
ZXMuCj4gPiA+IC0gSFcgdXBkYXRlcyB0aGUgU0xWUkVRIHN0YXRlIHRvIGluZGljYXRlIGEgcGVu
ZGluZyBJQkkuCj4gPiA+IC0gVGhlIGhhbmRsZXIgY29udGludWVzIHVzaW5nIHRoZSBzdGFsZSBN
U1RBVFVTIHNuYXBzaG90LCBkb2VzIG5vdCBzZWUKPiA+ID4gICB0aGUgbmV3IFNMVlJFUSBzdGF0
ZSwgYW5kIHJldHVybnMgZWFybHkuCj4gPgo+ID4gQmVjYXVzZSByZWFkaW5nIHJlZ2lzdGVyIGFu
ZCBJQkkgcmVxdWVzdCBhcnJpdmluZyBhcmUgdG90YWxseSBhc3luYwo+ID4KPiA+IHJlYWRsKG1h
c3Rlci0+cmVncyArIFNWQ19JM0NfTVNUQVRVUyksICBtYXkgcmV0dXJuIHR3byByZXN1bHRzCj4g
PiAxLiBiZWZvcmUgSUJJIHJlcXVlc3QKPiA+IDIuIGFmdGVyIElCSSByZXF1ZXN0Cj4gPgo+ID4g
SG93IGRvIHlvdSBtYWtlIHN1cmUgc2Vjb25kIHJlYWRsKG1hc3Rlci0+cmVncyArIFNWQ19JM0Nf
TVNUQVRVUykgYWx3YXlzCj4gPiBnZXQgdGhlIHJlc3VsdCBvZiBhZnRlciBJQkkgcmVxdWVzdC4K
PiA+Cj4gPiBGcmFuawo+Cj4gSGkgRnJhbmssCj4gVGhlIG9yZGVyaW5nIGJldHdlZW4gdGhlIHNl
Y29uZCByZWFkbChNU1RBVFVTKSBhbmQgdGhlIHJlYWwgSUJJIGFycml2YWwgaXMKPiBub3QgY3Jp
dGljYWwsIGFzIGxvbmcgYXMgdGhlIHNlY29uZCByZWFkIGlzIHBlcmZvcm1lZCBhZnRlciBjbGVh
cmluZyBTTFZTVEFSVC4KPgo+IFRoZXJlIGFyZSB0d28gY2FzZXM6Cj4gMS4gSUJJIGFycml2ZXMg
YmVmb3JlIHRoZSBzZWNvbmQgcmVhZAo+IEFmdGVyIFNMVlNUQVJUIGlzIGNsZWFyZWQsIEhXIGhh
cyBhbHJlYWR5IHVwZGF0ZWQgdGhlIFNMVlJFUSBzdGF0ZSwgc28gdGhlCj4gc2Vjb25kIE1TVEFU
VVMgcmVhZCBjYW4gb2JzZXJ2ZSB0aGUgcGVuZGluZyBJQkkgYW5kIGhhbmRsZSBpdCBpbiB0aGUg
c2FtZQo+IElSUS4KPgo+IDIuIElCSSBhcnJpdmVzIGFmdGVyIHRoZSBzZWNvbmQgcmVhZAo+IEV2
ZW4gdGhvdWdoIHRoZSBzZWNvbmQgTVNUQVRVUyByZWFkIGRvZXMgbm90IHJlZmxlY3QgdGhlIHBl
bmRpbmcgSUJJLCB0aGUKPiBJQkkgd2lsbCBhc3NlcnQgU0xWU1RBUlQgYWdhaW4uIEEgbmV3IGlu
dGVycnVwdCB3aWxsIGJlIGdlbmVyYXRlZAo+IGFmdGVyIHRoZSBjdXJyZW50Cj4gaGFuZGxlciBy
ZXR1cm5zLCBhbmQgdGhlIHBlbmRpbmcgSUJJIGlzIGhhbmRsZWQgaW4gdGhlIG5leHQgSVJRLgoK
UmV2aWV3ZWQtYnk6IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29tPgo+Cj4gVGhhbmtzLgo+Cj4g
Pgo+ID4gPiAtIFRoZSByZWFsIElCSSBpcyBtaXNzZWQgYW5kIG5vIGZ1cnRoZXIgaW50ZXJydXB0
IGlzIGdlbmVyYXRlZC4KPiA+ID4KPiA+ID4gVGhhbmtzLgo+ID4gPgo+ID4gPiA+Cj4gPiA+ID4g
PiBIVyBzZXRzIHRoZSBTTFZSRVEgc3RhdGUuIEhvd2V2ZXIsIHRoZQo+ID4gPiA+ID4gaGFuZGxl
ciBzdGlsbCByZWxpZXMgb24gdGhlIHN0YWxlIE1TVEFUVVMgc25hcHNob3QsIHJldHVybnMgZWFy
bHksIGFuZAo+ID4gPiA+ID4gbWlzc2VzIHRoZSByZWFsIElCSS4gTm8gZnVydGhlciBpbnRlcnJ1
cHQgaXMgZ2VuZXJhdGVkIGZvciB0aGlzIHBlbmRpbmcKPiA+ID4gPiA+IElCSS4KPiA+ID4gPiA+
Cj4gPiA+ID4gPiBSZS1yZWFkIE1TVEFUVVMgdG8gb2J0YWluIHRoZSBsYXRlc3Qgc3RhdGUgYW5k
IGF2b2lkIG1pc3NpbmcgYSByZWFsIElCSQo+ID4gPiA+ID4gZHVlIHRvIHRoaXMgcmFjZSBjb25k
aXRpb24uCj4gPiA+ID4gPgo+ID4gPiA+ID4gRml4ZXM6IDRkZDEyZTk0NGYwNyAoImkzYzogbWFz
dGVyOiBzdmM6IEZpeCBucGNtODQ1IGludmFsaWQgc2x2c3RhcnQgZXZlbnQiKQo+ID4gPiA+ID4g
U2lnbmVkLW9mZi1ieTogU3RhbmxleSBDaHUgPHlzY2h1QG51dm90b24uY29tPgo+ID4gPiA+ID4g
LS0tCj4gPiA+ID4gPiAgZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMgfCAxNiAr
KysrKysrKysrKystLS0tCj4gPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pCj4gPiA+ID4gPgo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jIGIvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1p
M2MtbWFzdGVyLmMKPiA+ID4gPiA+IGluZGV4IGI4NGIzMjRlNDExMS4uN2Q4OGU4ZmUzNzQyIDEw
MDY0NAo+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMK
PiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNjLW1hc3Rlci5jCj4gPiA+
ID4gPiBAQCAtNjcyLDEwICs2NzIsMTggQEAgc3RhdGljIGlycXJldHVybl90IHN2Y19pM2NfbWFz
dGVyX2lycV9oYW5kbGVyKGludCBpcnEsIHZvaWQgKmRldl9pZCkKPiA+ID4gPiA+ICAgICAgIC8q
IENsZWFyIHRoZSBpbnRlcnJ1cHQgc3RhdHVzICovCj4gPiA+ID4gPiAgICAgICB3cml0ZWwoU1ZD
X0kzQ19NSU5UX1NMVlNUQVJULCBtYXN0ZXItPnJlZ3MgKyBTVkNfSTNDX01TVEFUVVMpOwo+ID4g
PiA+ID4KPiA+ID4gPiA+IC0gICAgIC8qIElnbm9yZSB0aGUgZmFsc2UgZXZlbnQgKi8KPiA+ID4g
PiA+IC0gICAgIGlmIChzdmNfaGFzX3F1aXJrKG1hc3RlciwgU1ZDX0kzQ19RVUlSS19GQUxTRV9T
TFZTVEFSVCkgJiYKPiA+ID4gPiA+IC0gICAgICAgICAhU1ZDX0kzQ19NU1RBVFVTX1NUQVRFX1NM
VlJFUShhY3RpdmUpKQo+ID4gPiA+ID4gLSAgICAgICAgICAgICByZXR1cm4gSVJRX0hBTkRMRUQ7
Cj4gPiA+ID4gPiArICAgICBpZiAoc3ZjX2hhc19xdWlyayhtYXN0ZXIsIFNWQ19JM0NfUVVJUktf
RkFMU0VfU0xWU1RBUlQpKSB7Cj4gPiA+ID4gPiArICAgICAgICAgICAgIC8qCj4gPiA+ID4gPiAr
ICAgICAgICAgICAgICAqIFJlLXJlYWQgTVNUQVRVUyB0byBvYnRhaW4gdGhlIGxhdGVzdCBzdGF0
ZSBhbmQgYXZvaWQKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICogbWlzc2luZyBhbiBJQkkgdGhh
dCBhcnJpdmVzIGFmdGVyIE1TVEFUVVMgaXMgbGF0Y2hlZAo+ID4gPiA+ID4gKyAgICAgICAgICAg
ICAgKiBidXQgYmVmb3JlIFNMVlNUQVJUIGlzIGNsZWFyZWQuCj4gPiA+ID4gPiArICAgICAgICAg
ICAgICAqLwo+ID4gPiA+ID4gKyAgICAgICAgICAgICBhY3RpdmUgPSByZWFkbChtYXN0ZXItPnJl
Z3MgKyBTVkNfSTNDX01TVEFUVVMpOwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgICAgICAgICAg
ICAvKiBJZ25vcmUgdGhlIGZhbHNlIGV2ZW50ICovCj4gPiA+ID4gPiArICAgICAgICAgICAgIGlm
ICghU1ZDX0kzQ19NU1RBVFVTX1NUQVRFX1NMVlJFUShhY3RpdmUpKQo+ID4gPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICAgIHJldHVybiBJUlFfSEFORExFRDsKPiA+ID4gPiA+ICsgICAgIH0KPiA+
ID4gPiA+Cj4gPiA+ID4gPiAgICAgICAvKgo+ID4gPiA+ID4gICAgICAgICogVGhlIFNEQSBsaW5l
IHJlbWFpbnMgbG93IHVudGlsIHRoZSByZXF1ZXN0IGlzIHByb2Nlc3NlZC4KPiA+ID4gPiA+IC0t
Cj4gPiA+ID4gPiAyLjM0LjEKPiA+ID4gPiA+CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdAps
aW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
