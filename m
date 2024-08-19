Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E03AC3DA4A
	for <linux-i3c@archiver.kernel.org>; Mon, 19 Aug 2024 16:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0IvtTBk8X5KxBevsv2lfntVAwH+FgJzdJ0bBUJRoTOQ=; b=2NGuUPNy5MQflO
	THejZCAZL1O/e5wBs8C6eVMDpfc4N/P1KmlMsAkKMt6LqM1DraBb4rjn0xPaLYWuBeu+ELAmsbNJL
	xhKKV7GSe3wr+iy0X4ZTTbbKA61iuc6FnLOE8Ws3iLkSxkwKHuH+mUhX49XTVwlcvX7vx2Ym47yGk
	uGHK247wAetAzjrmgrEhW82LBQfT8h6JXMp2eNBMr6QtGZkhUwnJVD0jN9rk6vMzhJyGyySZC3u8w
	g8qMwtAOd7efDsyTFQyCX9oKa86i0of71Dr1T30kqMRyUip7uhdRwlxTtdZPhKZd0v7UBPMAgDnSX
	BBkOlIo4qhh0jGXSkF5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg4q3-000000024L5-3IWf;
	Mon, 19 Aug 2024 16:02:35 +0000
Received: from mail-westeuropeazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c201::] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg4pn-000000024DK-1WPt
	for linux-i3c@lists.infradead.org;
	Mon, 19 Aug 2024 16:02:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BDLR5A8pM1OyqLl74uwBfDf6AizBWmIsux53Uge1ITZgmmbtJ7okl5zB2pxvdyiskurC2yMgOid5JQrNf2cKsyeFFMZlFqyv0BtSWnXo7kASyz3UGlRnMkjCUcUSsQdK4r4Xk9ulKNR6uKmn7U5wjnMrNIHhwI5wzAVyNbpkiw7O6Bnq9hWWn4/65xixWtX24Sz/UDQdOaasRgKRRXhA48cwn0xtMoYk5Ocx11eeFtoHc/wNRvf1QErObthjEqzgTG3TQiO8qa7lYmcK++7ZWnYfKbGKYyjmRU7yE52p7MOPZloZyHR/xiX1euVQfpGqX3NKBWRCzf2vIuVf4YVZNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hrqbG2iJc56Xiifh+Q8obodv4WTy3HOVpy3ynGZaGHA=;
 b=Zwh5TdY160JVdOHVvpPlEbZPNZtsCoo0M7CKBlRS/Q299uIBn2n1dBWa+DS7GyxIBvl+ux05iWw5fOgL5V8behUA8ggeu1Sc2S5PB850DJrCGuLumR8zS8zN4iw/1oC/unTuEcY+z9SU+vqY1Ele8J8kGdBfyNX7+I8kaT4Q3aeifQCVEg48WmlAC7dZA6B3JZcFSMUArzgf2rSGTlHwXPrJSpBoBdQUHF89rP7ROOWbKpKm+gtfXrHKB25gll318+zrWhxRertYNv4u+n5UKV8fpZkkB/UY1SvzbX6V6KK4hkHruEJZ0gk9JD3vsiHpQ9MNih/V78n+Aea5cCrD9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hrqbG2iJc56Xiifh+Q8obodv4WTy3HOVpy3ynGZaGHA=;
 b=cmcNLOdnIhWqVyPTSG38HUytFT6cEy49FB3SoHqvcALiSO7CQU2ABxsnMZOotlpEDRctoaUBtwzQa5GwM1RdK4VZ7pWFwSJDj782ngnrFmf+p8ClK8FlVrb3KMWJwzXd5P++zEQ3MeZPxspqu2WgoTpRTNVY4NeZHAPUexK1FFE/nSeeaTyxftfDTFFamlSLwO6FV82p62020FhiZ/WvJNRUtCaW0gz1zf88WOj8jMjvS8UDgJQdMscmriowVBCXltwAvbLOxsYLu6aG5qYU2xGGEwwDAqabFwRje4YtPJNXxtGRIH5T9k2rUUDHrEEdAny0lBow+F0V7d1+o7l2jw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU0PR04MB9659.eurprd04.prod.outlook.com (2603:10a6:10:320::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 16:02:08 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 16:02:08 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3 00/11] i3c: master: some fix and improvemnt for hotjoin
