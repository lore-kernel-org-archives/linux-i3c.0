Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBC0C87FCC
	for <linux-i3c@archiver.kernel.org>; Wed, 30 Jul 2025 23:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=as48wjpUlxpODu2NvtKhhF0wg3SxIlCepSkYsEFaEQk=; b=GBTeDT2H68xJyY
	YoJWySS/YatXGx0h+ERQeI86QWpaOaIE0i6wpFDs4+rqGLDjgSVrulkXXSirB6K/zFYi5bV0o3JHm
	33X2VIGpDMYaWDOFeQCAkJQiWa7iUyX3srgbLC/3SCCz1QGI1WTDOBw5l+ALVrPoWlLozfyVU3vVe
	Gw1J6elgzVNVSMePyHfYrwWUlIz59mK8gnBTTBNZ1+aphUMVTmY/d/1LGyMCbOMlMXmlPsABwaRIj
	rgOimqxC+wxMH6zi4oVZlMYDQMZftW+YnThHA4bzs9g2KZzjIrBLC2q7rQbAU0PSEnxtaZq4A9aN+
	eSXhH1WVmvp8WukHfQZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhGDB-00000002bku-1vML;
	Wed, 30 Jul 2025 23:27:53 +0000
Received: from mail-dm6nam11on2061d.outbound.protection.outlook.com ([2a01:111:f403:2415::61d] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh3pV-00000001D3S-36cl
	for linux-i3c@lists.infradead.org;
	Wed, 30 Jul 2025 10:14:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gPdNfq3P2phaZdqaq6rlQzuIcY5ALjtLDwjkIyfip7TMFN5u5H0m/RheCT/TAuTvzM+W0Z/XPrp3ZLNjTnaKm1oQY0j+AHIKA2rjtVKfmpcPH5owlLNwBGJfrr4IUe8NuVilpAQoK8PnJcal3ou0eep/MTu7GG1Bo6A9slN0rvVApNv80N3tSXEjChPtyRB2HbRsdeccvFMVW6na8lpD8fcYBfLgw+fTwJdELy3Fa+i3+tNPxMqIXy7FDwmI8w/IhQ2D7SUJDqH905hRUi8SltUbMDu9IsQ5FKEFAA6AcQJo/Q5XPSiyPpeGAu9rJe/XG8HbTjpBcULX0yq/GYB5Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZzbSm6QMAkZENOF9+tQqZzP3Lk9Le/Fz/g/90E1X/VI=;
 b=ca3n/V0IVWnuqfeuG3rsJzMNh/G6LqeACYxP4SSDLuJ5a08TnZL6iCJTSf6igNzBsAVhnM2Q8Sk6F+XSGoaaw3qAtG0hg3d7jBvdNXp+o6b2maYfd5a560MLrbxR/UKAueGDaXp3hnSS6z4WI3SIM9lcUlcvqdTaJly8vu+ar2GTxFWcM4+eVj75F5abYYX2oXrnQ+wIyiHmbJ2Mydt4dn8G3nr2LqiJ3QeXpP+V/tDs2iPHlq9AbtnuNOQejZlhx7Tj3UG6XDJbU1FZXi7mSPDyOphJ2R7nHONOnU8qB1VbyttE0pyNdFTHNziwDjZwQlxGka7bzjVFtDKSRHrd1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzbSm6QMAkZENOF9+tQqZzP3Lk9Le/Fz/g/90E1X/VI=;
 b=yW5lvPCB/qbUToC6yWmt3aF//WRKRJbwPtf6Vb7KhWzdK/ElxtlHdSfojyBYB5hayHWH5ajfdt4G0O7YBcke00JSRwDfqj1TfUIof+CgkG2oy4BkXo8OG4YyWVNhx6mmZH1n0gGSMTtZXee7YA47KvJWfDork6HMNWND5cDnMBi2rKUrIHb65qTjP/on6Aq27QkLGqe9edOfNPxjH7/I2M4msrQMmMH8iSwGukeSNYNmxPEt9wYWOtJnm97VqGySDavYGISm6oM8hGawQfsxwm5wIXAUL/Acxaj9JcBcrNDDHRjmYPwYZmwMo1LorZ8SR/mB2sz6nJoxHpPdXohEgA==
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 SN7PR11MB8068.namprd11.prod.outlook.com (2603:10b6:806:2e9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Wed, 30 Jul
 2025 10:14:28 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%4]) with mapi id 15.20.8964.025; Wed, 30 Jul 2025
 10:14:28 +0000
