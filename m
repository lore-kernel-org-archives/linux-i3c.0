Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D86CA0FED
	for <linux-i3c@archiver.kernel.org>; Wed, 10 Sep 2025 06:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OM5gGAWYDHWuNI9U5ec1HjQX3TGcS+zXl2XATrbSfcY=; b=5HCqOBLjK3Y6OS
	5XlJlN+7YypJocrgEVd5weoRp5a4oZ8BlEMoeSJQImfCNIPb2aRZ2w8MMczvLMnq2Shc4nDQl2hUJ
	QpYXRXM4oHkDQ8gGX9zQQ24tQpNGjooR5FXts+5jrIyDB0okJhGpE8/G5BHpvY/rwEgzxzOmBYM9C
	STewBUuIOjA40IJjSeuOb0VuzDdkzIil8g73Bci8mt87wdb6Cd31vIh3ypIygDAnbuPcXeArMAkHp
	8Q/mxgZ0q3snSIpmoEHCxIMviz/SeUYPzTGgSqdt+BnHaN5fIGkDVrBzHpgKxWKR2Pj0wo0yib09U
	2hUgbbjGijujfcqgVUvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwE68-0000000CGGL-138n;
	Wed, 10 Sep 2025 06:14:28 +0000
Received: from mail-bn8nam04on20617.outbound.protection.outlook.com ([2a01:111:f403:2408::617] helo=NAM04-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwE66-0000000CGFu-2Ei0
	for linux-i3c@lists.infradead.org;
	Wed, 10 Sep 2025 06:14:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kb9umoh7v2AgbnPQYTOGNow57vhmnXoN2jZdo/HZxwN1J9LZwcLg/sAaQ3v+S3sQ0/wL82qEev9V/hfusZYeWIx2L1Z217LfijJNcI3yQBjGHuqnPKGkU5L1ytwrXOGi8uUI9PH6OSgj5JeTNW4Wvu8fUS7yg1xQZzGJmBYK7MDEI+ZwdPCyhqIYcWak6zz0iGDVBxxlBiN5r/7syTUFoyQTDOWxy6sRUI035A+SenMxoiXHSDnuRI2Sqs8rDO2LBRX0qaVzNckcVb/zLjkAU9JqZGCVyMbQSJ6MNQNR/agkJjgSemUzPKaoNxOdeXM04DDveVWb1ZbhKBenVP6Qlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9O09rpDyOme9lNYfM/k376W0vSNGYVAqWJ++kX2/fmk=;
 b=YJX63tvJNRAeFlwsNaeCr7t2Tijw9sT3cBCxwcIYob5gxArpwBLW3+QG//dGdks0aw3Vg99IZBODGWMj3cmqWkaYEBQOjFYKYgFwqQuESNr11hHKQ7IYAa2q4awpwccxnuVk7syukbu9g8eS5JbqgaAFQpUtG1ntuuFsJxrFciGsQkZUdgPRddd3orgVJcEKIgB0FqlWAOSvFVkoP7KNndM7yr7cSUH9KcYLP8gMprr8rPfpKeABEkEgYSZwlXq2Vrw4hFDLnETBd5j9aVqTHncUHkiXCuQccyficXDUYHOlPiRn9AHYnZoc5lOcm43lSj2WDrVbY1r2F+Gie4+cpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9O09rpDyOme9lNYfM/k376W0vSNGYVAqWJ++kX2/fmk=;
 b=AxVd3oQeuvnG9k9BodPoV0R7bQrNbtrJQKoePvl1tZMc8uY77lzLHQIlQkF5YLoBG/8DWiCfXtkbjaOewXeHcc3x0qA25tCuIWiVcsrSoLtTl2J91MMDnLsWqyfgsOitzsJ2YXNMqmuTdcNZY9G1Ft2aKCNIXJtS+LQyAC05E0xo26f5OyNfmuMfpKoowmk5W6s+ry9eZaCtKLNGnWEqTGvCX8/H/TYko3H5Cr4V1D/W60+wbQ7Jwu6UTLusR8mcljg0lfaCDHVk8OiLUiqHN0ULrOY5lvwvmORNQ0mwdeumrRe8HyoEvnkVRFJQ3Kp5hKNJfJVstjhJydSVgLJrKg==
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 CH3PR11MB7392.namprd11.prod.outlook.com (2603:10b6:610:145::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 06:14:21 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%6]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 06:14:21 +0000
From: <Durai.ManickamKR@microchip.com>
To: <conor@kernel.org>
CC: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alexandre.belloni@bootlin.com>,
	<Frank.Li@nxp.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <Balamanikandan.Gunasundar@microchip.com>,
	<Nicolas.Ferre@microchip.com>
Subject: Re: [PATCH 0/4] Add Microchip I3C controller
Thread-Topic: [PATCH 0/4] Add Microchip I3C controller
Thread-Index: AQHcIXrk5kZg+kX5Z0eoZKz+GqPMYLSLQgOAgACvUQA=
Date: Wed, 10 Sep 2025 06:14:21 +0000
Message-ID: <d3daaab9-71f5-49e6-b3de-b05339fa7adf@microchip.com>
References: <20250909111333.170016-1-durai.manickamkr@microchip.com>
 <20250909-pointy-tanning-8e7b4320979d@spud>
In-Reply-To: <20250909-pointy-tanning-8e7b4320979d@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB6541:EE_|CH3PR11MB7392:EE_
x-ms-office365-filtering-correlation-id: 21e8683c-f963-4455-5d74-08ddf0314868
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?UVR4VE40aHhxaTJiYWZvQ1VwUVRRdUxzeFVhQTVjSjZNcDJHTDRUcVBBYW50?=
 =?utf-8?B?ZHFuT2ZDbHJrRW1WTk84UDAxYzF1UlB5VUVQV3h0V0l1NEpYOTJwLzFPTnlQ?=
 =?utf-8?B?TXM5US96K29IdVlvZlcyWktFSmFRbCtLaHo1SjdVNlo2bEJVQldGZHh0NmVx?=
 =?utf-8?B?czhQSXhsZURjSkpuUmQvM2VNQUpsRG1ma1VocENaYUo1VTNiN0RpVkZGbjRK?=
 =?utf-8?B?VXUxK2JWSnJId3k4RkxKcEdmUEtZblVOMzRPbE5PT2l0QXNVS3E0RWN5Q0RD?=
 =?utf-8?B?VlEwMUxjbXhHK1UreWtyOGxqN3pKSkVrTE92dDNDUnoyTUxwNUptOENFcmt2?=
 =?utf-8?B?dmNRVU5wY2hvUFZsYkh1VnhWS0dIeGFJeDgxZGxTTmpzR21LcTR3amlEL2FH?=
 =?utf-8?B?Q1I3Tnh3VVo5aldxQkprcG5OUXRZZ2M4eTJRZ3dlTHUvZitaUXdqY3pCQzhJ?=
 =?utf-8?B?eDNDZkNmSFJXK1NVbTFsNTdoL2QvYm5GRmQ4WTNIWFR3anB3QVNrVDZRS2R0?=
 =?utf-8?B?aXhQNEc2OUNEaVhGaGFNQVNTcnE3UCs1YWpsK05CTFU4YjhJSjZZVVYwdndL?=
 =?utf-8?B?aWFNc2VuOVNvZkFkcjc0eCtTWXNleHUzakQ3STdMU3YyRVdlaU9xemRxYlJi?=
 =?utf-8?B?bzJCNnpqWTI1cEZLZFNObzRsLzAzUldUa3lNOG5VMXRSTk5PSFdHdjRDd0Ix?=
 =?utf-8?B?TjE4MjV4aThNQlB0S2VYSFUxbU5KcnVXN1IzYTFIL0s3NnNaY0ZxV0RnSlZR?=
 =?utf-8?B?aTAvc0JtbzFzWGFBeUROeEtDb0VWRWovOE82N1VwOHFad1lTSHFpanRiNEF1?=
 =?utf-8?B?aFZiZGdReHdZVk9SRVRPWTc3RmIreFZ6M0thakhFQ0FvYkdXbFFaa09FNzZx?=
 =?utf-8?B?WDJqYkxrV0hIOVBrWDZrcHNKWVpGdExpWExBeUU3bndzdGJQZmxwK1JoZGtJ?=
 =?utf-8?B?aXpBSmlkNjZGWUJmZ29yeFJ2QklJd0JyYm5LRXZiSEVEUlNSNzRsUFlPYi94?=
 =?utf-8?B?OGRQbXJRamgraXFTU3V4NmVEdUNDTlVDRlMyR2krYVBrMGFJS0VwSWYrUWlL?=
 =?utf-8?B?TmNZdnc5dURCZXNHa2xqbUJjaGk2clFSOCs4c2ovbEdudzZQWFVQTERsTTVM?=
 =?utf-8?B?VHdFLzgvNHdhL2NrOWRWRk80UnpSdmxqMjRiMGs2SDh2bExQNE9tVjZQZ3d0?=
 =?utf-8?B?SVlTTmJ6c1czWGdtYXZlbW1KTkVSSmVWbjNndVNsUnhwck1qZlpQWmNhdytv?=
 =?utf-8?B?TjdWcFdJTWcyUXhkZW00M0w1dFM4MS9IK1hHUUN3eklpcHRMVVYvSHNYbWM2?=
 =?utf-8?B?T20wSS85SFp5VnVwdHcra3h4d3NWcGJoVzFVSEJVcUcvTXNPeVJVSVlQWFR0?=
 =?utf-8?B?Y0hjUUNFZ00zd000NEY0dzJscWRRWDJXVVVhc0VhSzhJVjZGMUJEejJZQ0tr?=
 =?utf-8?B?MUg5Z24xWjBjQWJlU285YmE3QkduZ1p3WWU1ZmlvdVlpZmxMb0xnQXhYZVRh?=
 =?utf-8?B?dVIyaWNhMEx3QWFSQitQb1B2dGdUQzJKUkNwNDdMbmFYQlJOYlcxY1lWYmY2?=
 =?utf-8?B?aWp2aFlFRExKQkVCczgydTl6eUtDSEdEK09sN1RJMXhFNWhJWVk3UUpMd2ta?=
 =?utf-8?B?enNlTUZNNlFaYWxuZUdWVUl6Rkx3TXdjQjg0M1daUUxyNHVlZytpNmhHckRL?=
 =?utf-8?B?R29vWVJ0SGdqZlZCRmxZNEhqYkV1Z1dVTFp3RkkraGdHS0RUdzgzVFZiZFlS?=
 =?utf-8?B?a3lyQ0NtcHE5SCs2eDVicHZLMHFTU0pFdk5MQmtNNUtsRVVLZkZyOUdNMmkx?=
 =?utf-8?B?UGRPTVhESFRsbU91NmxmZ0ZXM0plMkQ2S0NSV3UydHFBWVNEUnBFdEJJK0th?=
 =?utf-8?B?OFNBdXdMbUthT0cyTWhLZSttZlp3NHFtNFdGWFFhUVNVRlRtdVA0b3Uxd28z?=
 =?utf-8?B?VkdhTm53RGFrMFVKclpxWStVL002TldLQTNtbGJ6aUpkYytDcUpEejd2NVZr?=
 =?utf-8?Q?Y5AEjwVBpegCw77UsTyhf1AB9Ch700=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6541.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RXRCdTZXV01BYU0rK1J5NUdpNG10dm83THJQdEFDMWxLYlFIaVdad0VRaDcx?=
 =?utf-8?B?NEJZRE5seEVhRFd0MC83WWRCUlZpV2t4cHRIZHRqL1VKSDB5QnQ1bDNNTlA5?=
 =?utf-8?B?TExGWnBQcHdXajUyVUVQTzVFSXR6SmdBeWRSaHd5RFlQMXhrZUh4cTNpQUNi?=
 =?utf-8?B?MFk1ZnNTSEN5bVRZbFB4WXh4K1c2SXNRZFYrU3lTTUkvZElsL0tOV0RtbDA2?=
 =?utf-8?B?b2pZSjJXa3Uwb0tTemNnK08xT2YwUVFXVGR0REVnV0FEM3ZJY0VCdEpoNFE3?=
 =?utf-8?B?NVBhVE5tdVF4ZjlDcXh1UkVIeWtDK09OeTlNdjBtWUIzbEJKQUp1WExUTVRq?=
 =?utf-8?B?SXJqTE1hV2cwWmNoNUZvYmtBdVVNVHhaeUdZMSt1R2NNQUtiTUFIclpJQUhK?=
 =?utf-8?B?RG5KbmprUUpOYlZwVnp5MzRlcW9COUlLa1J4ZG01Wk9uaEtjSnFjZjdpK0J6?=
 =?utf-8?B?MmdLMy92SnhaeUM3SG5IV1ZmVGg2bFdMelE2UlZtQ20wL2VBRWh1WmRzMnlO?=
 =?utf-8?B?cTdWK1FzNlJWWk44enVzUjE3SXYxRTBMNFMxZEpwbURCOGVLZVJVTE8rUnhm?=
 =?utf-8?B?Sko4dTZaYU1ORlhHcEFJSWVyT1ROUnEycWVEWTV4NFhYemExRTJRWkl0MUxz?=
 =?utf-8?B?bk9FN3ZyNnVRaFMyeGNaYkZZVHFGeUZxVURMeDRtOG5vZjhjOGtYMlI0ZjdC?=
 =?utf-8?B?VVNyMXBjSUtzWkYyY0xkQ05mbHN2V0l3UXhwZGc4TUpid2plVmExTWR6NHh3?=
 =?utf-8?B?VldnQ3V4bVU4R3JHdDJQZHA5SGw3clNEb3BILzZmSDBadG8zdC9vUFZyVk1M?=
 =?utf-8?B?ZFgvUmNXL0MzSU12TGlobDkvSHJNWktVUVVvVWxLeWVGSCt6ZzRJYXREc0d1?=
 =?utf-8?B?MU5ibWJuNDRFbDB2aTRsWXp3bW1xcmY0K3A4TmpucTVwZjRrRFpFMWVxMlp6?=
 =?utf-8?B?UXhZT3pPUGtVcmZneEZmWEhjaW1mZ2ZyQ1U2dnB5VGJjeU8vQ3MwdEo2NUJF?=
 =?utf-8?B?OFV6VDA0SEpwRmxNalVsN1B0NHR5Y0wvVjlkak5teDNjcVpOVitsWDgvMW95?=
 =?utf-8?B?SmxSYkpFenM3S0xuVWVUblRrTlRkcWg1SHVHNGdBOVM4OFpxZDk1cW9BVHlu?=
 =?utf-8?B?Z1A1cU1wNmxPa2x3WWxKYXhmd3YvNkRYeDcyUENyRFZXMUpIUzU0MkVqV01k?=
 =?utf-8?B?RVFaRHNOT2NPcXZ0eDJHQk9TOUlXWFRDSXRoV2N0YUlKS0JIQ0RMdWJOUVhn?=
 =?utf-8?B?eVI3ckVPSmdGdHhFb1ZCamxaRXpjbE1sREtya2hkOVlSbnBtK0ZQbWpXS244?=
 =?utf-8?B?MnQxTHFjdmFKZFduYWJGWnVYS3pxNEJvZHlMUmJGSGhESXNRQzd6K3l1d1hX?=
 =?utf-8?B?cVdrRzcxakFqcVhYQUEwNHlJT2lSNWhiSFNMVWtkNGxIV3FLWUJ4c0E3RlR2?=
 =?utf-8?B?dW5xTUhhenQwTGpXZzg1QmNqTmc5YWxSOHpkVVk4bFBUWjBkWWt5WFdtV3BM?=
 =?utf-8?B?NzV0MEkveXBzc1lrWFRsR3NNS0hFZERVeXNDWkhqSmNSd2Ntd29odURGc3M5?=
 =?utf-8?B?U3M5SEJPbUxyb2JkRDg2Yms2Zmh0em1WTVVmT2RZMU1Lc09SR2tNL1BsVm4z?=
 =?utf-8?B?M1d1QWdndmlwVzVSamhRYUExU0tEdlhEN3JEM0JlUTVZYnVqNjhUelVKN1Bo?=
 =?utf-8?B?aitMQlFDVXI5enNpSWFRRVJPZlRVeUp2QmVtNkpiNnhEbWN1TGJNRVMvTGJL?=
 =?utf-8?B?RmRUd3BqNHNhWUFwT2dncHl3LzNCSjhxVG9kVWJOVU5ocGVmYXNZVUNkalJZ?=
 =?utf-8?B?dEpXdHJaUExYSys2RUYraVROSG5lUVFFZ29zekRvdDZFSG5EOUxMMG1FdmJ5?=
 =?utf-8?B?R0RMY05XeW91Mm9QajlJV2ZvSVVNZmJNdktaNnVHWTl2dHd3YUU5T0NZZUFX?=
 =?utf-8?B?Rnk0QzhYenVONmVPZUc1NVlza2U4VmVQc0tKQjAyZ25YZ1FBNkdkYytnR0VQ?=
 =?utf-8?B?N1dRUWhZTXVyeXBELzhEUjl2VHYyQVZjS0t1MVFEVlQ3OXMrZ1BMbDl4Vy9p?=
 =?utf-8?B?TGNucytndkd3cHozOCtKcEpScTk2WG9MdTVDZG50Vk9RWHBPdGs0bEZ0SzF6?=
 =?utf-8?B?eVVNbnFwaGRxZEVXcFFCOWIxYjYyWVcrV1I2NWZyY3BiVVRqL3FIVFdiYWRn?=
 =?utf-8?B?WXc9PQ==?=
Content-ID: <955A77451246394A81778490813C4671@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21e8683c-f963-4455-5d74-08ddf0314868
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2025 06:14:21.5309
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KfPd7d54wyDgq8YEee0ISFnsdravQ8ewI7pkz/ZdOrLLF27/Yg7rOsu17rUL/uqaEHBVyGOkrMsH7RWF5VwO9nXr0NEACsc2dwgk0aZiuE4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7392
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_231426_574419_97024F71 
X-CRM114-Status: GOOD (  16.48  )
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

On 10/09/25 01:16, Conor Dooley wrote:
> On Tue, Sep 09, 2025 at 04:43:29PM +0530, Durai Manickam KR wrote:
>> Add support for microchip SAMA7D65 I3C HCI master only IP. This
>> hardware is an instance of the MIPI I3C HCI Controller implementing
>> version 1.0 specification. This driver adds platform-specific
>> support for SAMA7D65 SoC.
>>
>> I3C in master mode supports up to 12.5MHz, SDR mode data transfer in
>> mixed bus mode (I2C and I3C target devices on same i3c bus). It also
>> supports IBI mechanism.
>>      
>> Features tested and supported :
>> 	Standard CCC commands.
>>         	I3C SDR mode private transfers in PIO mode.
>>         	I2C transfers in PIO mode.
>>         	Pure bus mode and mixed bus mode.
>>
>> Testing done:
>> With this patch we are able to fully configure the lsm6dso I3C slave
>> device. Unlike I2C, I hope there is no linux utility to check the
>> various transactions supported in the host controller. These features
>> will be added later on this driver after testing (probably with I3C
>> analyser KIT).
>>
>> Durai Manickam KR (4):
>>    clk: at91: sama7d65: add peripheral clock for I3C
>>    i3c: master: add Microchip SAMA7D65 I3C HCI master driver
>>    ARM: configs: at91: sama7: Add SAMA7D65 I3C HCI master
>>    ARM: dts: microchip: add I3C controller
>>
>>   arch/arm/boot/dts/microchip/sama7d65.dtsi    |   12 +
>>   arch/arm/configs/sama7_defconfig             |    2 +
>>   drivers/clk/at91/sama7d65.c                  |    5 +-
>>   drivers/i3c/master/Kconfig                   |   14 +
>>   drivers/i3c/master/Makefile                  |    1 +
>>   drivers/i3c/master/sama7d65-i3c-hci-master.c | 2705 ++++++++++++++++++
>>   6 files changed, 2737 insertions(+), 2 deletions(-)
>>   create mode 100644 drivers/i3c/master/sama7d65-i3c-hci-master.c

Hi Conor,

Was planning to sent along with the review comments received for the i3c 
driver. Will add this and send in patch v2 series.

> Where is your dt-binding?


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