Date: Mon, 19 Aug 2024 12:01:54 -0400
Message-Id: <20240819-i3c_fix-v3-0-7d69f7b0a05e@nxp.com>
X-B4-Tracking: v=1; b=H4sIAHJsw2YC/2WMyw6CMBBFf4XM2pppy6O68j+MMQWmMgspaU2DI
 fy7hQ0Ll+fmnrNApMAU4VosEChxZD9m0KcCusGOLxLcZwaFqsRGlYJ193Q8C93I1hlnL4QI+T0
 FyvNeuj8yDxw/Pnz3cJLb+t9IUqBona0QW1S6r2/jPJ07/4atkNRhGakPS2WrNo5KixVKYw5rX
 dcf+yG6LNIAAAA=
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Parshuram Thombare <pthombar@cadence.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Boris Brezillon <bbrezillon@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Conor Culhane <conor.culhane@silvaco.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>, stable@kernel.org
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724083326; l=2911;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=VX43ykqcJNGirYjMBmD5nMNy5hv+rqSl7B9PiHEQOE8=;
 b=2xcBcngQe7gxCsirWAPxIrJbetrMXqYYH3Q+Vw0CAeUfuOBzTkdlQCNW3tvXuQkBdLuJremwE
 xphAnnuuhpRDDtiMNLZ/qmeStinyOnDggn8/WL6ig4LuL45yjmgjAPv
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA9PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:806:20::10) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU0PR04MB9659:EE_
X-MS-Office365-Filtering-Correlation-Id: 765df2cf-f862-4f6b-eda3-08dcc0684741
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QmFWL3JUTEhnUGE3akduSXp1c2ZoWVRUQ01hT0xvdHdldlZ1aDl4TEdzVEdC?=
 =?utf-8?B?Vlh1Y1JIYkJJV3dDVTRpcmlwTzFWYmZKM1FyOENKOWNsSlk2eHA1c0N2SWh1?=
 =?utf-8?B?RnNoNUNHVUk3QmdpMy9COTJlckRCaTBzek42aDVVcDRNRzdjdDB1SnQwYmpx?=
 =?utf-8?B?bXBmWDNac2x0a0dXUTFYS2xtbWFlOGNSWkZIRlpwZWFWcXU0ZUNsVDZqbkhT?=
 =?utf-8?B?d3I3cEtaejIzZ2cwQndDWlhmck52dGpWSVZ5bjFDRUt6U2Y5dEsxcjFJUExY?=
 =?utf-8?B?SlRWVE56Z2luSUJjLzhObTNIU01QYlEwZDFVRFRWK1FBbVpkR2Vjc3htMitz?=
 =?utf-8?B?MjBlOW45eUhVUmw5QXFXZytMdnRtSmlyc0hCY1NKUEUrZHZtZDlhY3doejFF?=
 =?utf-8?B?SFRPSHpaVUIrK2VJblFTMnhlMzZKSVRJdDlaaUlQVkRid0VHWUw4N2xFcmt0?=
 =?utf-8?B?NVE4R3F0SlkxT2I4bTY4Q2FvWFpuY2g0RmJZMnV5bE1KZjdEc3lUNWxmR0N3?=
 =?utf-8?B?S05TRjRYZERaMUp0dENCdjE3M1Y3cHVGNzN0MEtIYzlVWmJoa3BBSVlubnpX?=
 =?utf-8?B?cEJxanBoaytlSVZCVS9FdHIrVGVXM3pmRnZiOThxMXpicjh1c1YzWHlIOG1N?=
 =?utf-8?B?VFhqZnBkcldXMjZtS2dVZ0NERXNQbC9FSXE2ZTduNG9GVVA5NVNIK3l2SEx4?=
 =?utf-8?B?L1NaL3g2aEZrTUNxTU9GUjM0WDdJODdNUGo5MTI0cnhvQ1lvL3V6UTFlMWlJ?=
 =?utf-8?B?QUwvZENuRXNITisreTdHdHp2S0xIRm4xYWpLVXJ4aTVrKzJxOTk5ek9CWGRm?=
 =?utf-8?B?UXRTdC90VXNSOThMK3ZkYzF6aW41dFMzQUVFcFQ1R2lrbWhDYnk0TVl3SVMv?=
 =?utf-8?B?TU1zYVZ1QUcrK055bTVET0o4aldPK3lQWjRvY2hyOUd5SStubnFwNjQ2eWZr?=
 =?utf-8?B?MXY0VWNtVlNiV1JYZjJJMENkckJWU0hCSEFlWEtMdHErUm1raCtGSUVUT0ZB?=
 =?utf-8?B?dmZDaStPODVLNDkzdmFQb0ZjS0kram8wTjNITVFmUndiR1lpZSttOHpuZEIr?=
 =?utf-8?B?Qm9xbjN0Z0hIMmY2T2N1ZlpiKytuNW5iRVdMalhxMGgxUEZWVmE3SWNwME9G?=
 =?utf-8?B?ZUY0bml5aUxwVTVyVFI3ekdZYlFZZUlxQVcyQllHcUg5RXFNTkt6VUk3QVRz?=
 =?utf-8?B?dFJmTUpGbWlxazdqQjNHUkxSR3gxM2FIS1JwOTFJcTdYZStBYWVwS29oMkZy?=
 =?utf-8?B?dEhMNGJETmxjcDlpd0dKaFJNUDdEWm0zczNnOU9Jd0pwSytEMUVqaHBST1Ji?=
 =?utf-8?B?cFNLeWVRb1Z5R0lndFRGTGFZWkMvSURlQ0tTT1cwL3hZM1NpQU0vaTh5SGx4?=
 =?utf-8?B?VFVJb1VGYWJ1WnlPaThYbzYwbFhiNXY2MjRDVEFMRUlHNThSa2NsamdEQXJ6?=
 =?utf-8?B?bGJrQWVsdXdyN2VjcUQ0U2RDZnNkWU5ZTkJaRS9wVENMY0J2RVVzOW5OdXM3?=
 =?utf-8?B?MTR5ZTZhTktMMGlVMm93NU1tbFNETDg1N0tPamk2Vlo4VkZqK1dwNlNVbHRJ?=
 =?utf-8?B?THpNRGRDSEtPaHFNM3R3UUhmQWpYZ3VQNWtZNkZNWElXMGJKYmhHTmJ0V09w?=
 =?utf-8?B?KzB5R2NMZUdDUzNjcjhUTFYyL0F2RnpqR0hLekpYWVdCUkpMazF0SEhYQ29L?=
 =?utf-8?B?WG1CaWZ2NlJ4WTM1TmRQeDl6ejdON3FvZXZaS0Y4dFJqTG9GZ0g2SHBQYzh6?=
 =?utf-8?B?T3d4T29GRk1PLzJUOVdLdnhudVFKMkF0Y2RpM2hqRDJ3emJDZFBsVWtNRWxF?=
 =?utf-8?B?bTM2N1JFb1oxN3R4RXhmZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkNtWkF2ZkNOSjh0c21IU0d0NFlvak4wN0lvSXZLYlc5bnd4V1l3RmVlaWVT?=
 =?utf-8?B?WmFjVjI3MEh1VXpuaUJjTVYrSFVtYVhnSEJEV2lleGU5Ni9oRWZDN2RTRDFN?=
 =?utf-8?B?ZmNaZVRJTmdJY3FlcGNGcksweGlZWlNydVRTdm5PZUpRZGNtOHYwalVBaUhz?=
 =?utf-8?B?UUdTaUxQSW1yM1JnekVqVEFxSGw2eUFEWitqSnduU1pCNXluVkNRblRMZVFP?=
 =?utf-8?B?YzNLczN3eEpJK1JrTFdoZk90VnFla01uUnFrWGZGODJWbjhPWFdIKzdqcVNr?=
 =?utf-8?B?ODNDRUJ0aXZNTDYvT2FDdWVWVHo0SFZNeW4xNG9sa0dwQnpxbFZ6SVRva1lD?=
 =?utf-8?B?Ykt5M3lwQzNzdWJya3VuSjRNWVA0RUwxSnJvZ1NDRDZoUXdsZWFRenlNK0Nl?=
 =?utf-8?B?WTh2RUs1MHplaStoOWF0cE85M1BMdXVvRFVKNitrTHhuUlhsT05RUEIvTUlm?=
 =?utf-8?B?dmN2ak1neG5kTWhQSFJQc0twTEtDQ3FvSDdGbE1za3ZpN2ZCaHdwVjdWVXBl?=
 =?utf-8?B?WFI2VXU0ZzJiWVh1eE1oYmZXck9wbUM4SndjWjgzaEJGSkxZL3JNOFlJVHJB?=
 =?utf-8?B?RDI2TFdHOCtoamtGMmFWaXNKUmlMN0VHbUJtbnh6ZXEvRkRua1QvMmVRbGYx?=
 =?utf-8?B?UUlyMytXOWkyUUVFdXMvZThZTG4zbTRZNmw1THlJeWZmS0hzNVU4RzZueWRQ?=
 =?utf-8?B?OVd5MTlieG1uMTR0RmJHN2ZJaGQwYStFdzJaWUxwMnpUYmY3TjZNbktNM0V2?=
 =?utf-8?B?eWRzN1cxV2ZDVlVOd0tnSWRjR0MyUHlVTlg4b00rMW94c2gyNmFtZGZCN3hp?=
 =?utf-8?B?NjJRUHlSRWJlazEzU051M0RxMFhFNWR5MVBmZDZpYTI3S0VseWR5RHlOL2g1?=
 =?utf-8?B?NVZZZjg5UnZUTE8yK2FrWitoZkFVT2t1T1VBQUpLUHQyRWJ0NmE3bWZ1Ykc0?=
 =?utf-8?B?ODY1STJOZWw5RlJMMHhreHhtbHBHT1E2d3BJVG04WEdTdHp2NlRmWkRNS1Fr?=
 =?utf-8?B?ekpxN2hXcjMzMFRySTFnTER1N1FYcDNrWkYxeUdqd3BCc21vTXowZEV5UWxH?=
 =?utf-8?B?cU4yUmhSdUdZWkZSY3lHL0RCNDRrSFNnRDIvWUhpWnMzTW5LWGllUmpEYkpz?=
 =?utf-8?B?SVg1cnhFMG5tdGRNMWZOejI5VkRIaTV4SHlDN2pqZVorbnlicGk0QjlTMkxw?=
 =?utf-8?B?NGtXWGY3aisySUFPL0xXTDJ0eUZ3ZHB1di9rcU40UEI2djN2Z2lIRWxCYlFm?=
 =?utf-8?B?Z1lQc0FML1VNWjJ0RDZMUW4weUxaSWVrb1VrcE5EWHlHbFowSzZuOSthUE4z?=
 =?utf-8?B?NS9rK2RaRHdMMzVUUEhuMU9UdHR2OEIwNmFXTjZ1SE8vMDR4Zm12NWRqRnNY?=
 =?utf-8?B?bk12SE1CTnZXQ0NKa3I0TmZNbkxNTWt0RmZUWEV3Q2EyRHFCL2pqTEgreGZU?=
 =?utf-8?B?RDVmV1JxT01iQjl2TFRIWHhKVTQrYkNuSE5zeWpDRDM5bEFHTXE0dUhDVCtz?=
 =?utf-8?B?QW5qV2J5QWd1N1NmVmlueXRrZW5sOFZTcVRiVlhiVCs1YUgvNUhrVXJFSEh4?=
 =?utf-8?B?dFJLNVJZZFl6Sy9oM2tXZ1NOQkZ0Tk9KMXpQaXcrYnEwdlVmUkJyc0c4eFFJ?=
 =?utf-8?B?Q0h5cGZHSWR1Rm5HbDlGSGZpQ0ZLK1l2QUx1UjRHaG1IUkhMUkhsSEVCbDdJ?=
 =?utf-8?B?Y0NGSUVWQXdyYUtiSFhibm5SL0N0d0F4UG5ud0ZHL0cyUkEvSWtBSGh5U1Bz?=
 =?utf-8?B?NlFLOWF1Q0JRdExxRDJXUk1hT2pHQnhKcjJkUVBiK08yOUFTaWRWRFhZVlJw?=
 =?utf-8?B?WC9tQUhmeUZmOURwNWVsWTZ6eHZOeXYyNHgreE9rc3c1WnRjdU56alZvVXlt?=
 =?utf-8?B?N3M2TVpZVUREWTFtUGluK3luZzYzYjBGUHliVitJWWhaR3NySlBJeU1lYXZi?=
 =?utf-8?B?NFVIcHpDNjYyVXdGWGtUL2NlcEtVdWZKZlY4TVh0dE92czNKTWU4UUpDeVhk?=
 =?utf-8?B?LzRYb1RmQWYxaUx1blYrT2tYKzRRSHd0R21YYUR0S3pHRWFrWkhtVDA2WmJ1?=
 =?utf-8?B?MGtkS09PaG5NQTBZZ2Vnaklxd2ZZVEp2bEFKalM0am0vTG5kUDNtNEpyYTlX?=
 =?utf-8?Q?lzYc6pbtAgNk+5p1EQLwNR7Me?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 765df2cf-f862-4f6b-eda3-08dcc0684741
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 16:02:08.5482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZRYNTwXCu3cBo3EyRC1HCQXdTtARxbLFqXqyXr7NHfQKEpuXaj+ATfBtaOpF4iR5FhUMIajUMgaRFD/jA+Kiag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9659
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_090219_608352_7FCD2FEC 
X-CRM114-Status: UNSURE (   8.26  )
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

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v3:
- Fix build warning
kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/i3c-master-Remove-i3c_dev_disable_ibi_locked-olddev-on-device-hotjoin/20240814-234209
base:   41c196e567fb1ea97f68a2ffb7faab451cd90854
patch link:    https://lore.kernel.org/r/20240813-i3c_fix-v2-10-68fe4a050188%40nxp.com
patch subject: [PATCH v2 10/11] i3c: master: svc: wait for Manual ACK/NACK Done before next step
config: x86_64-randconfig-161-20240817 (https://download.01.org/0day-ci/archive/20240818/202408180012.ifcIOjgX-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202408180012.ifcIOjgX-lkp@intel.com/

- Link to v2: https://lore.kernel.org/r/20240813-i3c_fix-v2-0-68fe4a050188@nxp.com

Changes in v2:
- add help function at i3c: master: svc: manually emit NACK/ACK for hotjoin F
Add below new fix patch
i3c: master: svc: fix possible assignment of the same address to two devices
i3c: master: svc: wait for Manual ACK/NACK Done before next step
i3c: master: svc: use spinlock_saveirq at svc_i3c_master_ibi_work()
i3c: master: svc: need check IBIWON for dynamtica address assign

- Link to v1: https://lore.kernel.org/r/20240724-i3c_fix-v1-0-bfa500b023d6@nxp.com

---
Frank Li (11):
      i3c: master: Remove i3c_dev_disable_ibi_locked(olddev) on device hotjoin
      i3c: master: Replace hard code 2 with macro I3C_ADDR_SLOT_BITS
      i3c: master: Extend address status bit to 4 and add I3C_ADDR_SLOT_EXT_INIT
      i3c: master: Fix dynamic address leak when 'assigned-address' is present
      i3c: master: Fix miss free init_dyn_addr at i3c_master_put_i3c_addrs()
      i3c: master: svc: use repeat start when IBI WIN happens
      i3c: master: svc: manually emit NACK/ACK for hotjoin
      i3c: master: svc: need check IBIWON for dynamtica address assign
      i3c: master: svc: use spinlock_saveirq at svc_i3c_master_ibi_work()
      i3c: master: svc: wait for Manual ACK/NACK Done before next step
      i3c: master: svc: fix possible assignment of the same address to two devices

 drivers/i3c/master.c                |  66 ++++++++++++++---------
 drivers/i3c/master/svc-i3c-master.c | 104 ++++++++++++++++++++++++++----------
 include/linux/i3c/master.h          |   8 ++-
 3 files changed, 125 insertions(+), 53 deletions(-)
---
base-commit: 41c196e567fb1ea97f68a2ffb7faab451cd90854
change-id: 20240724-i3c_fix-371bf8fa9e00

Best regards,
---
Frank Li <Frank.Li@nxp.com>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