From: <Durai.ManickamKR@microchip.com>
To: <linux-i3c@lists.infradead.org>, <alexandre.belloni@bootlin.com>
CC: <Hari.PrasathGE@microchip.com>
Subject: [RFC] SAMA7D65 SoC I3C controller driver
Thread-Topic: [RFC] SAMA7D65 SoC I3C controller driver
Thread-Index: AQHcATq7gUN6Wqq0A0uotolGq6LdBg==
Date: Wed, 30 Jul 2025 10:14:28 +0000
Message-ID: <fbf4c64a-e2f7-49e8-8991-3fa994e3ec03@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB6541:EE_|SN7PR11MB8068:EE_
x-ms-office365-filtering-correlation-id: 5a14653b-29ef-4292-5b89-08ddcf51de5b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WUFvN1lpZGs2b20wT3hiOGtoMzlCai9obWQvRTJ3RWNrOFRTRnhFcXRRNGYr?=
 =?utf-8?B?UWs0T2I4QnJ3c0F6WmlVN2l5eVRUdmxjWDVxc1B0aVNKc2x3VFF4VUhSYnYr?=
 =?utf-8?B?bzdvY1o3WkZFOGV4NjFlUGUwTzkxbVRsWU5ETTJMVE1iZEQzRXE3M3FlMzRR?=
 =?utf-8?B?dWtDaStQM2NGYlRsdDBMMHdUQkpZTkhqdmFDblR3eTc0eHhnK1ZHQnhnUytI?=
 =?utf-8?B?cXlsRTU2U3NsUzZoV1lEZ3FYL1NuWnZya0VHZkZpTFoxcjNGampZbjN4YUR5?=
 =?utf-8?B?R0pEV3VFN2ZvWkJROXd2dkowdDhsdzNlY0E4UW9Gb2NiaktZOGI5VmpIQ3lD?=
 =?utf-8?B?QTAyYWZaZXA2RUJVZzVZVVZNdzgxQmxJb1VVZlR2dVNKLzM1SkpQQ1ZiVXVJ?=
 =?utf-8?B?bC9EL0Z0SHpQVXpxVDQ2TThXdjQwNG1RUVJtY0RiNVUzSUlVUDBUTUpqQzMv?=
 =?utf-8?B?dVZJbnEySEc1ZEtCZ0N0b0pPU2VuZjl0a3MrVEFsQ2REZ245Mks2eDVFcWhz?=
 =?utf-8?B?Z0RVU0JEbXY3bWF5Ky9rUmFiUHAzOTV0K0pBbHd4eFhyOFRhMm5RajRHTTVB?=
 =?utf-8?B?QWlZZW5qN2xqbTArV2lYOXhhYUhsQVNnbGJzK3pXTDE5d0lya1UzTVNIcmVy?=
 =?utf-8?B?Z1dOamNBTitoS2xIeWMxVVREbmpxL0kxZEZMNEplZmhpMzJKdEtVWUVyS3Bo?=
 =?utf-8?B?cHNpNnBhazVlbmhldnpVZmxncHplMldCd3ZwWnJMRGFTSEs3dnFJUitXUkZS?=
 =?utf-8?B?aDlwc2ZZR2M1S3hEUW5kV1ZscVRydjlHejRkUnFQeC9LN3lpcWUzVldXSXRk?=
 =?utf-8?B?cHc4cC9leXgwbWFpMkUzTVRxTVBmS1hOb0FVcXZ0ajFnSWlOa2ZWZzYrdDll?=
 =?utf-8?B?QklaSUFyNUN4eExKcUpqR3VuRGlHL3RiV3U3WXZKVDF2QTUvcEJBS0gxQVc3?=
 =?utf-8?B?WERPQ29BcWhid0swczVwRlFoekF6MWE5OVNyYm90OTNmWG9xVXpEcjlrV0JV?=
 =?utf-8?B?VVZ5Q1EzbG1DTXJjR25LOXplbk5MZzcwOVZEMUplYkdJTmxadSs0UVZid21o?=
 =?utf-8?B?NWVSVytQZjFKR2hmZWVGSzNVNTRaQTh3ZWVPazlUd3BqSXc0MEtoaFVpRzVG?=
 =?utf-8?B?T1RqL0FIYVR6N1NTRFhkd3gvRVo4VnlvQWJaa0Mwa1MyMDMzUkw4VTZDZ0p4?=
 =?utf-8?B?TkMraHZxZGRNWkVCajdacjVHRkVJdzBSeGEvNGdYTUMzSHZBekpUZzQ4eHI0?=
 =?utf-8?B?MmQ5WWhoRjhKRWhuNk5jakxkY3BXNWV3Slp3UndYc1VWdHZTK1J6R2s4aVRl?=
 =?utf-8?B?N2JOQzgvM2U1U0NjNlpUamRKTWZ4UFVSRlNiYU01enRDT01JYjVjQ3BEcm4z?=
 =?utf-8?B?RWUvNWdqQWh0MngxZzVneGFseDJhM0xmbHRJOU5ITEREcVVTa3JVUnpud2VF?=
 =?utf-8?B?TW5wUGZaZ21BZEl4dUJKclVNbTVHaVBTQnAxMHVpZC81VE1EK21CazdGUXRP?=
 =?utf-8?B?aE15cXN4d0JjcFhyUmJqRGp2NHMvUlBJeGk2MkRocU14cXdMYVlsRTZNQjFt?=
 =?utf-8?B?UEp0OGFlRE84UjU3S2FuU0RCS1M1bDhpbGlVRmxra2RHVEplYXk0dVJjMWZV?=
 =?utf-8?B?NjFWc1VXYldpaC9qckU0RFBERGMrQlJEQ1EwYm91dXQyS3JDSmJ5M3Q3Wm1V?=
 =?utf-8?B?MG5yZ0pFRkFKU0YrUlR5NW56WUVucGtBcExjdVhmL1F5OWJ2Y1Q3aDROb1hv?=
 =?utf-8?B?NHhFTFgzb01rVU9FTEVnZEdrQ3dHdGhiTzJXckdra0dDSGtncEplc1pJSXVB?=
 =?utf-8?B?V3d6Q0orSEpXUnpkdHFYVS85MGd3Z09ZYnp0NTRGYjR4TUJ1UE9NSHVXd3NI?=
 =?utf-8?B?WUZ0TUs2dEwxTlhrSkg1Z04xNHQwMnBIVG1ab3lER3NCc2tPUndiQ1VNTDNl?=
 =?utf-8?B?QTRXeWNZemRJNG5xNEQySkJremo2SHVqWmZPL3VhcEJlcis0Sis3WEJDVDN0?=
 =?utf-8?B?TGg2ejR5TXRRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6541.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SldtK3NHbTZTZjZxaFpxS1pBd2tzTUJFM2VONnF5OSs1cDEvajRSZWlPVXFm?=
 =?utf-8?B?YjRFOHFaZE9vaElZQ0Q2SU9sbzR5Sy9DOGFPcjd6Q3ovVVJzdmdjNmtybHMx?=
 =?utf-8?B?bEdHdDRuVkp5K1E3U25RUThEY3htdU1KMVZlSHZCV3NqN2szRVBGcmljL3Ey?=
 =?utf-8?B?QmU0RjF3T3NlRW9IdXZqWHVUQmdmYVNKUU5WaFdOejJ4NEdFdllQNFE2TUlK?=
 =?utf-8?B?YmVPL3phQmJZUzMwN2xuU1dpQUdGSm9UeFVCWmQvVzdiTlhhVDZCc1JJTzhV?=
 =?utf-8?B?Mzg0ak9RTkY4SkZMeFYxMmszc0RLNmRORGlmRVBYeW9WUmFVbGkzaUNiSFlF?=
 =?utf-8?B?aVc4eXRLWjQyMVFIMHRQaEpoTFpEdFBlazZzNFNydkJURmtlNXdRZFhQNFZT?=
 =?utf-8?B?RUZOVXdLeEVZczdsREdVWHFsQ0orU242ZVlYTDR1L3ppbGdXVi9PRHlyeW5o?=
 =?utf-8?B?Tk1qdHFFTDJYbXZhSmJmRHY5cXM2ZEJyaG42V2hpM1BvQnE0NjVzQWVOVXdL?=
 =?utf-8?B?NDZ3ZFhwYmNDQWVyK3ZUWUw0QThONG91VGdRUGFNdGcvdzQvRUVUbm1ucUFn?=
 =?utf-8?B?Q0hsb2JPcndRNXFBMTNjYytnY0plM2tzUXJnM0E2bHNRRmI5UmRTS3UrUTBu?=
 =?utf-8?B?K2QvUmYwMmVpOGlFS1pJOWQ3c2hDcFI1ZDlCcWhWMUM3WGprNzNaM3h6c0sr?=
 =?utf-8?B?b0lBTVZLN2svRFBvNWwzVzJWM2ZOM2RvS1NERjE3bUFUS1VRTm92TTBMeVV1?=
 =?utf-8?B?VDVhblZ2TTAwY2hYcGd6c0ZEdXk5bzZFM0t4MThGQTJIRytLdjZBSlhXSGxG?=
 =?utf-8?B?T1lXV2tNOXBMaEtVbDVQNU5vNWZrdkttVDcxWFdUZm14K1Noei9KRlVRY04z?=
 =?utf-8?B?cUR4MlZWa2E5REtTVnZNd1hxdjR4bHRKWHU5ekxDbU5QN1l0dE0vSWVRRS9D?=
 =?utf-8?B?NEh4MmlUNDUxc1dBdXlGT2ZhcWpncE1ra0JKeUdYaXppT1g3bzRmUjArWjJh?=
 =?utf-8?B?NTg5YVZrV3BETzAxNGpsZnUxWW5IM3VacWxYaWsyT0cyNlVySDcyZVFXSTN1?=
 =?utf-8?B?K3IrWGJQK2tyd0Z1OWNSanpUWlB5eDZLcUN1d1dyZlR5aFVlNHZldXpxYnRP?=
 =?utf-8?B?TU0rZCtGeWd5SUZEOXdPZUxtYTNDVG5ra0JuWTBBSyt1K1BDSGMzbDlRazRU?=
 =?utf-8?B?bG5LUFhNTEJJVXFoU3l3Y1lYb2prWTdhakZvU3V2Umh0N0dlSnE1c3l0Tlh5?=
 =?utf-8?B?OGJpK2ZvcFBkRW5OejlhUTVnSWQ5OE1nVFc4VWh2R0NsS0hxcjQxSExJZENQ?=
 =?utf-8?B?eWY0QlBidWtHT3FuQjZacnNQMjkwS0gxSkx5WmkvWUhkSGZTSUVpQ0dleGoz?=
 =?utf-8?B?MXU2aXFTRjRJUGxKZTFjc3g2bWphdXJHMTNwNDlxNzNHL2FISHJWUm1hekw2?=
 =?utf-8?B?YnZLTUhkaVVha0ZIdEh4NHdWWnFkelVISGxGb0pHbTh3dEhlQzlkb2ZaTzJL?=
 =?utf-8?B?YjBmcmNhUDlWWlJxM1RuclZVTGFZNEZuY2VoaWp0S3ZSYzZlNUMrTnJYVHJR?=
 =?utf-8?B?VFBhcHV4ZTNjdUU2T2t4V1ZzMmkybGFCVjFjeUNYTlB4VTJoMnJNdkxpdmo0?=
 =?utf-8?B?WWpvSkFpNmltV0xTanYvclZua1VGZzZrSnk0UkpkdUNqSjJiRDNiTmQ1T1RO?=
 =?utf-8?B?eE1pcExEY1VKb0dUa0s4WWg0S3dtN3diZXZOMHRKMnRwdG5EeUVIMGduZDVW?=
 =?utf-8?B?dURKQVlxcTdsY1R4ZGFmYVBvWm1JeFU5VjlhRHp1ZkZmcFVpdXk1UmlXVUd0?=
 =?utf-8?B?QnBjMjlLbjhLdGFYekxJR0dxc1ZCbE90cldEcXdpOVArMldtbFRndmJGMW13?=
 =?utf-8?B?K3pWZG5ackV5bTRLQzJpZFdZbkorTjBPK0dGZVJFUjlKYWJSSk5SdjZlVzZk?=
 =?utf-8?B?ampxZkxOdGFsMXd1YkJoUlYzTTdUZnJYNmlLS28yMFptYWUxODI3bDBXd05w?=
 =?utf-8?B?aCs0eVpHdG9nb21LZzAyMnpUMmpuLzFDWlZMTzMwNDl0NVZVUjVZY3puZWNt?=
 =?utf-8?B?RjZRR011WmRlQys1Y0RaVUNWanFYcmtBRGhEemt4VmJQTXRYNnh3ZmJ3TnRE?=
 =?utf-8?B?dE83RzBCeW4rVjQrY2tXcHdjNVlMV1RGeGZqQ2NJT3VBQTZYR3hHaW5USHBF?=
 =?utf-8?B?aVE9PQ==?=
Content-ID: <B0D630A6FD26A949B46AFF65FCC9C915@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a14653b-29ef-4292-5b89-08ddcf51de5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2025 10:14:28.6242
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c042SOVCL6tCeYdt4RmmSiL/LdsTHhDdFi4t1lkScoJzPg1t8YGoqLOkc5ocGU776KFAJXVf9+4OrrQWkfIrEoHeAk0DCDX52KYZR3Gs7fQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_031437_781770_7C74DB4A 
X-CRM114-Status: GOOD (  15.00  )
X-Mailman-Approved-At: Wed, 30 Jul 2025 16:27:51 -0700
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

SGkgQWxsLA0KDQpXZSBoYXZlIGFuIEkzQyBjb250cm9sbGVyIGluIFNBTUE3RDY1IFNvQyBiYXNl
ZCBvbiBBUk0tQ29ydGV4IEE3LiBJIGFtIA0KdHJ5aW5nIHRvIGFkZCBkcml2ZXIgc3VwcG9ydCBm
b3IgSTNDIGNvbnRyb2xsZXIgd2hpY2ggaXMgYmFzZWQgb24gDQptaXBpLWhjaSBzcGVjIDEuMCB2
ZXJzaW9uIG9mIHN5bm9wc3lzIElQLsKgIFN1cHBvcnRlZCBkcml2ZXIgZm9yIHRoaXMgSVAgDQpp
cyBkcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2NvcmUuYy4gV2UgYXJlIHVzaW5nIExT
TTZEU08gSU1VIA0Kc2Vuc29yIGFzIEkzQyBzbGF2ZSBkZXZpY2UgZm9yIHZlcmlmeWluZyB0aGUg
Y29tbW9uIGNvbW1hbmQgY29kZXMgKENDQykgDQphbmQgSTNDIG1lc3NhZ2VzLiBFbmFibGVkIHRo
ZSBmb2xsb3dpbmcgY29uZmlncyBpbiB0aGUga2VybmVsIGFuZCBhZGRlZCANCnRoZSBJM0MgY29u
dHJvbGxlciAmIEkzQyBzbGF2ZSBub2RlIGluIHRoZSBkZXZpY2UgdHJlZS4gV2l0aCB0aGlzIGtl
cm5lbCANCmltYWdlLCB3ZSBhcmUgYWJsZSBzdWNjZXNzZnVsbHkgcHJvYmUgdGhlIG1pcGktaTNj
LWhjaSBkcml2ZXIuIFRoZSBob3N0IA0KJiBzbGF2ZSBjb250cm9sbGVyIGRldmljZXMgYXJlIGNy
ZWF0ZWQgYXMgMC0yMDgwMDZjMTAwYi8gJiANCmU5MDAwMDAwLmkzYy8uIFNvIEkgaG9wZSBSU1RE
QUEsIERJU0VDLCBEQUEgYW5kIGNvbmZpZ3VyaW5nIHRoZSBJM0MgDQpzbGF2ZSBkZXZpY2UgYnkg
dGhlIEkzQyBob3N0IGNvbnRyb2xsZXIgaXMgZmluZS4NCg0KS2VybmVsIGNvbmZpZzoNCkNPTkZJ
R19JM0M9eQ0KQ09ORklHX01JUElfSTNDX0hDST15DQoNCkRldmljZSB0cmVlOg0KY29tcGF0aWJs
ZSA9ICJtaXBpLWkzYy1oY2kiOw0KDQpUaG91Z2ggd2UgdXNlZCBzeW5vcHN5cyBJUCzCoCB3ZSBk
b24ndCBoYXZlIHN1cHBvcnQgZm9yIERNQSBhbmQgZmV3IG90aGVyIA0KcmVnaXN0ZXIgY29uZmln
dXJhdGlvbnMgbGlrZSBsZXRzIHNheSBzZXR0aW5nIGVuZGlhbmVzcywgc2V0dGluZyBjb21tYW5k
IA0KdmVyc2lvbiBhbmQgc28gb24uIFNvLCBJIGhhdmUgdG8gcmVtb3ZlIGFuZCBtb2RpZnkgdGhl
c2UgaW4gdGhlIGV4aXN0aW5nIA0KZHJpdmVyIHRvIG1ha2UgaXQgd29yayBmb3Igb3VyIFNvQy4g
U28sIHdoYXQgaSBkaWQgd2FzLCBpIGhhdmUgY3JlYXRlZCBhIA0KY29weSBvZiBjb3JlLmMgZmls
ZSBhbmQgaW5jbHVkZWQgYWxsIHRoZSByZWxhdGVkIGRlcGVuZGVudCBmdW5jdGlvbnMgDQp1c2Vk
IGluIG90aGVyIGZpbGVzIChwaW8uYywgY21kX3YxLmMsIGRhdF92MS5jIGV0YykgaW4gdGhlIHNh
bWUgZmlsZS4gDQpDcmVhdGVkIGFzIGEgc2VwYXJhdGUgcGxhdGZvcm0gZHJpdmVyIHRvIHN1cHBv
cnQgdGhlIGkzYyBjb250cm9sbGVywqAgaW4gDQp0aGUgcGF0aCBkcml2ZXJzL2kzYy9tYXN0ZXIv
bWNocC1pM2MtbWFzdGVyLmMuDQoNClNvIG15IHF1ZXJ5IGhlcmUgYXJlLA0KDQogMS4NCiAgICBX
aGV0aGVyIHRoaXMgYXBwcm9hY2ggaXMgY29ycmVjdCBvciBub3QuDQogMi4NCiAgICBJbnN0ZWFk
IG9mIGNyZWF0aW5nIGEgbmV3IGRyaXZlciBmaWxlLCBzaGFsbCB3ZSBpbnRyb2R1Y2UgYSBxdWly
Y2sNCiAgICBmb3IgTWljcm9jaGlwIEkzQyBhbmQgaW50ZWdyYXRlIHRoZSBjaGFuZ2VzIGluIHRo
ZSBleGlzdGluZyBkcml2ZXIuDQoNClBsZWFzZSBzdWdnZXN0IHVzIHRoZSBiZXN0IHdheSB0byBw
cm92aWRlIHN1cHBvcnQgZm9yIHRoZSBTQU1BN0Q2NSBJM0MgDQppbiBrZXJuZWwuDQoNCg0KLS0g
CmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
